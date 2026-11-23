param([switch]$BezPauzy)
# Pomiar wariantow integracji polozenia (benchmark_warianty) i kontrole projektu.
# Kolejnosc: srodowisko, formatowanie, testy, Clippy, oba pomiary, kod maszynowy, analiza.
# Pomiary startuja dopiero po zakonczeniu wszystkich kompilacji.
# Wyniki trafiaja do katalogu wyniki; dzienniki kompilacji do wyniki/logi_pomiar_wariantow.
# Skrypt przygotowano z pomoca narzedzia Claude (Anthropic).

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$engine = Join-Path $root 'silnik'
$results = Join-Path $root 'wyniki'
$logs = Join-Path $results 'logi_pomiar_wariantow'
$exitCode = 0

function Find-Tool([string]$Name) {
    # Menu "Uruchom za pomoca PowerShell" moze miec starsza zmienna PATH.
    $candidate = Join-Path $env:USERPROFILE ".cargo/bin/$Name.exe"
    if (Test-Path -LiteralPath $candidate -PathType Leaf) { return $candidate }
    $command = Get-Command "$Name.exe" -CommandType Application -ErrorAction SilentlyContinue
    if ($command) { return $command.Source }
    throw "Nie znaleziono $Name.exe. Zainstaluj Rust (rustup) i uruchom skrypt ponownie."
}

function Invoke-Step([string]$Title, [string]$Exe, [string]$Arguments, [string]$StdOut, [string]$StdErr) {
    Write-Host ''
    Write-Host "== $Title" -ForegroundColor Cyan
    $options = @{
        FilePath = $Exe
        WorkingDirectory = $engine
        NoNewWindow = $true
        PassThru = $true
        RedirectStandardOutput = $StdOut
        RedirectStandardError = $StdErr
    }
    if ($Arguments) { $options.ArgumentList = $Arguments }
    # Bez -Wait: Start-Process -Wait czeka tez na procesy potomne, a linker MSVC
    # zostawia w tle mspdbsrv.exe na kilka minut. Czekamy tylko na sam proces.
    $process = Start-Process @options
    $null = $process.Handle
    $process.WaitForExit()
    if ($process.ExitCode -ne 0) {
        Get-Content -LiteralPath $StdErr -Tail 30 | Write-Host
        Get-Content -LiteralPath $StdOut -Tail 30 | Write-Host
        throw "$Title zakonczone kodem $($process.ExitCode). Szczegoly: $StdErr"
    }
    Write-Host 'OK' -ForegroundColor Green
}

