#!/bin/bash

set -xe

touch backport.list
echo 'deb http://deb.debian.org/debian bullseye-backports main' >> backport.list
sudo mv backport.list /etc/apt/sources.list.d/backport.list

localectl status
timedatectl

sudo apt install libsdl2-dev libsdl2-gfx-dev

sudo apt-get update && sudo apt update && sudo apt upgrade autoremove

sudo apt install -t bullseye-backports libreoffice libreoffice-gtk3
