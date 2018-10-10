#! /bin/bash
if [ -e "replacements.txt" ]; then
	echo "Replacement file found"
else
	echo "Error: Please run list.sh before continuing."
	exit 1
fi
file="replacements.txt"
while IFS= read -r line
do
	echo "renaming "$line;
	mv $line;
done <"$file"