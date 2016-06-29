Department of Conservation Latex Templates
==========================================

This package generates LaTeX class and style files to create documents in the 
format needed by the Department of Conservation

## Installing the package

### Checking LaTeX
Before you can install the package you must check to make sure you
have the right version of LaTeX installed. To do this run the command:

        xelatex --version

### Checking for the fonts

In order to use the package you will need to have the following fonts installed:

 - Archer
 - Helvetica Neue

To check if the font is present run `fc-list` and see if the font name is present
in the output.

All of the font files must be places in an appropriate location 
where the fonts can be seen by the system. Two possible locations for Linux 
systems are `~/.fonts` and `/usr/local/share/fonts`.


#### Manual Installation

The package will only build on 64-bit linux machines. This is an unfortunate 
side effect that comes from the latex version installed on the machines at the
moment being a little bit too old. As a result the biber binary and biblatex package
are included in this repository. 

In the case of manual installation, the following steps are required. 


**Get the correct biber binary**

If you are not on a x64 linux machine you will need to replace the biber binary in
the repository with the correct one for your OS and architecture. Binaries can be found
at http://sourceforge.net/projects/biblatex-biber/files/biblatex-biber/1.8/binaries/.
Note that you must use version 1.8.

**Build the package** 

Run `make all`

**Identify where you can install latex files**

On Linux and OS X run the command: `kpsepath tex | tr ':' '\n'` which will give a list
of directories which latex will look for files in. 

**Install the doc templates**

Create a directory called `doc` in the latex tree and place all the `.sty`
and `.cls` files into it. A common location for these would be 

 * /usr/share/texlive/texmf-dist/tex/latex/doc


**Install biblatex and biber**

On many systems this may not be necessary as the package may work using the 
system versions of biblatex and biber. If this is not the case then you will
need to find the biber binary on your system and replace it with the binary
that you downloaded earlier in `Get the correct biber binary`. You will also
need to find the `biblatex` directory in your latex system and replace it with
the biblatex directory included with this repository. The following command
will help you find the biblatex directory: `kpsewhich biblatex.sty`.


**Tell latex about the new package**

To ensure that LaTeX is aware of the new package you will need to run: `texhash`.

## Using the package

At this point the following latex classes will be available for you to use:

 - doc-report
 - doc-article

You will also have access to the beamer theme `doc` and the `doc` package.

## Documentation

General documentation is generated in the file `doc.pdf`. For each class format
there is an example tex file showing how it can be used. 

The example files are:

 - report.tex
 - presentation.tex
 - article.tex


## Incompatible Packages

The doc templates package will not work correctly with the following packages:

 - subfig (use subcaption instead)


