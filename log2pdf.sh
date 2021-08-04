remote=$(git remote)
url=$(git remote get-url $remote)
project=$(basename $url .git)

echo '```' > gitlog.md
git log --reverse --stat --format='```%n## %s%n```%n%n%H%n%ai%n%an <%ae>%n```%n  %b%nFiles changed: %n```' >> gitlog.md
echo '```' >> gitlog.md
pandoc -f markdown-raw_tex gitlog.md  -o gitlog.md # use pandoc filter "markdown-raw_tex" to escape backslashes in commit messages

echo 'The history of' $project 'project generated from git log.'\
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