try {
    New-Item -ItemType Directory -Force -Path $logs | Out-Null
    $cargo = Find-Tool 'cargo'
    $rustc = Find-Tool 'rustc'

    Write-Host '== Zapis srodowiska (wyniki/srodowisko.json)' -ForegroundColor Cyan
    $info = [ordered]@{
        date_local = (Get-Date -Format 'yyyy-MM-dd HH:mm')
        computer = $env:COMPUTERNAME
        cpu = @(Get-CimInstance Win32_Processor | Select-Object Name, NumberOfCores, NumberOfLogicalProcessors, MaxClockSpeed)
        gpu = @(Get-CimInstance Win32_VideoController | Select-Object Name, DriverVersion)
        os = @(Get-CimInstance Win32_OperatingSystem | Select-Object Caption, Version, TotalVisibleMemorySize)
        rustc = (& $rustc -vV) -join '; '
        cargo = (& $cargo -V) -join ''
    }
    $info | ConvertTo-Json -Depth 4 | Set-Content -LiteralPath (Join-Path $results 'srodowisko.json') -Encoding UTF8
    Write-Host 'OK' -ForegroundColor Green

    Invoke-Step 'Formatowanie (cargo fmt --check)' $cargo 'fmt -- --check' `
        (Join-Path $logs 'fmt_stdout.txt') (Join-Path $logs 'fmt_stderr.txt')
    Invoke-Step 'Testy (cargo test --locked)' $cargo 'test --locked' `
        (Join-Path $results 'testy_calosc.txt') (Join-Path $logs 'testy_kompilacja.txt')
    Invoke-Step 'Analiza statyczna (cargo clippy)' $cargo 'clippy --locked --all-targets -- -D warnings' `
        (Join-Path $logs 'clippy_stdout.txt') (Join-Path $results 'clippy.txt')

    Invoke-Step 'Kompilacja benchmark_warianty (domyslny cel x86-64)' $cargo `
        'build --locked --release --no-default-features --bin benchmark_warianty' `
        (Join-Path $logs 'build_domyslny_stdout.txt') (Join-Path $logs 'build_domyslny.txt')
    $env:RUSTFLAGS = '-C target-cpu=native'
    try {
        Invoke-Step 'Kompilacja benchmark_warianty (-C target-cpu=native)' $cargo `
            'build --locked --release --no-default-features --bin benchmark_warianty --target-dir target-native' `
            (Join-Path $logs 'build_native_stdout.txt') (Join-Path $logs 'build_native.txt')
    } finally {
        Remove-Item Env:RUSTFLAGS -ErrorAction SilentlyContinue
    }
    Invoke-Step 'Kod maszynowy oryginalnego benchmarku (--emit asm)' $cargo `
        'rustc --locked --release --no-default-features --bin benchmark --target-dir target-asm -- --emit asm' `
        (Join-Path $logs 'asm_stdout.txt') (Join-Path $logs 'asm.txt')
    $asm = Get-ChildItem -Path (Join-Path $engine 'target-asm/release/deps') -Filter 'benchmark*.benchmark.*.s' |
        Sort-Object LastWriteTime -Descending | Select-Object -First 1
    if ($asm) {
        Copy-Item -LiteralPath $asm.FullName -Destination (Join-Path $results 'asm_benchmark.s') -Force
        Write-Host "Zapisano wyniki/asm_benchmark.s" -ForegroundColor Green
    } else {
        Write-Host 'Nie znaleziono pliku .s benchmarku; pomiar trwa dalej.' -ForegroundColor Yellow
    }

    Write-Host ''
    Write-Host 'Kompilacje zakonczone. Teraz pomiary: nie uzywaj komputera przez okolo minute.' -ForegroundColor Yellow
    Start-Sleep -Seconds 10
    Invoke-Step 'Pomiar: domyslny cel x86-64' (Join-Path $engine 'target/release/benchmark_warianty.exe') '' `
        (Join-Path $results 'ecs_warianty_domyslny.csv') (Join-Path $results 'ecs_warianty_domyslny_metadata.txt')
    Start-Sleep -Seconds 5
    Invoke-Step 'Pomiar: -C target-cpu=native' (Join-Path $engine 'target-native/release/benchmark_warianty.exe') '' `
        (Join-Path $results 'ecs_warianty_native.csv') (Join-Path $results 'ecs_warianty_native_metadata.txt')

    # Analiza jest opcjonalna: python.exe bywa jedynie skrotem do Microsoft Store.
    $python = Get-Command py.exe -CommandType Application -ErrorAction SilentlyContinue
    if ($python) {
        try {
            Invoke-Step 'Analiza wynikow (analizuj_warianty.py)' $python.Source `
                '-3 ..\wyniki\analizuj_warianty.py domyslny=..\wyniki\ecs_warianty_domyslny.csv native=..\wyniki\ecs_warianty_native.csv' `
                (Join-Path $results 'ecs_warianty_analiza.txt') (Join-Path $logs 'analiza_stderr.txt')
            Get-Content -LiteralPath (Join-Path $results 'ecs_warianty_analiza.txt') -TotalCount 12 | Write-Host
        } catch {
            Write-Host ('Analiza pominieta: ' + $_.Exception.Message) -ForegroundColor Yellow
        }
    } else {
        Write-Host 'Brak Pythona (py.exe); CSV mozna przeanalizowac pozniej skryptem wyniki/analizuj_warianty.py.' -ForegroundColor Yellow
    }

    Write-Host ''
    Write-Host 'Zakonczono. Wyniki zapisano w katalogu wyniki.' -ForegroundColor Green
} catch {
    $exitCode = 1
    Write-Host ''
    Write-Host ('Blad: ' + $_.Exception.Message) -ForegroundColor Red
} finally {
    if (-not $BezPauzy) { [void](Read-Host 'Nacisnij Enter, aby zamknac okno') }
}
exit $exitCode
