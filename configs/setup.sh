#!/bin/bash

read -p "Want to setup ZSH? [Y/N] " response
if [[ $response == [Yy] ]]; then
	echo 'Setting up ZSH'
	ln -s $(pwd)/.zshrc ~/.zshrc
    touch ~/.histfile
    chsh /bin/zsh
fi

read -p "Want to setup Vimrc? [Y/N] " response
if [[ $response == [Yy] ]]; then
	echo 'Setting up Vimrc'
	ln -s $(pwd)/.vimrc ~/.vimrc
fi

read -p "Want to setup Tmux Conf? [Y/N] " response
if [[ $response == [Yy] ]]; then
	echo 'Setting up Tmux Conf'
	ln -s $(pwd)/.tmux.conf ~/.tmux.conf
fi

read -p "Want to setup Xoria256 color in Vim? [Y/N] " response
if [[ $response == [Yy] ]]; then
	echo 'Setting up Xoria256 for Vim'
	mkdir -p $HOME/.vim/colors
	cp $(pwd)/xoria256.vim $HOME/.vim/colors/
fi

read -p "Want to setup tag jump to include? [Y/N] " response
if [[ $response == [Yy] ]]; then
	echo 'Setting up Tag jump to include'
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
	echo 'Setting up git configure'
	git config --global user.name "Ahmmed Sakib Noman"
	git config --global user.email nomanahmmed0@gmail.com
	git config --global core.editor vim
	git config --global init.defaultBranch master
	git config --global diff.tool vimdiff

	TOTALKEY=$(gpg --list-secret-keys --keyid-format=long | grep sec)
	TOTALKEY=${TOTALKEY:14:16}

	git config --global user.signingkey $TOTALKEY
fi

read -p "Want to setup touchpad config? [Y/N] " response
if [[ $response == [Yy] ]]; then
	echo 'Setting up touchpad configure'
	sudo cp ./30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf
fi

read -p "Want to setup i3 config? [Y/N] " response
if [[ $response == [Yy] ]]; then
	echo 'Setting up i3 configure'
	echo ./my_i3_configs >> $HOME/.config/i3/config
	echo "Replace next line manually"
	echo -e "bindsym $mod+d exec --no-startup-id dmenu_run -fn \"monospace Bold:size=10\" -p \"➜ \" -nb \"#282a36\" -nf \"#c3c3c0\" -sb \"#282a36\" -sf \"#50fa7b\""
fi

read -p "Want to setup i3status config? [Y/N] " response
if [[ $response == [Yy] ]]; then
	echo 'Setting up i3status configure'
	cp ./i3status.conf $HOME/.config/i3/
	declare -a StringArray=(
    "bar {"
    "        font pango:Droid Sans Mono Bold 8"
    "        status_command i3status -c ~/.config/i3/i3status.conf"
    "        i3bar_command i3bar --transparency"
    "        colors {"
    "                background #000000FF"
    "        }"
    "}"
	)
	echo "Replace the next line manually in ~/.config/i3/config"
	for String in "${StringArray[@]}"; do
		echo -e $String
	done
fi

read -p "Want to setup bluetooth config? [Y/N] " response
if [[ $response == [Yy] ]]; then
	echo 'Setting up bluetooth configure'
	sudo systemctl enable --now bluetooth
fi

read -p "Want to setup urxvt config? [Y/N] " response
if [[ $response == [Yy] ]]; then
	echo 'Setting up urxvt configure'
	ln -s $(pwd)/.Xdefaults ~/.Xdefaults
	sudo mkdir -p /usr/lib/urxvt/perl/urxvt_perl
	sudo cp ./urxvt_perl/* /usr/lib/urxvt/perl/urxvt_perl/
fi
