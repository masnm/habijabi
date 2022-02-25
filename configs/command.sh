#!/bin/bash

set -xe

if [ "$1" == "backup" ]; then
	cp ~/.vimrc ./.vimrc
	cp ~/.config/i3/config ./i3_config
	cp ~/.config/i3/i3status.conf ./i3status.conf
	cp ~/.tmux.conf ./.tmux.conf
	cp ~/.Xdefaults ./.Xdefaults
	cp ~/.bashrc ./.bashrc
	cp ~/.bash_profile ./.bash_profile
	cp ~/.bash_aliases ./.bash_aliases
	cp -r /usr/lib/urxvt/perl/* ./
elif [ "$1" == "restore" ]; then
	cp ./.vimrc ~/.vimrc
	cp ./i3_config ~/.config/i3/config
	cp ./i3status.conf ~/.config/i3/i3status.conf
	cp ./.tmux.conf ~/.tmux.conf
	cp ./.Xdefaults ~/.Xdefaults
	cp ./.bashrc ~/.bashrc
	cp ./.bash_profile ~/.bash_profile
	cp ./.bash_aliases ~/.bash_aliases
	sudo mkdir -p /usr/lib/urxvt
	sudo mkdir -p /usr/lib/urxvt/perl
	sudo cp -r ./urxvt_perl/ /usr/lib/urxvt/perl/
	sudo mkdir -p ~/.vim/colors
	sudo cp ./xoria256.vim ~/.vim/colors/
elif [ "$1" == "difference" ]; then
	diff ./.vimrc ~/.vimrc
	diff ./i3_config ~/.config/i3/config
	diff ./i3status.conf ~/.config/i3/i3status.conf
	diff ./.tmux.conf ~/.tmux.conf
	diff ./.Xdefaults ~/.Xdefaults
	diff ./.bashrc ~/.bashrc
	diff ./.bash_profile ~/.bash_profile
	diff ./.bash_aliases ~/.bash_aliases
else
	echo 'usage : command.sh [option]'
	echo '[options] = { backup, restore, difference }'
fi
