TEX = pdflatex
BIB = biber
SRC = main
OUT = resume

# Active template. Documentation-only today. To change templates, use:
#   ./scripts/use-template.sh <template-name>
# which copies files from templates/<template-name>/ into the project root.
TEMPLATE ?= curve

.PHONY: compile clean help

compile:
	$(TEX) -interaction=nonstopmode $(SRC).tex || true
	$(BIB) $(SRC)
	$(TEX) -interaction=nonstopmode $(SRC).tex || true
	$(TEX) -interaction=nonstopmode $(SRC).tex || true
	@test -f $(SRC).pdf || { echo "ERROR: $(SRC).pdf was not produced"; exit 1; }
	mv $(SRC).pdf $(OUT).pdf

clean:
	rm -f *.aux *.bbl *.bcf *.blg *.log *.out *.run.xml *.toc *.fls *.fdb_latexmk *.synctex.gz $(OUT).pdf

help:
	@echo "Targets:"
	@echo "  compile  — build $(OUT).pdf via pdflatex + biber"
	@echo "  clean    — remove LaTeX build artifacts"
	@echo ""
	@echo "Build in Docker (recommended):"
	@echo "  ./build.sh"
	@echo ""
	@echo "Switch template:"
	@echo "  ./scripts/use-template.sh <template-name>"
	@echo "  (current: $(TEMPLATE))"
