#!bin/sh

sudo dnf update --refresh

sudo dnf install zsh \
zsh-autosuggestions \
zsh-syntax-highlighting \
autojump-zsh \
vim \
git

# setting zsh as default shell
chsh -s $(which zsh)
