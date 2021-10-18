# habijabi

## Install the updates
```console
$ sudo apt update && sudo apt upgrade
```

## Restoring ssh and gpg key

	Backup:
		```console
		cp -r ~/.ssh /media/masnm/{drive name}
		gpg --export-secret-keys $ID > my-private-key.asc
		cp ./my-private-key.asc /media/masnm/{drive name}
		rm my-private-key.asc
		```

	Restore:
		```console
		cp -r /media/masnm/{drive name} ~/.ssh
		chown masnm:masnm ~/.ssh/id_ed*
		chmod 600 ~/.ssh/id_ed25519
		chmod 644 ~/.ssh/id_ed25519.pub
		exec ssh-agent bash
		ssh-add ~/.ssh/id_rsa
		cp /media/masnm/{drive name} ./my-private-key.asc
		gpg --import my-private-key.asc
		```


## Install some nacessary apps / packages
```console
$ sudo apt install git vim xclip uget
```

## Install Materia theme and icon
```console
$ sudo dnf install materia-gtk-theme papirus-icon-theme dmz-cursor-theme
```

copy .vimrc from habijabi to home .vimrc
	$ cp ~/habijabi/.vimrc ~/.vimrc

copy .gitconfig form habijabi to home
	$ cp ~/habijabi/.gitconfig ~/.gitconfig

install nodejs an configure global module
	$ sudo dnf install nodejs
	$ mkdir ~/.npm-global
	$ npm config set prefix '~/.npm-global'
	$ export PATH=~/.npm-global/bin:$PATH
	$ source ~/.profile

install vim-plug for vim
	$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	
	run :PlugInstall in vim command mode

install g++ and clang
	$ sudo dnf install g++ clang

vim clang c++ error
	$ sudo dnf install clang-tools-extra
	run in vim command mode
	$ :CocInstall coc-clangd

some packages for g++
	$ sudo dnf install /usr/lib64/libasan.so.6
	$ sudo dnf install /usr/lib64/libubsan.so.1

install gnu debugger
	$ sudo dnf install gdb

install java-11 if needed
	$ sudo dnf install java-11-openjdk-devel.x86_64
	add vim plugin in coc-java run in vim command mode
	$ :CocInstall coc-java

packages for engine development
	$ sudo dnf install libx11-dev libgl1-mesa-dev libglew-dev libpng-dev

modding the bash prompt
	edit with sudo previllige
		$ sudo vim /etc/bashrc 
	comment this line
		[ "$PS1" = "\\s-\\v\\\$ " ] && PS1="[\u@\h \W]\\$ "
	after previous line add this 4 lines
		if [ $EUID == 0 ]; then
		  [ "$PS1" = "\\s-\\v\\\$ " ] && PS1="\[\033[01;31m\]\u@\h\[\033[01;34m\] \W \$\[\033[00m\] "
		 else
		  [ "$PS1" = "\\s-\\v\\\$ " ] && PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] "
		fi

android phone auto mounter if already not working
	$ sudo dnf install gvfs-mtp



## Firefox setup...

	add ons :
		1. AdBlocker for YouTube
		2. Privacy Badger
		3. HTTPS Everywhere
	Preference: General
		1. Make it default
		2. Network settings -> Enable DNS over HTTPS
	Preference: Home
		1. untick
			a. top sites
			b. Recomended by pocket
			c. highllights
			d. snippets
	Preference: Search
		1. Change default search engine
		2. untick
			a. Search suggestions
		3. Remove other search engine other than the default one.
	Preference: Privacy & Security
		1. Enhance tracking protection
			a. Custom
				Disable all third party cookies.
		2. Send Website "Don't track signal
			a. Always
		3. Tick
			a. Delete all cookies and site data.
		4. Logins and password
			a. Should use a password manager
		5. History
			a. Custom
				clear history firefox closes.
		6. Firefox data collection
			a. Disable all
	Preference: Sync
		about:config
		identity.fxaccounts.enable    st to false.
	
	Extensions:
		Privacy Badger
		HTTPS Everywhere
		containers



## ***->->->6. Sound solution<-<-<-***
I found a solution for this issue: There is an option in the hda driver to disable the Jack detection. I made a udev rule to enforce this before boot:

	/etc/udev/rules.d/jackdetect.rules
	
	ACTION=="add", SUBSYSTEM=="sound", ATTRS{chip_name}=="ALCS1200A", ATTR{hints}="jack_detect=false"
	ACTION=="add", SUBSYSTEM=="sound", ATTRS{chip_name}=="ALCS1200A", ATTR{reconfig}="1"
	
You can find your chip_name in /sys/class/sound/hwC?D?/chip_name, or use something else as a selector...
