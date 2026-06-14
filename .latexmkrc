# .latexmkrc — latexmk 配置文件
# 用法：latexmk title_page.tex
# 清理：latexmk -c

# 使用 pdflatex
$pdf_mode = 1;
$pdflatex = 'pdflatex -interaction=nonstopmode %O %S';

# 编译次数（交叉引用需要多次）
$max_repeat = 3;

# 清理时删除的扩展名
$clean_ext = 'aux log out toc lof lot fls fdb_latexmk synctex.gz bbl blg nav snm vrb ilg ind idx xdv';
