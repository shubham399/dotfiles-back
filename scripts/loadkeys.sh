#!/bin/bash
FILES=$(find ~/.ssh -type f)
for file in $FILES;do
    ssh-keygen -y  -f $file > /dev/null 2>&1
    if [ "$?" -eq 0 ]; then
	echo $file
	ssh-add -k $file
    fi
done
clear
