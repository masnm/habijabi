#!/bin/bash

set -xe

touch backport.list
echo 'deb http://deb.debian.org/debian bullseye-backports main' >> backport.list
sudo mv backport.list /etc/apt/sources.list.d/backport.list

localectl status
timedatectl

sudo apt-get update && sudo apt update && sudo apt upgrade

sudo apt autoremove

sudo apt install gvfs-backends vim git lxappearance pavucontrol compton uget xclip i3lock-fancy materia-gtk-theme papirus-icon-theme gcc g++ gdb maim unzip tmux tree fonts-lohit-beng-bengali celluloid feh curl

sudo apt install -t bullseye-backports libreoffice libreoffice-gtk3
