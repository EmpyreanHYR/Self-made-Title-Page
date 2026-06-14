#!/usr/bin/env bash
# ============================================================
#  Title Page Compile Script (macOS / Linux)
#  用法：chmod +x compile.sh && ./compile.sh
# ============================================================
set -e

FILE="title_page"

echo "============================================================"
echo " Title Page Compile Script"
echo "============================================================"
echo

for i in 1 2 3; do
    echo "[$i/3] Compiling ..."
    pdflatex -interaction=nonstopmode "$FILE.tex" > /dev/null 2>&1 || {
        echo "[ERROR] Failed. See $FILE.log"
        exit 1
    }
done

echo
echo "[OK] Build succeeded: $FILE.pdf"
echo

echo "Cleaning auxiliary files ..."
for ext in aux log out toc lof lot fls fdb_latexmk synctex.gz bbl blg nav snm vrb ilg ind idx xdv; do
    if [ -f "$FILE.$ext" ]; then
        rm -f "$FILE.$ext"
        echo "  Deleted: $FILE.$ext"
    fi
done

echo
echo "[OK] Done. $FILE.pdf is ready."
echo "============================================================"
echo

# 尝试用系统默认程序打开 PDF
if command -v open &> /dev/null; then
    open "$FILE.pdf"          # macOS
elif command -v xdg-open &> /dev/null; then
    xdg-open "$FILE.pdf"      # Linux
fi
