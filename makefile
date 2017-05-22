pandoc = pandoc
ghostscript = gs
papersize = a4paper
latexengine = xelatex
template_file = template.tex
stylesheet = pandoc.css
highlight-style = kate


cover:=cover.pdf
declaration:=declaration.pdf
acknowledgements:=acknowledgements.pdf
report-body:=report-body.pdf
report:=report.pdf

.PHONY: all
all : $(report-body)
	$(ghostscript) -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=$(report) $(cover) $(declaration) $(acknowledgements) $(report-body)

.PHONY: report-body
report-body : $(report-body)

.PHONY: cover
cover: $(cover)

.PHONY: declaration
declaration: $(declaration)

.PHONY: acknowledgements
acknowledgements: $(acknowledgements)

.PHONY: clean
clean:
	rm $(cover) $(declaration) $(acknowledgements) $(report-body) $(report)
	


$(cover): cover.md $(template_file)
	$(pandoc) --variable papersize=$(papersize) --latex-engine=$(latexengine) --template=$(template_file) -s cover.md -o $(cover)

$(declaration): declaration.md $(template_file)
	$(pandoc) --variable papersize=$(papersize) --latex-engine=$(latexengine) --template=$(template_file) -s declaration.md -o $(declaration)

$(acknowledgements): cover.md $(template_file)
	$(pandoc) --variable papersize=$(papersize) --latex-engine=$(latexengine) --template=$(template_file) -s acknowledgements.md -o $(acknowledgements)

$(report-body): report-body.md $(stylesheet) $(cover) $(declaration) $(acknowledgements)
	$(pandoc) --variable papersize=$(papersize) --toc --top-level-division=chapter --number-sections --css $(stylesheet) --latex-engine=$(latexengine) --filter pandoc-crossref --highlight-style=$(highlight-style) --latex-engine=$(latexengine) -s report-body.md -o $(report-body)

