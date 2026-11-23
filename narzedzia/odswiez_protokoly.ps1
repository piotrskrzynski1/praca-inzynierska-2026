param([switch]$BezPauzy)
# Odswieza protokoly uruchomien opisane w pracy: walidacje offscreen (gra.png),
# krotkie uruchomienie okna oraz przebiegi headless dla 1, 2 i 4 pracownikow
# i dlugi przebieg bez przywracania zdrowia. Wyniki trafiaja do katalogu wyniki.
# Skrypt przygotowano z pomoca narzedzia Claude (Anthropic).

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$engine = Join-Path $root 'silnik'
$results = Join-Path $root 'wyniki'
$logs = Join-Path $results 'logi_protokoly'
$exitCode = 0

function Find-Tool([string]$Name) {
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
    # Bez -Wait: linker MSVC zostawia w tle mspdbsrv.exe; czekamy tylko na sam proces.
    $process = Start-Process @options
    $null = $process.Handle
    $process.WaitForExit()
    if ($process.ExitCode -ne 0) {
        Get-Content -LiteralPath $StdErr -Tail 30 | Write-Host
        Get-Content -LiteralPath $StdOut -Tail 30 | Write-Host
        throw "$Title zakonczone kodem $($process.ExitCode). Szczegoly: $StdErr"
    }
    Get-Content -LiteralPath $StdOut -TotalCount 3 | Write-Host
    Write-Host 'OK' -ForegroundColor Green
}

try {
    New-Item -ItemType Directory -Force -Path $logs | Out-Null
    $cargo = Find-Tool 'cargo'
    $game = Join-Path $engine 'target/debug/survivor3d.exe'
    $headless = Join-Path $engine 'target/debug/headless.exe'

    Invoke-Step 'Kompilacja gry i programu headless' $cargo 'build --locked --bin survivor3d --bin headless' `
        (Join-Path $logs 'build_stdout.txt') (Join-Path $logs 'build.txt')
    Invoke-Step 'Walidacja GPU poza oknem (wyniki/gra.png)' $game '--offscreen ..\wyniki\gra.png' `
        (Join-Path $results 'gpu_walidacja.txt') (Join-Path $logs 'offscreen_stderr.txt')
    Write-Host ''
    Write-Host 'Za chwile na 2-3 sekundy otworzy sie okno gry i samo sie zamknie.' -ForegroundColor Yellow
    Invoke-Step 'Uruchomienie okna przez 120 klatek' $game '--frames 120' `
        (Join-Path $results 'okno_smoke.txt') (Join-Path $logs 'okno_stderr.txt')
    foreach ($workers in 1, 2, 4) {
        Invoke-Step "Headless: 1800 krokow, $workers pracownik(i)" $headless "--steps 1800 --workers $workers" `
            (Join-Path $results "headless_$workers.json") (Join-Path $logs "headless_$workers.txt")
    }
    Invoke-Step 'Headless: dlugi przebieg 9000 krokow, 4 pracownikow' $headless '--steps 9000 --workers 4' `
        (Join-Path $results 'headless_dlugi.json') (Join-Path $logs 'headless_dlugi.txt')

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
