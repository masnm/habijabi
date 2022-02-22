#!/bin/bash

# showing every commmand it executes and
# imediately stop when a command failed
set -xe

# cheaking for some status if ok
localectl status
timedatectl

# upgrading the system
sudo apt-get update
sudo apt update
sudo apt upgrade

# cleanup after upgrade
sudo apt autoremove

## its a good idea to reboot the system now

# cheaking for update again
sudo apt update

# android auto mounter
sudo apt install gvfs-backends

# editor of choice 'vim'
sudo apt install vim

# installing git
sudo apt install git

# install theme controller
sudo apt install lxappearance

# audio control manager
sudo apt install pavucontrol

# compton compositor
sudo apt install compton

# installing download manager
sudo apt install uget

# clipboard manager
sudo apt install xclip

# find some good loking lock
sudo apt install i3lock-fancy

# theme of choice for icon and gtk
sudo apt install materia-gtk-theme papirus-icon-theme

# C and C++ compiler and debugger
sudo apt install gcc g++ gdb

# Screenshot package
sudo apt install maim

# Unzipping package
sudo apt install unzip

# terminal multiplexer
sudo apt install tmux

# tree package to explore sub-directoryes
sudo apt install tree

# Bangla fonts
sudo apt-get install fonts-beng fonts-beng-extra fonts-lohit-beng-bengali

# Multimedia Player
sudo apt install celluloid

# need to add backport first
# Installing the LibreOffice Swit 'gtk3' rendering
sudo apt install -t bullseye-backports libreoffice libreoffice-gtk3
