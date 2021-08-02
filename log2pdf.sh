echo \`\`\` > gitlog.md
git log --reverse --stat --format=\`\`\`%n##\ %s%n%n\`\`\`%n%n%H%n%ai%n%an\ \<%ae\>%n\`\`\`%n\ \ %b%nFiles\ changed:%n\`\`\` >> gitlog.md
echo \`\`\` >> gitlog.md
echo \\newpage >> gitlog.md
echo \\tableofcontents\\label{toc} >> gitlog.md

pandoc -s  gitlog.yaml gitlog.md  -o gitlog.tex
latexmk -pdf -pdfxe -f  gitlog.tex
