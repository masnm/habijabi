#!/bin/bash

set -xe

if [ $1 == "backup" ]
then
	cp ~/.vimrc ./.vimrc
	cp ~/.config/i3/config ./i3_config
elif [ $1 == "restore" ]
then
	cp ./.vimrc ~/.vimrc
	cp ./i3_config ~/.config/i3/config
else
	echo '[options] = { backup, restore }'
fi
