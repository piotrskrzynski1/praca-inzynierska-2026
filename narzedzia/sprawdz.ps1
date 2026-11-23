param([switch]$BezGrafiki)
$ErrorActionPreference = 'Stop'
$projectRoot = Split-Path -Parent $PSScriptRoot
$engineRoot = Join-Path $projectRoot 'silnik'
Push-Location -LiteralPath $engineRoot
try {
    cargo fmt -- --check
    if ($LASTEXITCODE -ne 0) { throw 'Niepoprawne formatowanie kodu' }
    if ($BezGrafiki) {
        cargo test --locked --no-default-features
        if ($LASTEXITCODE -ne 0) { throw 'Niepowodzenie testów' }
        cargo clippy --locked --no-default-features --all-targets -- -D warnings
    } else {
        cargo test --locked
        if ($LASTEXITCODE -ne 0) { throw 'Niepowodzenie testów' }
        cargo clippy --locked --all-targets -- -D warnings
    }
    if ($LASTEXITCODE -ne 0) { throw 'Niepowodzenie analizy statycznej' }
} finally {
    Pop-Location
}
