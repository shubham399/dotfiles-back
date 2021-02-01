#!/bin/bash
sudo apt install i3 i3blocks i3status hsetroot rofi xclip -y
DIR=$(dirname $0)
cd $DIR
C_PATH=$(pwd)
# Link wallpaper
rm $HOME/.wallpaper.png
ln -s $C_PATH/Wallpapers/wallpaper.png $HOME/.wallpaper.png

rm $HOME/.scripts
ln -s $C_PATH/scripts $HOME/.scripts
rm $C_PATH/scripts/monitor.sh
ln -s $C_PATH/scripts/changeDisplay.sh $C_PATH/scripts/monitor.sh

# Link home config files
for file in $(find $C_PATH/home -maxdepth 1 -type f); do
  name=$(basename $file)
  rm $HOME/.$name
  ln -s $file $HOME/.$name
done

## Link .config folder
for file in $C_PATH/config/*; do
  name=$(basename $file)
  rm -Rf $HOME/.config/$name
  ln -s $file $HOME/.config/$name
done

## Link nvim as using same config as vim
mkdir -p $HOME/.config/nvim
rm -R $HOME/.config/nvim/init.vim
ln -s $C_PATH/home/vimrc $HOME/.config/nvim/init.vim
echo "Setup Complete"
