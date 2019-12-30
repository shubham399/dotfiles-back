#!/bin/bash

DIR=$(dirname $0)
# Get all the packages install on the system
tmp=`mktemp`
mkdir -p $DIR/$(hostname)/sources/
dpkg --get-selections > $tmp
file="$DIR/blacklist.list"
blacklisted=`mktemp`
for RE in $(xargs < $file | sed -e 's/ /|/g');
do
   # echo $RE
    sed -r -e '/^('"$RE"')/d' $tmp > $blacklisted
done
mv $blacklisted $DIR/$(hostname)/package_list
## Backup the sources.list file
cp /etc/apt/sources.list $DIR/$(hostname)/sources/sources.list
## Backup the sources.list.d folder
cp -r /etc/apt/sources.list.d/ $DIR/$(hostname)/sources/sources.list.d/

## TODO: Backup app configs?

#rm $tmp 
#rm $blacklisted
echo "$0 Completed"
