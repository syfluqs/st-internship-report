#!/bin/sh
#
# script for making a list of abbreviations
#
# the script takes an .md file as input, reads the YAML front matter 
# and isolates abbreviation key-values starting with the '+' char,
# makes another .md file with the list.
# only abbreviations *not* starting with '_' are listed.
#
# start as 
# ./make-loa.sh input_file.md output_file.md

echo "# List of Abbreviations" >> $2
echo "" >> $2
grep -E -e "^\+\w*:.*" $1 | while read -r line ; do
    line=$(echo $line | cut -d "+" -f 2)
	echo "- *"$(echo $line | cut -d ":" -f 1)"* : "$(echo $line | cut -d ":" -f 2) >> $2
done
