echo \`\`\` > gitlog.md
git log --reverse --stat --format=\`\`\`%n##\ %s%n%n\`\`\`%n%n%H%n%ai%n%an\ \<%ae\>%n\`\`\`%n\ \ %b%nFiles\ changed:%n\`\`\` >> gitlog.md
echo \`\`\` >> gitlog.md
echo \\newpage >> gitlog.md
echo \\tableofcontents\\label{toc} >> gitlog.md

pandoc --pdf-engine=lualatex -s  gitlog.yaml gitlog.md  -o gitlog.pdf
