# Silnik 3D z archetypowym ECS

Mały prototyp do pracy inżynierskiej Piotra Skrzyńskiego. Kod oddziela magazyn komponentów, pulę wątków, reguły gry i komunikację z GPU. Gra przedstawia arenę w 3D; postać porusza się w płaszczyźnie XZ i automatycznie kieruje salwę ku najbliższemu przeciwnikowi. Pokonani przeciwnicy pozostawiają zielone punkty doświadczenia. Zebranie ich podnosi poziom, skraca odstęp między salwami i okresowo dodaje pocisk do salwy.

## Uruchomienie

W tym katalogu:

```powershell
cargo run --locked --release --bin survivor3d
```

Wymagany jest Rust 1.92 lub nowszy, linker dla wybranego toolchainu oraz urządzenie i sterownik graficzny obsługiwane przez wgpu. Na Windows z toolchainem MSVC potrzebne są narzędzia C++ programu Visual Studio Build Tools. Projekt sprawdzono na Rust 1.92.0 i Windows 11; plik `../wyniki/srodowisko.json` zawiera konfigurację komputera pomiarowego. Pierwsze pobranie zależności wymaga dostępu do crates.io. Plik `Cargo.lock` ustala także wersje zależności pośrednich. Po pobraniu zależności do poleceń Cargo można dodać `--offline`.

WASD lub strzałki sterują ruchem. Spacja wstrzymuje i wznawia grę, R rozpoczyna ją od nowa, Escape zamyka okno. Panel pokazuje zdrowie, wynik, poziom i postęp doświadczenia oraz udostępnia przyciski pauzy i restartu. Utrata fokusu wstrzymuje grę. Sześciany są celową prostą reprezentacją obiektów, bez zależności od zewnętrznych modeli i tekstur.

Każdy zebrany punkt daje 1 XP. Awans z poziomu `L` wymaga `5 * L` XP i zużywa ten próg; nadwyżka pozostaje. Odstęp między salwami wynosi `max(0.30 * 0.88^(L-1), 0.09)` sekundy. Poziomy 1, 4, 7, 10 i 13 odblokowują odpowiednio 1, 2, 3, 4 i 5 pocisków. Pociski rozchodzą się symetrycznie w płaszczyźnie XZ: sąsiednie kierunki dzieli 10 stopni, zatem pięć pocisków obejmuje kąt 40 stopni. Przy salwie jednego pocisku kierunek odpowiada celowi. Niezebrany punkt doświadczenia znika po 60 sekundach czasu symulacji.

Gra rozpoczyna się z 12 przeciwnikami. Dla czasu symulacji `t` w sekundach wielkość fali wynosi `min(3 + 4 * floor(t / 15), 100)`, a odstęp między falami `max(1.2 - 0.008 * t, 0.30)` sekundy. Limit wynosi 10 000 jednocześnie żywych przeciwników. Wzrasta napływ przeciwników; faktyczna liczba żywych zależy również od trafień i nie musi rosnąć w każdym kroku. Gra kończy się po utracie zdrowia. Panel pokazuje wielkość i odstęp fali, pociski w salwie oraz poziom następnego ulepszenia salwy.

## Sprawdzenie renderera

```powershell
cargo run --locked --release --bin survivor3d -- --frames 120
cargo run --locked --release --bin survivor3d -- --offscreen ../wyniki/gra.png
```

`--frames 120` otwiera zwykłe okno i kończy proces po 120 zdarzeniach rysowania. Jest testem uruchomienia aplikacji, bez automatycznego naciskania klawiszy. `--offscreen` tworzy rzeczywisty obraz sceny i panelu za pomocą GPU bez widocznego okna, zapisuje PNG i sprawdza błędy walidacji wgpu. Obraz nie potwierdza obsługi interakcji użytkownika. Wyniki wykonanych sprawdzeń zapisano w `../wyniki/okno_smoke.txt` i `../wyniki/gpu_walidacja.txt`.

## Weryfikacja bez okna

```powershell
cargo test --locked --no-default-features
cargo run --locked --release --no-default-features --bin headless -- --steps 1800 --workers 2
cargo run --locked --release --no-default-features --bin benchmark
cargo run --locked --release --no-default-features --bin benchmark_warianty
cargo run --locked --release --no-default-features --bin load_probe
```

