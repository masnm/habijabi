#!/bin/bash

read -p "Want to setup Bash Aliases? [Y/N] " response
if [[ $response == [Yy] ]]; then
	echo 'Setting up Bash Aliases'
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

read -p "Want to setup xterm configure? [Y/N] " response
if [[ $response == [Yy] ]]; then
	echo 'Setting up xterm configure'
	CURRENT_DIR=$(pwd)
	cd $HOME
	cp /etc/X11/xinit/xinitrc $HOME/.xinitrc
	touch $HOME/.Xresources
	declare -a StringArray=(
		"#include \".Xresources.d/xterm\""
	)
	for String in "${StringArray[@]}"; do
		echo -e $String >> $HOME/.Xresources
	done
	mkdir -p $HOME/.Xresources.d
	touch $HOME/.Xresources.d/xterm
	cd $CURRENT_DIR
	cp ./xterm $HOME/.Xresources.d/xterm
fi

read -p "Want to see bash PS1 update? [Y/N] " response
if [[ $response == [Yy] ]]; then
	echo 'Showing bash PS1 update: '
	echo "PROMPT_COMMAND='lstatus=${?##0}'"
	echo "PS1='[\u@\h \W] $lstatus \$ '"
fi

read -p "Want to setup touchpad config? [Y/N] " response
if [[ $response == [Yy] ]]; then
	echo 'Setting up touchpad configure'
	sudo cp ./30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf
fi

read -p "Want to setup i3 config? [Y/N] " response
if [[ $response == [Yy] ]]; then
	echo 'Setting up i3 configure'
	declare -a StringArray=(
		"# Setup for i3 by masnm"
		""
		"# Sreen brightness controls"
		"bindsym XF86MonBrightnessUp exec brightnessctl set +10% $refresh_i3status"
		"bindsym XF86MonBrightnessDown exec brightnessctl set 10%- $refresh_i3status"
		""
		"# Touchpad controls"
		"bindsym XF86TouchpadToggle exec --no-startup-id \"synclient TouchpadOff=\$(synclient -l | grep -c 'TouchpadOff.*0')\""
		""
		"# Media player controls"
		"bindsym XF86AudioPlay exec --no-startup-id playerctl play"
		"bindsym XF86AudioPause exec --no-startup-id playerctl pause"
		"bindsym XF86AudioNext exec --no-startup-id playerctl next"
		"bindsym XF86AudioPrev exec --no-startup-id playerctl previous"
		""
		"# fixing screen tearing"
		"exec_always xrandr --output eDP --set TearFree on"
		""
		"# setting wallpaper"
		"exec_always feh --bg-fill ~//Pictures/Wallpapers/archlinux-wp.jpg"
		""
		"#Save a desktop screenshot with a unique ordered timestamp in the Pictures folder."
		"bindsym Print exec maim ~/Pictures/Screenshot/$(date +%s).png"
		"# Screenshot example"
		"bindsym Shift+Print exec maim -s | xclip -selection clipboard -t image/png"
		""
		"# Compton for Fixing screen tearing"
		"# exec --no-startup-id compton --backend glx --paint-on-overlay --vsync opengl-swc --no-fading-openclose"
		""
		"# Lock screen shortcut"
		"bindsym $mod+x exec i3lock"
		""
		"# Make all the window title less"
		"for_window [class=\"^.*\"] border pixel 1"
		""
		"# Make Pavucontrol Floating"
		"for_window [class=\"Pavucontrol\" instance=\"pavucontrol\"] floating enable"
		"for_window [class=\"gnome-calculator\" instance=\"gnome-calculator\"] floating enable"
	)
	for String in "${StringArray[@]}"; do
		echo -e $String >> $HOME/.config/i3/config
	done
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

read -p "Want to setup xmodmap config? [Y/N] " response
if [[ $response == [Yy] ]]; then
	echo 'Setting up xmodmap configure'
	xmodmap -pke > ~/.Xmodmap
fi
