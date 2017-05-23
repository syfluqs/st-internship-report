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

.PHONY: setup
setup :
	git clone https://github.com/scokobro/pandoc-abbreviations /tmp/pandoc-abbreviations
	cd /tmp/pandoc-abbreviations
	mkdir -p ~/.pandoc/filters
	mv -f /tmp/pandoc-abbreviations/abbrevs.py ~/.pandoc/filters/
	mv -f /tmp/pandoc-abbreviations/dbase ~/.pandoc/dbase
	rm -rf /tmp/pandoc-abbreviations
	sudo pacman -S pandoc texlive-core texlive-latexextra pandoc-crossref ghostscript

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
	

$(cover) $(declaration) $(acknowledgements): $(patsubst %.$(word 2, $(subst ., ,$@)),%.md,$@) $(template_file)
	$(pandoc) --variable=geometry:$(papersize) --latex-engine=$(latexengine) --template=$(template_file) -s $< -o $@

$(report-body): $(patsubst %.$(word 2, $(subst ., ,$(report-body))),%.md,$(report-body)) $(stylesheet)
	# appending abbreviations list to the end of an intermediate .md file
	cp $< /tmp/intermediate_tmp.md
	echo -e "\n\n" >> /tmp/intermediate_tmp.md
	echo "# List of Abbreviations" >> /tmp/intermediate_tmp.md
	echo -e "\n" >> /tmp/intermediate_tmp.md
	grep -E -e "^\+[^!]\w*\s*:\s*\w*" $< | sed 's/+/- **/' | sed 's/:/**:/' >> /tmp/abbr_tmp.md
	sort /tmp/abbr_tmp.md >> /tmp/intermediate_tmp.md
	$(pandoc) --variable=geometry:$(papersize) --toc --top-level-division=chapter --number-sections --css $(stylesheet) --latex-engine=$(latexengine) --filter pandoc-crossref --filter=abbrevs.py --highlight-style=$(highlight-style) --latex-engine=$(latexengine) -s /tmp/intermediate_tmp.md -o $(report-body)
	rm /tmp/intermediate_tmp.md /tmp/abbr_tmp.md

$(report): $(cover) $(declaration) $(acknowledgements) $(report-body)
	$(ghostscript) -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=$(report) $(cover) $(declaration) $(acknowledgements) $(report-body)

