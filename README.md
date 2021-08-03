# log2pdf

A simple bash script to convert a git history of your project into a pretty pdf file.
[Take a look at the log generated for this project](https://github.com/vonopr/log2pdf/releases/download/latest/gitlog.pdf).


## Dependencies
To use the script you must have *pandoc* on your path and *latexmk* with *XeLaTex* engine available. You
may need to install some additional latex packages.

## Installation and usage

To produce a pdf document with a project's git history you should have
its local git repository on your computer.

Go to the root directory of the project's repository. Download the shell 
script *log2pdf.sh* and the metadata file *gitlog.yaml* from the latest release of
this project.

You may use *wget* for this purpose:
```bash
wget  https://github.com/vonopr/log2pdf/releases/download/latest/log2pdf.sh
wget  https://github.com/vonopr/log2pdf/releases/download/latest/gitlog.yaml
```

Grant execution rigths to the downloaded script and run it:
```bash
chmod +x log2pdf.sh
./log2pdf.sh
```

A pdf file *gitlog.pdf* with the project's history will be generated.

