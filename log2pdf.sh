echo '```' > gitlog.md
git log --reverse --stat --format='```%n## %s%n%n```%n%n%H%n%ai%n%an <%ae>%n```%n  %b%nFiles changed: %n```' >> gitlog.md
echo '```' >> gitlog.md
pandoc -f markdown-raw_tex gitlog.md  -o gitlog.md # use pandoc filter "markdown-raw_tex" to escape backslashes in commit messages

echo '\newpage' > toc.md
echo '\tableofcontents\label{toc}' >> toc.md

dos2unix gitlog.md
dos2unix toc.md

pandoc -s  gitlog.yaml gitlog.md toc.md  -o gitlog.tex
latexmk -pdf -pdfxe -f  gitlog.tex

rm gitlog.md
rm toc.md
