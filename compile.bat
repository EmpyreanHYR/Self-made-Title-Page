@echo off
setlocal

set FILE=title_page

echo ============================================================
echo  Title Page Compile Script
echo ============================================================
echo.

echo [1/3] Compiling ...
pdflatex -interaction=nonstopmode "%FILE%.tex" >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Failed. See %FILE%.log
    pause
    exit /b 1
)

echo [2/3] Compiling ...
pdflatex -interaction=nonstopmode "%FILE%.tex" >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Failed. See %FILE%.log
    pause
    exit /b 1
)

echo [3/3] Compiling ...
pdflatex -interaction=nonstopmode "%FILE%.tex" >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Failed. See %FILE%.log
    pause
    exit /b 1
)

echo.
echo [OK] Build succeeded: %FILE%.pdf
echo.

echo Cleaning auxiliary files ...
for %%e in (aux log out toc lof lot fls fdb_latexmk synctex.gz bbl blg nav snm vrb ilg ind idx xdv) do (
    if exist "%FILE%.%%e" (
        del "%FILE%.%%e"
        echo   Deleted: %FILE%.%%e
    )
)

echo.
echo [OK] Done. %FILE%.pdf is ready.
echo ============================================================
echo.

start "" "%FILE%.pdf"

endlocal
