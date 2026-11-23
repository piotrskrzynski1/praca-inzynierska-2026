param(
    [int]$TestKlatek = 0,
    [switch]$BezPauzy
)

$ErrorActionPreference = 'Stop'
$engineDirectory = Join-Path $PSScriptRoot 'silnik'
$gameExecutable = Join-Path $engineDirectory 'target/release/survivor3d.exe'
$launchExitCode = 0
$changedDirectory = $false

try {
    Push-Location -LiteralPath $engineDirectory
    $changedDirectory = $true

    # Menu "Uruchom za pomoca PowerShell" moze miec starsza zmienna PATH.
    $cargoExecutable = Join-Path $env:USERPROFILE '.cargo/bin/cargo.exe'
    if (-not (Test-Path -LiteralPath $cargoExecutable -PathType Leaf)) {
        $cargoCommand = Get-Command cargo.exe -CommandType Application -ErrorAction SilentlyContinue
        $cargoExecutable = if ($cargoCommand) { $cargoCommand.Source } else { $null }
    }

    if ($cargoExecutable) {
        Write-Host 'Przygotowuje gre. Pierwsza kompilacja moze potrwac.'
        & $cargoExecutable rustc --locked --release --bin survivor3d -- -C target-cpu=native
        if ($LASTEXITCODE -ne 0) { throw 'Kompilacja nie powiodla sie. Sprawdz komunikat powyzej.' }
    } elseif (-not (Test-Path -LiteralPath $gameExecutable -PathType Leaf)) {
        throw 'Brak programu gry i Cargo. Zainstaluj Rust, a nastepnie uruchom skrypt ponownie.'
    }

    Write-Host 'Uruchamiam gre...'
    if ($TestKlatek -gt 0) {
        & $gameExecutable --frames $TestKlatek
    } else {
        & $gameExecutable
    }
    if ($LASTEXITCODE -ne 0) { throw "Gra zakonczyla sie z kodem bledu $LASTEXITCODE." }
} catch {
    $launchExitCode = 1
    Write-Host ''
    Write-Host ('Nie udalo sie uruchomic gry: ' + $_.Exception.Message) -ForegroundColor Red
    if (-not $BezPauzy) { [void](Read-Host 'Nacisnij Enter, aby zamknac okno') }
} finally {
    if ($changedDirectory) { Pop-Location }
}

exit $launchExitCode
