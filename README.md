# habijabi

### Install the updates
Change the update preferences in Software
```console
	$ sudo apt update && sudo apt upgrade
```

### Restoring ssh and gpg key

##### Backup: Change {drive name}
```console
	cp -r ~/.ssh /media/masnm/{drive name}
	gpg --export-secret-keys $ID > my-private-key.asc
	cp ./my-private-key.asc /media/masnm/{drive name}
	rm my-private-key.asc
```

##### Restore: Change {drive name}, {user name}
```console
	cp -r /media/masnm/{drive name} ~/.ssh
	chown {user name}:{user name} ~/.ssh/id_ed*
	chmod 600 ~/.ssh/id_ed25519
	chmod 644 ~/.ssh/id_ed25519.pub
	exec ssh-agent bash
	ssh-add ~/.ssh/id_rsa
	cp /media/masnm/{drive name} ./my-private-key.asc
	gpg --import my-private-key.asc
```

### Install some nacessary apps / packages
```console
	$ sudo apt install git vim g++ xclip uget gdb
```

### Install Materia theme and icon
```console
	$ sudo apt install materia-gtk-theme papirus-icon-theme dmz-cursor-theme
```

### Some extra packages for g++
```console
	$ sudo apt install /usr/lib64/libasan.so.6
	$ sudo apt install /usr/lib64/libubsan.so.1
```

### Restore all the dotfiles
```console
	$ cp ~/habijabi/.vimrc ~/.vimrc
```

### Install java-11 if needed
```console
	$ sudo apt install openjdk-11-jdk
```

### Install Prolog if needed
```console
	$ sudo apt install swi-prolog
```

### Packages for engine development
```console
	$ sudo dnf install libx11-dev libgl1-mesa-dev libglew-dev libpng-dev
```

### Android phone auto mounter if already not working
```console
	$ sudo apt install gvfs-mtp
```

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
