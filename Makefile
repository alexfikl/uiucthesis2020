TEXMK?=latexmk
OUTDIR?=latex.out
TEXFLAGS:=-pdf -shell-escape -output-directory=$(OUTDIR)

help: 			## Show this help
	@echo -e "Specify a command. The choices are:\n"
	@grep -E '^[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[0;36m%-12s\033[m %s\n", $$1, $$2}'
	@echo ""
.PHONY: help

all: example docs			## Build all template documents

example: thesis.pdf			## Build the example thesis document

docs: uiucthesis2020.dtx uiucthesis2020.ins		## Build the documentation PDF
	$(TEXMK) $(TEXFLAGS) $<
	@cp $(OUTDIR)/uiucthesis2020.pdf .

%.pdf: %.tex thesisstyle.tex uiucthesis2020.cls references.bib
	$(TEXMK) $(TEXFLAGS) $<
	@cp $(OUTDIR)/$@ .

clean:						## Remove all temporary generated files
	@rm -rf *.log *.out *.bbl *.spl \
		*.sync* *.blg *.aux *.fls *.fdb_latexmk \
		$(OUTDIR)
.PHONY: clean

purge: clean				## Remove all generated files
	@rm -rf *.pdf
.PHONY: purge
