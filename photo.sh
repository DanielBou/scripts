#!/bin/bash

dir=/home/azureuser/photos

if [ -d "$dir" ]; then
	echo "this is a valid directory"
else
	echo "this is not a valid directory"
exit
fi

for i in $(find $dir -iname "*.jpg" -o")
do

        #Check if the file actualy exists $dir
        if [ -f $i ]; then
                timestamp="$(identify -format '%[exif:DateTimeOriginal]' $i)"c

done

