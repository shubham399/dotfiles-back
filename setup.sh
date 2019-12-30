#!/bin/bash
DIR=$(dirname $0)
cd $DIR
C_PATH=$(pwd)
# Link wallpaper
rm $HOME/.wallpaer.png
ln -s $C_PATH/Wallpapers/wallpaper.png $HOME/.wallpaer.png

rm $HOME/.scripts
ln -s $C_PATH/scripts $HOME/.scripts
rm $C_PATH/scripts/monitor.sh
ln -s $C_PATH/scripts/changeDisplay.sh $C_PATH/scripts/monitor.sh

# Link home config files
for file in $(find $C_PATH/home/ -maxdepth 0 -type f ); do
  name=$(basename $file)
  rm $HOME/.$name
  ln -s $file $HOME/.$name
done

## Link .config folder
for file in $C_PATH/config/*; do
  name=$(basename $file)
  rm $HOME/.config/$name
  ln -s $file $HOME/.config/$name
done


echo "Setup Complete"
