@echo off
setlocal
pushd "%~dp0silnik"
if errorlevel 1 goto directory_error

set "gameCargo=%USERPROFILE%\.cargo\bin\cargo.exe"
if exist "%gameCargo%" goto build
where cargo.exe >nul 2>&1
if errorlevel 1 goto without_cargo
set "gameCargo=cargo.exe"

:build
echo Przygotowuje gre. Pierwsza kompilacja moze potrwac.
"%gameCargo%" rustc --locked --release --bin survivor3d -- -C target-cpu=native
if errorlevel 1 goto build_error
goto run

:without_cargo
if exist "target\release\survivor3d.exe" goto run
echo Brak programu gry i Cargo. Zainstaluj Rust i uruchom ponownie.
goto failed

:run
echo Uruchamiam gre...
"target\release\survivor3d.exe" %*
if errorlevel 1 goto game_error
popd
exit /b 0

:build_error
echo Kompilacja nie powiodla sie. Sprawdz komunikat powyzej.
goto failed

:game_error
echo Gra zakonczyla sie bledem. Sprawdz komunikat powyzej.
goto failed

:directory_error
echo Nie znaleziono katalogu silnik obok tego skryptu.
pause
exit /b 1

:failed
popd
pause
exit /b 1
