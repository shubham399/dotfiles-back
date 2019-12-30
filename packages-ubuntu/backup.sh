#!/bin/bash

DIR=$(dirname $0)
# Get all the packages install on the system
tmp=`mktemp`
dpkg --get-selections > $tmp
file="$DIR/blacklist.list"
blacklisted=`mktemp`
for RE in $(xargs < $file | sed -e 's/ /|/g');
do
   # echo $RE
    sed -r -e '/^('"$RE"')/d' $tmp > $blacklisted
done
mv $blacklisted $DIR/package_list
## Backup the sources.list file
cp /etc/apt/sources.list $DIR/sources/sources.list
## Backup the sources.list.d folder
cp -r /etc/apt/sources.list.d/ $DIR/sources/sources.list.d/

## TODO: Backup app configs?

#rm $tmp 
#rm $blacklisted
echo "$0 Completed"
