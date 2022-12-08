
### Comment the cdrm line in source repos
```console
sudo vi /etc/apt/sources.list
```

### Enable the lightdm greeter
```console
sudo systemctl enable lightdm
```

### Install the WM and necessary packages
```console
sudo apt install i3 xorg lightdm slick-greeter lightdm-settings lxappearance nitrogen thunar firefox-esr pulseaudio alsa-utils pavucontrol terminator compton i3lock-fancy
```

### Install the updates
Change the update preferences in Software
```console
sudo apt-get update && sudo apt update && sudo apt upgrade
```

### Install some nacessary apps / packages
```console
sudo apt install git vim gcc g++ xclip uget gdb
```

### Install Materia theme and icon
```console
sudo apt install materia-gtk-theme papirus-icon-theme
```
