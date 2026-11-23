# Załączniki do pracy dyplomowej inżynierskiej

**Projekt i implementacja silnika 3D w języku Rust z wykorzystaniem architektury ECS**
Piotr Skrzyński, Politechnika Wrocławska, Wydział Informatyki i Telekomunikacji, 2026.
Opiekun: dr inż. Piotr Sobolewski.

## Zawartość

| Katalog / plik | Zawartość |
|---|---|
| `silnik/` | Kod źródłowy: ECS (`src/ecs.rs`), pula wątków, gra, renderer, shader Phonga, testy i programy pomiarowe. Opis w `silnik/README.md`. |
| `wyniki/` | Surowe dane pomiarów, protokoły testów i uruchomień oraz skrypty analizy (Python, bez bibliotek zewnętrznych). |
| `narzedzia/` | Skrypty PowerShell: kontrola kodu (`sprawdz.ps1`), pomiar kontrolny i odświeżenie protokołów. |
| `uruchom_gre.cmd` | Kompiluje i uruchamia grę demonstracyjną (dwukrotne kliknięcie). |
| `pomiar_wariantow.cmd` | Testy, Clippy, pomiar kontrolny czterech wariantów i zapis kodu maszynowego. |
| `odswiez_protokoly.cmd` | Walidacja GPU poza oknem, krótkie uruchomienie okna, przebiegi headless. |

## Wymagania

Rust (rustup) w wersji co najmniej 1.92; pomiary wykonano na 1.96.0. Projekt sprawdzono w systemie Windows 11.
Pierwsza kompilacja pobiera zależności z crates.io; ich wersje ustala `silnik/Cargo.lock`.

## Najważniejsze polecenia (w katalogu `silnik`)

```
cargo run --locked --release --bin survivor3d
cargo test --locked
cargo run --locked --release --no-default-features --bin benchmark
cargo run --locked --release --no-default-features --bin benchmark_warianty
cargo run --locked --release --no-default-features --bin load_probe
```

Sterowanie w grze: WASD lub strzałki, Spacja (pauza), R (restart), Escape (wyjście).

## Pliki wyników a rozdziały pracy

| Plik w `wyniki/` | Miejsce w pracy |
|---|---|
| `testy_calosc.txt`, `clippy.txt` | 31 testów i analiza statyczna (sekcja 8.2) |
| `gpu_walidacja.txt`, `gra.png`, `okno_smoke.txt` | Walidacja renderera i okna (sekcje 7.4, 8.2) |
| `headless_1/2/4.json`, `headless_dlugi.json` | Przebiegi symulacji bez okna (sekcja 8.2) |
| `ecs_benchmark.csv`, `ecs_summary.json`, `ecs_run_notes.json` | Tabela 8.1 i rysunek 8.1; pliki `*_pierwszy*` to odrzucony przebieg zakłócony kompilacją |
| `asm_benchmark.s` | Kod maszynowy pętli benchmarku (sekcja 8.4) |
| `ecs_warianty_*.csv`, `ecs_warianty_analiza.txt` | Pomiar kontrolny wariantów, tabela 8.2 (sekcja 8.5) |
| `load_probe.csv`, `load_probe_summary.json` | Czas kroku gry na CPU, tabela 8.3 (sekcja 8.7) |
| `srodowisko.json` | Sprzęt i wersje narzędzi (sekcja 8.1) |

Wykorzystanie narzędzi generatywnej AI opisano w sekcji 1.5 pracy.
