#!/bin/bash

set -xe

if [ "$1" == "backup" ]
then
	cp ~/.vimrc ./.vimrc
	cp ~/.config/i3/config ./i3_config
	cp ~/.config/i3/i3status.conf ./i3status.conf
	cp ~/.tmux.conf ./.tmux.conf
	cp ~/.Xdefaults ./.Xdefaults
	cp -r /usr/lib/urxvt/perl/* ./urxvt_perl/
elif [ "$1" == "restore" ]
then
	cp ./.vimrc ~/.vimrc
	cp ./i3_config ~/.config/i3/config
	cp ./i3status.conf ~/.config/i3/i3status.conf
	cp ./.tmux.conf ~/.tmux.conf
	cp ./.Xdefaults ~/.Xdefaults
	sudo mkdir -p /ust/lib/urxvt
	sudo mkdir -p /ust/lib/urxvt/perl
	cp -r ./urxvt_perl/ /usr/lib/urxvt/perl/
else
	echo 'usage : command.sh [option]'
	echo '[options] = { backup, restore }'
fi
