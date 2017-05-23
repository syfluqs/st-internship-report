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
all : $(report)

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

.PHONY: clean-temp
clean-temp:
	rm $(cover) $(declaration) $(acknowledgements) $(report-body)
	


$(cover): cover.md $(template_file)
	$(pandoc) --variable=geometry:$(papersize) --latex-engine=$(latexengine) --template=$(template_file) -s cover.md -o $(cover)

$(declaration): declaration.md $(template_file)
	$(pandoc) --variable=geometry:$(papersize) --latex-engine=$(latexengine) --template=$(template_file) -s declaration.md -o $(declaration)

$(acknowledgements): acknowledgements.md $(template_file)
	$(pandoc) --variable=geometry:$(papersize) --latex-engine=$(latexengine) --template=$(template_file) -s acknowledgements.md -o $(acknowledgements)

$(report-body): report-body.md $(stylesheet)
	$(pandoc) --variable=geometry:$(papersize) --toc --top-level-division=chapter --number-sections --css $(stylesheet) --latex-engine=$(latexengine) --filter pandoc-crossref --highlight-style=$(highlight-style) --latex-engine=$(latexengine) -s report-body.md -o $(report-body)

$(report): $(cover) $(declaration) $(acknowledgements) $(report-body)
	$(ghostscript) -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=$(report) $(cover) $(declaration) $(acknowledgements) $(report-body)