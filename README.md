# Thesis-LaTeX-template

LaTeX Template for OIST Thesis

All instructions are specified within the templates themselves.
Contact the Examination team (examination@oist.jp) for any questions related to the templates.

If you would like to suggest a change, PRs are welcome.

## building the thesis

If you want to build the thesis by hand, you may use the series of commands

```bash
pdflatex Thesis.tex
bibtex Thesis.aux
pdflatex Thesis.tex
pdflatex Thesis.tex
```

## updating the template

If you are updating the template, you can run `./generate_examples.sh` to generate both example thesis in `Examples`.
