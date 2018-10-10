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
	if [[ $1 = "dry-run" ]]; then
		wp search-replace $line --all-tables --dry-run;
	elif [[ $1 = "confirm" ]]; then
		wp search-replace $line --all-tables;
	else
		echo "Please type y or n"
	fi
done <"$file"