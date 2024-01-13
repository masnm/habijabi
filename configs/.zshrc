
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1024
SAVEHIST=2048
setopt autocd extendedglob nomatch notify
bindkey -v
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' completions 1
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' file-sort access
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' glob 1
zstyle ':completion:*' group-name ''
zstyle ':completion:*' ignore-parents parent pwd ..
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' max-errors 2 numeric
zstyle ':completion:*' menu select=1
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' prompt 'corrections'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' substitute 1
zstyle ':completion:*' use-compctl true
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/masnm/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit

# prompt off
# End of lines added by compinstall

setopt prompt_subst

source "/home/masnm/.zsh/git_info.zsh"

PROMPT=''
# PROMPT+='%F{yellow}%n@%m ' # Display the username followed by @ and hostname in yellow
PROMPT+='%F{blue}%1~' # Display the current working directory in blue
PROMPT+='%F{red}$(__git_info)%f ' # Display the vcs info in red
PROMPT+='%(?.%F{green}λ .%F{red}λ )' # Display a green prompt if the last command succeeded, or red if it failed
PROMPT+='%f' # Reset the text color

export GPG_TTY=$(tty)

# export EDITOR=/usr/bin/vim
export EDITOR=vim
export TERMINAL=kitty

# some more ls aliases
alias ls='ls --color=auto'
alias ll='ls -la --color=auto'
alias la='ls -A --color=auto'
alias l='ls -F --color=auto'

# cal current date highlight
alias cal='ncal -b'

# my aliases
# alias d="my_gdb_debug_cmnd.sh"
# alias t="my_verdict_cmnd.sh"
# alias is="my_input_submit_cmnd.sh"
# alias v="my_accepted_wrong_ans_cmnd.sh"
# alias c="my_code_compile_cmnd.sh"
# alias r="my_code_runner_cmnd.sh"
# alias tm="my_time_memory_usage_cmnd.sh"
alias feh="feh -B Black"

# enabling syntax highlighting & auto suggestion
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
