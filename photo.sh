#!/bin/bash

dir=/home/azureuser/photos

if [ -d "$dir" ]; then
	echo "this is a valid directory"
else
	echo "this is not a valid directory"
exit
fi




