pandoc = pandoc
papersize = a4paper
latexengine = xelatex
template_file = template.tex


cover:=cover.pdf
declaration:=declaration.pdf

.PHONY: cover
cover: $(cover)

.PHONY: declaration
declaration: $(declaration)
	


$(cover): cover.md $(template_file)
	$(pandoc) --variable papersize=$(papersize) --latex-engine=$(latexengine) --template=$(template_file) -s cover.md -o $(cover)

$(declaration): declaration.md $(template_file)
	$(pandoc) --variable papersize=$(papersize) --latex-engine=$(latexengine) --template=$(template_file) -s declaration.md -o $(declaration)