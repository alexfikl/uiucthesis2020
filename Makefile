TEXMK?=pdflatex
BIBMK?=bibtex

all: thesis.pdf

%.pdf: %.tex references.bib uiucthesis2020.cls
	@$(TEXMK) $<
	@$(BIBMK) $(basename $<)
	@$(BIBMK) $(basename $<)
	@$(TEXMK) $<
	@$(TEXMK) $<

clean:
	@rm -f *.out *.log *.aux *.gz *.spl *.blg *.bbl *.thm *.lof *.lot *.toc

purge: clean
	@rm -f *.pdf img/*-converted-to.pdf

.PHONY: clean purge
