TEXMK := "latexmk"
TEXOUTDIR := "latex.out"
TEXFLAGS := "-pdflua -shell-escape -output-directory=" + TEXOUTDIR
LOGOSDIR := "logos.out"

_default:
    @just --list

[private]
pdf basename:
    {{ TEXMK }} {{ TEXFLAGS }} {{ basename }}.tex
    @cp {{ TEXOUTDIR }}/{{ basename }}.pdf .

[doc("Build the example thesis document")]
thesis:
    @just pdf thesis

[doc("Build the documentation PDF")]
docs:
    {{ TEXMK }} {{ TEXFLAGS }} uiucthesis2020.dtx uiucthesis2020.ins
    @cp {{ TEXOUTDIR }}/uiucthesis2020.pdf .

[doc("Update license text")]
license:
    python -m reuse download CC0-1.0
    cp LICENSES/CC0-1.0.txt LICENSE
    @rm -rf LICENSES

[doc("Create a zip file with all the files")]
zip: docs
    zip -9 uiucthesis2020.zip \
        LICENSE thesis.tex thesisstyle.sty references.bib \
        uiucthesis2020.cls

[doc("Remove all compilation files")]
clean:
    rm -rf {{ TEXOUTDIR }}
    rm -rf *.aux *.log *.out *.bbl *.spl *.blg *.fls *.fdb_latexmk *.sync*

[doc("Remove all generated files")]
purge: clean
    rm -rf *.pdf
