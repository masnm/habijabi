#!/bin/bash

# showing every commmand it executes and
# imediately stop when a command failed
set -xe

# cheaking for some status if ok
localectl status
timedatectl

# upgrading the system
sudo apt-get update && sudo apt update && sudo apt upgrade

# cleanup after upgrade
sudo apt autoremove

# need to add backport first

# android auto mounter
sudo apt install gvfs-backends vim git lxappearance pavucontrol compton uget xclip i3lock-fancy materia-gtk-theme papirus-icon-theme gcc g++ gdb maim unzip tmux tree fonts-lohit-beng-bengali celluloid

# Installing the LibreOffice Swit 'gtk3' rendering
sudo apt install -t bullseye-backports libreoffice libreoffice-gtk3
