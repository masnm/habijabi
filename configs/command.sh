#!/bin/bash

set -xe

if [ "$1" == "backup" ]
then
	cp ~/.vimrc ./.vimrc
	cp ~/.config/i3/config ./i3_config
	cp ~/.config/i3/i3status.conf ./i3status.conf
	cp ~/.tmux.conf ./.tmux.conf
elif [ "$1" == "restore" ]
then
	cp ./.vimrc ~/.vimrc
	cp ./i3_config ~/.config/i3/config
	cp ./i3status.conf ~/.config/i3/i3status.conf
	cp ./.tmux.conf ~/.tmux.conf
else
	echo 'usage : command.sh [option]'
	echo '[options] = { backup, restore }'
fi
