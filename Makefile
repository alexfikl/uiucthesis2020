TEXMK?=pdflatex
BIBMK?=bibtex

all: example docs

example: thesis.pdf

docs:
	@$(TEXMK) uiucthesis2020.dtx
	@$(TEXMK) uiucthesis2020.dtx

%.pdf: %.tex thesisstyle.tex references.bib uiucthesis2020.cls
	@$(TEXMK) $<
	@$(BIBMK) $(basename $<)
	@$(BIBMK) $(basename $<)
	@$(TEXMK) $<
	@$(TEXMK) $<

clean:
	@rm -f *.out *.log *.aux *.gz *.spl *.blg *.bbl *.thm *.lof *.lot *.toc *.xml

purge: clean
	@rm -f *.pdf

.PHONY: clean purge
