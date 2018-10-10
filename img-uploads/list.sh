#! /bin/bash
returnto=$(pwd)
if [ -d lapatilla ]; then
	rootdir="lapatilla/uploads"
elif [ -d uploads ]; then
	rootdir="uploads"
else
	echo "No uploads directory found"
	exit 1
fi
echo "upload directory found in $rootdir"
DIRS=$(ls -1 $rootdir)
for year in $DIRS; do
	SUBDIRS=$(ls -1 $rootdir/$year)
	for month in $SUBDIRS; do
		files=$(ls -1 $rootdir/$year/$month)
		for file in $files; do
			newname=`echo $file | sed 's/[\+%?<>:;, ~!$]//g'`;
			if [ $newname != $file ]; then
				echo "$rootdir/$year/$month/$file `echo $rootdir/$year/$month/$file | sed 's/[\+%]/\_/g' `" >> $returnto/replacements.txt;
			else
				echo "no replacement for "$year/$month/$file
			fi
		done
	done
done
cd $returnto
