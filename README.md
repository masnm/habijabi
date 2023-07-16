# habijabi

### Before Anything
```console
sudo apt update && sudo apt upgrade
```
login to firefox account & configure add ons
```console
reboot
```

### Restoring SSH & GPG restore
Download the SSH and ZPZ folder from google drive
Unzip the zip file and goto the folder
```console
gpg --import my-private-key.asc
rm my-private-key.asc
mv .ssh $HOME/
cd $HOME
rm .ssh/known_hosts*
mv .ssh/id_ed25519.txt .ssh/id_ed25519
chmod 600 ~/.ssh/id_ed25519
chmod 644 ~/.ssh/id_ed25519.pub
eval "$(ssh-agent -s)"
ssh -T git@github.com # give option `yes`
```

### installing necessary packages
```console
cd $HOME
wget https://raw.githubusercontent.com/masnm/habijabi/configure-update/configs/packages.sh
zsh ./packages.sh
rm packages.sh
```

### configure the themes & icons
set the icons theme and widget theme using
```console
lxappearance
reboot # reboot the system
```

### Now clone this repository in codes folder
```console
cd $HOME
mkdir codes
cd codes
git clone git@github.com:masnm/habijabi.git
```

### Setup the configurations
```console
cd #HOME
cd codes/habijabi/configs
./setup.sh
```

### Removing the unnacessary stuffs
```console
cd #HOME
cd codes/habijabi/configs
./cleanup.sh
```


### Restoring ssh and gpg key

##### Backup: Change {drive name}
	cp -r ~/.ssh /media/masnm/{drive name}
	gpg --export-secret-keys $ID > my-private-key.asc
	cp ./my-private-key.asc /media/masnm/{drive name}
	rm my-private-key.asc
	
##### Restore: Change {drive name}, {user name}
	cp -r /media/masnm/{drive name} ~/.ssh
	chown {user name}:{user name} ~/.ssh/id_ed*
	chmod 600 ~/.ssh/id_ed25519
	chmod 644 ~/.ssh/id_ed25519.pub
	eval "$(ssh-agent -s)"
	ssh-add ~/.ssh/id_ed25519
	cp /media/masnm/{drive name} ./my-private-key.asc
	gpg --import my-private-key.asc

### Android phone auto mounter if already not working
```console
sudo apt install gvfs-backends  # `gvfs-mtp` for fedora
```

## Firefox setup...

	Preference: General
		Network settings -> Enable DNS over HTTPS
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
