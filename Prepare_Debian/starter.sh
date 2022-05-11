#!/bin/bash

set -xe

sudo apt install i3 xorg lightdm slick-greeter lightdm-settings lxappearance nitrogen thunar firefox-esr pulseaudio alsa-utils pavucontrol compton i3lock-fancy intel-microcode rxvt gvfs-backends vim git pavucontrol compton xclip i3lock-fancy materia-gtk-theme papirus-icon-theme gcc g++ gdb maim tmux tree fonts-lohit-beng-bengali celluloid feh mousepad make uget unzip transmission

sudo apt install time --reinstall

sudo systemctl enable lightdm
