#!/bin/bash

dir=/home/azureuser/photos
destdir=/home/azureuser/photos/sorted

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
                timestamp="$(identify -format '%[exif:DateTimeOriginal]' $i)"
		timestamp=${timestamp%T*}

	year=$(echo $timestamp | cut -c 1-4)
	month=$(echo $timestamp | cut -c 6-7)
	day=$(echo $timestamp | cut -c 9-10)

	destfile=$destdir$month/($basename $i)

	if [ ! -d $destdir$month ]; then
		mkdir "$destdir$m" -p
	fi

	if [ -f $destfile ]; then
		md5src=$(md5sum $i)
		md5src=${md5src% *}
		md5dst=$(md5sum $destfile)
		md5dst${md5dst% *}
		if [ $md5src = $md5dst ]; then
			echo "Duplicate found, discarding identical file"
			rm $i
		else
			sizeSrc=$(stat -c%s $i)
			sizeDST=$(stat -c%s $destfile)
			if [ $sizeSrc -gt $sizeDst ]; then
				echo "Duplicate found, keeping the larger file."
				mv $i $destfile
			else
				rm $i
			fi
		fi
	else
		mv $i $destfile
		echo "Moved $i to $destfile"
	fi
fi

done
