#!/bin/bash

# showing every commmand it executes and
# imediately stop when a command failed
set -xe

# Changing the DNF configuration for make it fast
echo 'fastestmirror=1' | sudo tee -a /etc/dnf/dnf.conf
echo 'max_parallel_downloads=10' | sudo tee -a /etc/dnf/dnf.conf
echo 'deltarpm=true' | sudo tee -a /etc/dnf/dnf.conf

# changing the hostname form localhost from fedora
hostnamectl set-hostname fedora

# cheaking for some status if ok
localectl status
timedatectl

# upgrading the system
sudo dnf upgrade --refresh

# cleanup after upgrade
sudo dnf check
sudo dnf autoremove

# its a good idea to reboot the system now

# cheaking for update again
sudo dnf update --refresh

# android auto mounter
sudo dnf install gvfs-mtp

# editor of choice 'vim'
sudo dnf install vim

# installing git
sudo dnf install git

# install theme controller
sudo dnf install lxappearance

# audio control manager
sudo dnf install pavucontrol

# compton compositor
sudo dnf install compton

# installing download manager
sudo dnf install uget

# clipboard manager
sudo dnf install xclip

# find some good loking lock
# sudo dnf install i3lock-fancy
# sudo dnf install i3lock-color

# theme of choice for icon and gtk
sudo dnf install materia-gtk-theme papirus-icon-theme

# C and C++ compiler and debugger
sudo dnf install gcc g++ gdb
