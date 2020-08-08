##
# dotfiles
#
# @file
# @version 0.1

proj = $(shell pwd)

all: install
install:
	ln -s $(proj)/.regolith $(HOME)/.config/regolith/i3/config
	rm $(HOME)/.bashrc
	ln -s $(proj)/.bashrc $(HOME)/.bashrc
	ln -s $(proj)/.gitconfig $(HOME)/.gitconfig
	ln -s $(proj)/.vimrc $(HOME)/.vimrc
	ln -s $(proj)/.nvimrc $(HOME)/.nvimrc
	ln -s $(proj)/.Xmodmap $(HOME)/.Xmodmap
	xmodmap /home/$(USER)/.Xmodmap
	ln -s $(proj)/.tmux.conf $(HOME)/.tmux.conf
	ln -s $(proj)/.zshrc $(HOME)/.zshrc
# end
