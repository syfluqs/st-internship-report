# st-internship-report
This repo contains a report regarding my 6-month internship at STMicroelectronics, India.

Install ```pandoc```, ```pandoc-crossref``` and ```latex``` in Arch Linux with

```zsh
pacman -S pandoc texlive-core texlive-latexextra pandoc-crossref
```

A list of available otf system fonts can be queried with
```zsh
fc-list | grep ".otf" | cut -d ":" -f 2,3
```
The usable font names and available styles will be printed, separated by a ```:```. Note that, these font names will only work with the ```xelatex``` engine and not with ```lualatex``` or ```pdflatex```.