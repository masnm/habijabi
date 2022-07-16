#!/bin/bash

read -p "Want to setup Bash Aliases? [Y/N] " response
if [[ $response == [Yy] ]]; then
	ln -s $(pwd)/.bash_aliases ~/.bash_aliases
	declare -a StringArray=(
		""
		"# Source Bash aliases By masnm"
		"if [ -f ~/.bash_aliases ]; then"
		"\t. ~/.bash_aliases"
		"fi"
	)
	for String in "${StringArray[@]}"; do
		echo -e $String >> $HOME/.bashrc
	done
fi

read -p "Want to setup Vimrc? [Y/N] " response
if [[ $response == [Yy] ]]; then
	ln -s $(pwd)/.vimrc ~/.vimrc
fi

read -p "Want to setup Xoria256 color in Vim? [Y/N] " response
if [[ $response == [Yy] ]]; then
	mkdir -p $HOME/.vim/colors
	cp $(pwd)/xoria256.vim $HOME/.vim/colors/
fi

read -p "Want to setup tag jump in include? [Y/N] " response
if [[ $response == [Yy] ]]; then
	if ! command -v ctags &> /dev/null
	then
		echo "Command `ctags` not found. exiting abnormally"
		exit 1
	fi
	CURRENT_DIR=$(pwd)
	cd /usr/include/
	sudo ctags -R --c++-kinds=+p --fields=+iaS --extras=+q -I DECLSPEC -I SDLCALL .
	cd $CURRENT_DIR
fi

read -p "Want to setup git configure? [Y/N] " response
if [[ $response == [Yy] ]]; then
	git config --global user.name "Ahmmed Sakib Noman"
	git config --global user.email nomanahmmed0@gmail.com
	git config --global core.editor vim
	git config --global init.defaultBranch master
	git config --global diff.tool vimdiff

	TOTALKEY=$(gpg --list-secret-keys --keyid-format=long | grep sec)
	TOTALKEY=${TOTALKEY:14:16}

	git config --global user.signingkey $TOTALKEY
fi
