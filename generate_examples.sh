#!/usr/bin/env bash
set -euox pipefail

# setup
cp oist_thesis.cls Examples/oist_thesis.cls
cd Examples
mv Thesis.tex Backup_Thesis.tex
rm -f Thesis.* # remove auxillary files
cp Backup_Thesis.tex Thesis.tex

# Thesis final version
pdflatex Thesis.tex
bibtex Thesis.aux
pdflatex Thesis.tex
pdflatex Thesis.tex
mv Thesis.pdf Thesis_final_version.pdf

# Thesis temporary version
sed -i 's/\\documentclass\[final\]/\\documentclass\[temporary\]/' Thesis.tex
pdflatex Thesis.tex
pdflatex Thesis.tex
mv Thesis.pdf Thesis_temporary_version.pdf

# cleanup
rm -f Thesis.*
mv Backup_Thesis.tex Thesis.tex
cd ..
