#!/bin/bash

set -xe

#bashes
files_array=("~/.bashrc" "~/.bash_aliases" "~/.bash_profile")
for file in ${files_array[@]}; do
	if [[ -f $file ]]; then
		rm $file
	fi
done

ln ./.bashrc ~/.bashrc 
ln ./.bash_aliases ~/.bash_aliases
ln ./.bash_profile ~/.bash_profile

# i3 configs
files_array=("~/.config/i3/config" "~/.config/i3/i3status.conf")
for file in ${files_array[@]}; do
	if [[ -f $file ]]; then
		rm $file
	fi
done
ln ./i3_config ~/.config/i3/config
ln ./i3status.conf ~/.config/i3/i3status.conf

# tmux
if [[ -f ~/.tmux.conf ]]; then
	rm ~/.tmux.conf
fi
ln ./.tmux.conf ~/.tmux.conf

# vim
if [[ -f ~/.vimrc ]]; then
	rm ~/.vimrc
fi
ln ./.vimrc ~/.vimrc
mkdir -p ~/.vim/colors
if [[ -f ~/.vim/colors/xoria256.vim ]]; then
	rm ~/.vim/colors/xoria256.vim
fi
ln ./xoria256.vim ~/.vim/colors/xoria256.vim

# sudo mkdir -p /usr/lib/urxvt
# sudo mkdir -p /usr/lib/urxvt/perl
# sudo cp -r ./urxvt_perl/ /usr/lib/urxvt/perl/
# sudo mkdir -p ~/.vim/colors
# sudo cp ./xoria256.vim ~/.vim/colors/
