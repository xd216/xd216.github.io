#!/bin/bash

# get all filenames
array=($(ls))

# get title within the possible filename
title=""
for word in $@
do
	if [ $title == "" ]; then
		title=$word
	else
		title=$title-$word
	fi
done

# find the exact file to be edited
matchfile=""
for filename in ${array[@]}
do
	echo $filename
	if [[ "$filename" == *"$title"* ]]; then
		matchfile="$filename"
		break
	fi
done

# check if the specified file exists or not
if [ "$matchfile" == "" ]; then
	echo "No such file."
	exit 1
fi

vim $matchfile
