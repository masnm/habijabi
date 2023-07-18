# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1024
SAVEHIST=2048
setopt autocd extendedglob nomatch notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/masnm/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit

prompt off
# End of lines added by compinstall

export GPG_TTY=$(tty)
