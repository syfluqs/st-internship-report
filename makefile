pandoc = pandoc
ghostscript = gs
papersize = a4paper
latexengine = xelatex
template_file = template.tex
references_file = references.bib
csl_file = ieee-with-url.csl
stylesheet = pandoc.css
highlight-style = tango
references_title = References

cover:=cover.pdf
declaration:=declaration.pdf
acknowledgements:=acknowledgements.pdf
report-body:=report-body.pdf
report:=report.pdf

.PHONY: all
all : $(report)

.PHONY: setup
setup :
	git clone https://github.com/scokobro/pandoc-abbreviations /tmp/pandoc-abbreviations
	@cd /tmp/pandoc-abbreviations
	@mkdir -p ~/.pandoc/filters
	@mv -f /tmp/pandoc-abbreviations/abbrevs.py ~/.pandoc/filters/
	@mv -f /tmp/pandoc-abbreviations/dbase ~/.pandoc/dbase
	@rm -rf /tmp/pandoc-abbreviations
	sudo pacman -S pandoc texlive-core texlive-latexextra pandoc-crossref ghostscript

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

.PHONY: clean
clean:
	rm $(cover) $(declaration) $(acknowledgements) $(report-body) $(report)

.PHONY: clean-temp
clean-temp:
	rm $(cover) $(declaration) $(acknowledgements) $(report-body)
	

$(report): $(cover) $(declaration) $(acknowledgements) $(report-body)
	@echo "compiling $(report)"
	@$(ghostscript) -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=$(report) $(cover) $(declaration) $(acknowledgements) $(report-body)

.SECONDEXPANSION:
$(cover) $(declaration) $(acknowledgements): $$(patsubst %.$$(word 2, $$(subst ., ,$$@)),%.md,$$@) $(template_file)
	@echo "making $@"
	@$(pandoc) --variable=geometry:$(papersize) --latex-engine=$(latexengine) --template=$(template_file) -s $< -o $@

$(report-body): $$(patsubst %.$$(word 2, $$(subst ., ,$$@)),%.md,$$@) $(stylesheet) $(references_file) $(csl_file)
	@echo "appending abbreviations list"
	@cp $< /tmp/intermediate_tmp.md
	@echo -e "\n\n# List of Abbreviations \n" >> /tmp/intermediate_tmp.md
	@grep -E -e "^\+[^\.]\w*\s*:\s*\w*" $< | sed 's/+/- **/' | sed 's/:/**:/' >> /tmp/abbr_tmp.md
	@sort /tmp/abbr_tmp.md >> /tmp/intermediate_tmp.md
	@echo "appending references"
	@echo -e "\n\n# $(references_title) #\n" >> /tmp/intermediate_tmp.md
	@echo "rendering $(report-body)"
	@$(pandoc) --variable=geometry:$(papersize) --toc --bibliography=$(references_file) --csl=$(csl_file) --top-level-division=chapter --number-sections --css $(stylesheet) --latex-engine=$(latexengine) --filter pandoc-crossref --filter=abbrevs.py --filter pandoc-citeproc --highlight-style=$(highlight-style) --latex-engine=$(latexengine) -s /tmp/intermediate_tmp.md -o $@
	@rm /tmp/intermediate_tmp.md /tmp/abbr_tmp.md