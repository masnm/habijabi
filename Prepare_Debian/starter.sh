#!/bin/bash

set -xe

sudo apt install i3 xorg lightdm slick-greeter lightdm-settings lxappearance nitrogen thunar firefox-esr pulseaudio alsa-utils pavucontrol compton i3lock-fancy
sudo systemctl enable lightdm