`headless` wykonuje reguły gry i wypisuje podsumowanie JSON. Nie mierzy GPU ani całkowitego czasu klatki okna. `benchmark` porównuje aktualizację położenia w ECS z pętlą nad `Vec<Body>`. Drugi wariant jest prostą tablicą struktur, a nie pełnym silnikiem obiektowym. Alokacja encji nie wchodzi do mierzonego odcinka. Surowe próbki CSV zawierają faktyczny czas każdej serii.

Pomiar obejmuje 1 000, 10 000 i 100 000 encji: 100 kroków rozgrzewki, 15 próbek po 100 kroków dla każdego wariantu i naprzemienną kolejność wariantów. Sumy kontrolne sprawdzają zgodność obliczeń. Końcowe próbki i statystyki znajdują się w `../wyniki/ecs_benchmark.csv` oraz `../wyniki/ecs_summary.json`. Dla 100 000 encji mediana kroku wyniosła 127 509 ns dla ECS i 83 141 ns dla Vec AoS. W tej konfiguracji prosty Vec był szybszy. Kod maszynowy wskazuje przyczynę: przy domyślnym celu x86-64 kompilator wektoryzuje pętlę po 12-bajtowych komponentach `[f32; 3]` z wieloma instrukcjami przestawiającymi dane, a w samej pętli nie ma operacji ECS. Program `benchmark_warianty` dodaje te same kolumny bez ECS (pętla po encjach i po ciągłych `f32`); `../pomiar_wariantow.cmd` uruchamia go także z `-C target-cpu=native`. W pomiarze z 21.11.2026 ECS i te same kolumny bez ECS miały jednakowy czas, kolumny jako ciągłe `f32` były 1,4–2,3 raza szybsze od AoS, a po kompilacji z `-C target-cpu=native` ECS był 2,3–6 razy szybszy od AoS (`../wyniki/ecs_warianty_analiza.txt`).

Pełne sprawdzenie obejmuje:

```powershell
cargo fmt -- --check
cargo test --locked
cargo clippy --locked --all-targets -- -D warnings
```

Aktualny zestaw obejmuje 16 testów ECS i puli oraz 15 testów reguł gry, łącznie 31 poprawnych testów. Protokoły znajdują się w `../wyniki/`. Testy gry sprawdzają między innymi awans, liczbę i symetrię pocisków, rosnącą intensywność fal, usuwanie pocisku, jednokrotne zaliczenie trafienia, granicę areny oraz zgodność ścieżek obliczeń sekwencyjnych i równoległych.

`load_probe` jest osobnym pomiarem czasu `Game::step` na CPU. Przygotowuje scenariusze ze 100, 1 000 i 5 000 przeciwnikami początkowymi, jednym lub czterema pracownikami i poziomem początkowym 13. W każdym scenariuszu przewiduje 60 kroków rozgrzewki i 300 próbek, łącznie 1 800 wierszy CSV. Fale, trafienia i usuwanie pozostają aktywne, dlatego CSV zapisuje rzeczywiste liczby encji przed i po kroku. Przed każdą próbką zdrowie jest przywracane do 100 poza mierzonym odcinkiem, aby śmierć nie zatrzymała symulacji; to kontrolowany, praktycznie nieśmiertelny scenariusz diagnostyczny. Pomiar nie obejmuje renderowania, GPU, liczenia encji, zapisu CSV ani przywracania zdrowia. Uruchomienie programu nie porównuje ECS z innym magazynem i nie dowodzi przewagi ECS.

Zarejestrowany przebieg `../wyniki/load_probe.csv` i analiza `../wyniki/load_probe_summary.json` obejmują 1 800 próbek. Dla 5 000 przeciwników początkowych mediana kroku wyniosła 81,75 µs przy jednym pracowniku oraz 105,3 µs przy czterech; rzeczywista liczba przeciwników w próbkach wahała się od 4 728 do 4 985. Czterech pracowników nie przyspieszyło całego kroku w tej krótkiej serii. Nie stosowano losowej kolejności scenariuszy, a działanie usług systemowych pozostaje czynnikiem zakłócającym.

## Mapa kodu

