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

.PHONY: list-otf-fonts
list-otf-fonts:
	@fc-list | grep ".otf" | cut -d ":" -f 2,3 | column -t -s ":"

.PHONY: report-body
report-body : $(report-body)

.PHONY: cover
cover: $(cover)

.PHONY: declaration
declaration: $(declaration)

.PHONY: acknowledgements
acknowledgements: $(acknowledgements)

.PHONY: abbreviations
abbreviations: $(patsubst %.$(word 2, $(subst ., ,$(report-body))),%.md,$(report-body))

.PHONY: clean
clean:
	rm $(cover) $(declaration) $(acknowledgements) $(report-body) $(report)

.PHONY: clean-temp
clean-temp:
	rm $(cover) $(declaration) $(acknowledgements) $(report-body)
	

$(cover) $(declaration) $(acknowledgements): $(patsubst %.$(word 2, $(subst ., ,$@)),%.md,$@) $(template_file)
	@echo "making $@"
	@$(pandoc) --variable=geometry:$(papersize) --latex-engine=$(latexengine) --template=$(template_file) -s $(patsubst %.$(word 2, $(subst ., ,$@)),%.md,$@) -o $@

$(report-body): report-body.md $(stylesheet)
	@echo "making $@"
	@$(pandoc) --variable=geometry:$(papersize) --toc --top-level-division=chapter --number-sections --css $(stylesheet) --latex-engine=$(latexengine) --filter pandoc-crossref --highlight-style=$(highlight-style) --latex-engine=$(latexengine) -s report-body.md -o $(report-body)

$(report): $(cover) $(declaration) $(acknowledgements) $(report-body)
	@echo "compiling $(report)"
	@$(ghostscript) -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=$(report) $(cover) $(declaration) $(acknowledgements) $(report-body)

