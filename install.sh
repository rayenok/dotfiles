#!/bin/bash

# variables
dir=$PWD
files="bashrc Xmodmap tmux.conf bash_aliases cvimrc eclipse fehbg \
        fonts i3 irssi mutt sqliterc Xdefaults zshrc vim  emacs.d \
        muttrc vimrc"

# create symlinks
for file in $files; do
    if [ -h ~/.$file ]; then
        echo "Deleting existing symlink ~/.$file"
        unlink ~/.$file
    elif [ -f ~/.$file ]; then
        echo "Deleting existing file ~/.$file"
        rm -rf ~/.$file 
    fi
    echo "Creating symlink to $file in ~"
    ln -s $dir/$file ~/.$file
done

# Ranger
if [ -e ~/.config/ranger ]; then
    echo "Deleting ranger directory"
    rm -rf ~/.config/ranger
fi
ln -s $dir/ranger ~/.config/

# Theme for oh-my-zsh
if [ -e ~/.oh-my-zsh ]; then
    ln -s $dir/rayenok.zsh-theme ~/.oh-my-zsh/themes/
fi
