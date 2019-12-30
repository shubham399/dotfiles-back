#!/bin/bash
DIR=$(dirname $0)
cd $DIR
C_PATH=$(pwd)
# Link wallpaper
rm $HOME/.wallpaer.png
ln -s $C_PATH/Wallpapers/wallpaper.png $HOME/.wallpaer.png

rm $HOME/.scripts
ln -s $C_PATH/scripts $HOME/.scripts

# Link home config files
for file in $C_PATH/home/*; do
  name=$(basename $file)
  rm $HOME/.$name
  ln -s $file $HOME/.$name
done
# echo ${array[@]}
# ln -s $(pwd)/home/vimrc $HOME/.vimrc
# ln -s $(pwd)/home/zshrc $HOME/.zshrc
