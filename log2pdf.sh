remote=$(git remote)
url=$(git remote get-url $remote)
project=$(basename $url .git)
https_url=$(url1=${url/:/"/"}; url2=${url1/git@/https://};echo $url2)

git log --reverse  --format='%n## %s%n```{=latex}%n%n\marginnote{\texttt{%h}}%n%n```%n%n%b%n %n%n' > gitlog.md
pandoc -f markdown-raw_tex gitlog.md  -o gitlog.md # use pandoc filter "markdown-raw_tex" to escape backslashes in commit messages

echo 'The history of \href{'$https_url'}{'$project'} project generated from git log.'\
'\textit{\hyperref[toc]'\
'{The table of contents is at the end of the document.}}' > intro.md

echo '\newpage' > toc.md
echo '\tableofcontents\label{toc}' >> toc.md
echo '
---
title: The git-log of \textsc{'$project'} project
...' > project.yaml

pandoc -s project.yaml gitlog.yaml  intro.md gitlog.md toc.md -o gitlog.tex
latexmk -pdf -pdfxe gitlog.tex

rm intro.md gitlog.md toc.md project.yaml
