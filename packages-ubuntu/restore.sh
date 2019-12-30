#!/bin/bash
DIR=$(dirname $0)
# clear and put all the package_list and repo on the correct location
avail=`mktemp`
sudo apt-cache dumpavail > "$avail"
sudo dpkg --merge-avail "$avail"
rm -f "$avail"

#sudo dpkg --clear-selections
sudo dpkg --set-selections < $DIR/package_list
sudo cp -r $DIR/sources/ /etc/apt/
# Install these packages.
sudo apt-get update -y && sudo apt-get dselect-upgrade -y
# Cleanup
sudo apt-get autoremove -y
