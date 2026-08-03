# Thesis-LaTeX-template

LaTeX Template for OIST Thesis

All instructions are specified within the templates themselves.
Please refer to the Academic Program Policy for specifics regarding the format. While this is the final template, it is not technically supported by the Graduate School.
For questions on how to use LaTeX, please reach out to your Student Council.
For questions regarding the format of the thesis, please reach out to the Examinations Team (examination[at]oist.jp)

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