| Plik | Odpowiedzialność |
| --- | --- |
| `src/ecs.rs` | Identyfikatory encji, archetypy, kolumny, migracja i zapytania |
| `src/thread_pool.rs` | Kolejka zadań, pracownicy, wyniki i zamykanie puli |
| `src/game.rs` | Komponenty gry, ruch, fale, strzelanie, kolizje, XP, awans i wynik |
| `src/renderer.rs` | Zasoby GPU, kamera, instancje, głębokość, potok i panel egui |
| `shaders/phong.wgsl` | Transformacja wierzchołków i oświetlenie Phonga |
| `src/main.rs` | Okno, wejście, stały krok symulacji, pauza i obsługa błędów powierzchni |
| `tests/core.rs` | Testy publicznego API ECS i puli wątków |
| `src/bin/benchmark.rs` | Pomiar aktualizacji Position i Velocity |
| `src/bin/benchmark_warianty.rs` | Ten sam pomiar dla ECS, kolumn bez ECS, kolumn jako `f32` i AoS |
| `src/bin/headless.rs` | Symulacja bez okna |
| `src/bin/load_probe.rs` | Pomiar całego kroku CPU w kontrolowanych scenariuszach obciążenia |

## Powiązanie z zadaniami pracy

| Zadanie z zakresu pracy | Miejsce opisu, implementacji lub dowodu |
| --- | --- |
| 1. Literatura i istniejące rozwiązania | Część teoretyczna pracy w katalogu `../tekst` oraz bibliografia dokumentu |
| 2. Wymagania, stos i architektura | Część projektowa pracy, diagramy w dokumencie, `Cargo.toml` i mapa modułów powyżej |
| 3. Archetypowy ECS | `src/ecs.rs`; testy migracji, zapytań i uchwytów w `tests/core.rs` |
| 4. Renderer 3D i Phong | `src/renderer.rs`, `shaders/phong.wgsl`; `../wyniki/gpu_walidacja.txt` i `../wyniki/gra.png` |
| 5. Pula wątków i diagnostyka | `src/thread_pool.rs`, paczki obliczeń w `src/game.rs`, panel w `src/renderer.rs` |
| 6. Gra demonstracyjna | `src/game.rs` i `src/main.rs`: fale, ruch, ostrzał, XP, awans i koniec gry |
| 7. Testy i pomiary | `tests/core.rs`, testy modułu gry, `src/bin/benchmark.rs`; protokoły w `../wyniki` |
| 8. Analiza decyzji i wyników | `../wyniki/ecs_summary.json`, `../wyniki/ecs_run_notes.json` i rozdział wyników pracy |
| 9. Wnioski i dalszy rozwój | Rozdział podsumowania pracy; skrót ograniczeń w tym README oraz `../OBRONA.md` |

## Jak działa ECS

`Entity` zawiera indeks slotu i generację. Slot przechowuje lokalizację w archetypie. Archetyp grupuje encje o tym samym zestawie typów komponentów, niezależnie od kolejności ich podania. Każda kolumna jest prawdziwym `Vec<T>`; obiekty `Any` służą do wymazania typu na granicy magazynu. W zapytaniu odzyskuje się typ kolumny przed przejściem po elementach.

Usunięcie wiersza wykonuje `swap_remove` na wszystkich kolumnach i na identyfikatorach. Lokalizacja przeniesionej encji jest natychmiast poprawiana. Dodanie lub usunięcie typu komponentu przenosi encję między archetypami. Zastąpienie wartości istniejącego komponentu nie wymaga migracji. Po usunięciu encji generacja rośnie, więc stary uchwyt nie wskazuje nowej encji w ponownie użytym slocie.

Zapytanie `for_each2_mut` odrzuca powtórzenie tego samego typu. Dwa różne komponenty pobiera z rozłącznych części tablicy kolumn przez `split_at_mut`. ECS nie zawiera własnych bloków `unsafe`. API celowo obsługuje zapytania dwóch typów; nie implementuje ogólnego języka zapytań.

## Jak działa współbieżność

`World` jest modyfikowany przez główny wątek. Przy większej liczbie przeciwników ich pozycje są kopiowane do paczek. Pracownicy obliczają kierunki ruchu na własnych danych i zwracają wyniki. Dopiero główny wątek zapisuje prędkości do ECS. To prosty podział zadań z barierą na końcu, bez automatycznego planowania systemów.

Pula wykorzystuje `std::thread`, `mpsc`, `Arc` i `Mutex`. Blokada chroni pobranie zadania, a wykonywanie odbywa się poza blokadą. Zamykanie puli kończy przyjmowanie nowych zadań i czeka na wykonanie przyjętych. Panika zadania w trybie odwijania stosu jest przekazywana w wyniku; nie zatrzymuje pracownika. Nie jest to mechanizm odzyskiwania po abort ani po zakleszczeniu zadania.

