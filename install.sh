#!/bin/bash
#Author : Mogger
# https://bbs.archlinux.org/viewtopic.php?id=73789
DIR=/home/poclement/dotfile/

mkdir -p ~/dotfiles_old

cd $DIR
for i in *
do
    mv ~/.$i ~/dotfiles_old/
    ln -s $DIR/$i ~/.$i
done

rm ~/.make.sh 