Wspólny odbiornik chroniony mutexem szereguje pobieranie zadań. Brakuje lokalnych kolejek pracowników i przejmowania zadań. Kopiowanie danych do paczek, komunikacja kanałami i oczekiwanie na wszystkie wyniki stanowią dodatkowy koszt. Próg 128 przeciwników jest prostą decyzją implementacyjną; nie został wykazany jako optymalny próg przyspieszenia.

## Biblioteki

| Biblioteka | Cel |
| --- | --- |
| `wgpu` | Dostęp do akcelerowanego sprzętowo API i walidacja potoku GPU |
| `winit` | Okno oraz zdarzenia klawiatury i zmiany rozmiaru |
| `glam` | Wektory i macierze kamery |
| `bytemuck` | Kontrolowana konwersja struktur buforów na bajty |
| `egui` | Panel użytkownika i diagnostyki |
| `egui-winit` | Przekazanie zdarzeń okna do panelu |
| `egui-wgpu` | Rysowanie panelu w tym samym oknie |
| `pollster` | Oczekiwanie na asynchroniczną inicjalizację urządzenia GPU |
| `png` | Zapis obrazu w teście renderowania poza oknem |

ECS oraz pula wątków korzystają z biblioteki standardowej. Projekt nie zależy od Bevy, hecs, Rayon, gotowego silnika fizyki ani systemu zasobów.

Kod projektu obejmuje wymienione moduły, shader, programy pomocnicze i testy. Okno, warstwa GPU, panel i matematyka wykorzystują biblioteki z tabeli. `Cargo.lock` obejmuje również ich zależności pośrednie. Brak `unsafe` w źródłach projektu nie oznacza braku tego mechanizmu w bibliotekach zewnętrznych i sterownikach.

## Granice prototypu

Renderer używa prostych siatek, bufora głębokości i instancjonowania. Oświetlenie Phonga nie jest modelem PBR. Kolizje gry są testami odległości w płaszczyźnie XZ, a nie symulacją brył sztywnych. Brakuje cieni, importu modeli, animacji, dźwięku, zapisu stanu i edytora scen. Koszt migracji w ECS obejmuje chwilowe alokacje `Box`; nie jest częścią pomiaru iteracji. Pula wątków i kopiowanie paczek mogą zwiększyć czas aktualizacji niewielkich zadań. Wyniki trzeba oceniać dla konkretnego obciążenia.

Pętla okna używa stałego kroku 1/60 s i ogranicza nadrabianie czasu po długiej przerwie. Po minimalizacji czeka na zdarzenia zamiast stale żądać rysowania. Panel wyświetla wygładzony czas między zdarzeniami rysowania oraz jego odwrotność jako FPS; pomiar obejmuje oczekiwanie na VSync i nie jest osobnym pomiarem CPU ani GPU. Kolizje pocisków z przeciwnikami mają koszt proporcjonalny do iloczynu ich liczebności. Gra ogranicza liczbę przeciwników do 10 000; benchmark 100 000 encji dotyczy samego ECS.

## Ręczna lista sprawdzeń interakcji

Poniższa lista jest przeznaczona do wykonania przed demonstracją. Nie stanowi protokołu już przeprowadzonych testów interfejsu.

- [ ] Sprawdzić ruch WASD i strzałkami, ruch po przekątnej oraz zatrzymanie na granicy areny.
- [ ] Wstrzymać i wznowić grę Spacją oraz przyciskami panelu; w pauzie sprawdzić niezmienny czas i położenia.
- [ ] Zebrać zielone punkty XP, uzyskać awans i sprawdzić wzrost poziomu oraz częstotliwości salw; na poziomach 4, 7, 10 i 13 sprawdzić dodatkowy pocisk i symetryczny rozrzut.
- [ ] Obserwować kolejne fale i sprawdzić wskazania wielkości oraz odstępu fali; uwzględnić zabijanie przeciwników przy ocenie liczby żywych.
- [ ] Doprowadzić do końca gry, sprawdzić wyłączenie pauzy i uruchomić nową grę klawiszem R oraz przyciskiem.
- [ ] Zmienić rozmiar okna, zminimalizować je, przywrócić i sprawdzić poprawny obraz oraz brak ciągłego obciążenia podczas minimalizacji.
- [ ] Przełączyć fokus do innej aplikacji; sprawdzić pauzę oraz brak pozostawionego wciśniętego klawisza.
- [ ] Przesunąć i zwinąć panel oraz zamknąć aplikację przez Escape i przycisk okna.
