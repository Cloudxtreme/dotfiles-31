# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set Editor to vim
export EDITOR=vim

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="xxf"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder other than $ZSH/custom?
ZSH_CUSTOM=~/bin/dotfiles/custom

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git colored-man-pages colorize brew npm tmux gulp extract sublime sudo osx web-search zsh-completions history tmuxinator vi-mode z zsh-syntax-highlighting)


# Source configuration
source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin:~/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

#Enabling Syntax highlighting for cheat
export CHEATCOLORS=true

# rbenv initialisation
eval "$(rbenv init -)"

# History
export HISTCONTROL=ignoredups

# keybindings
# reverse search in history, this import for Ctrl-R to work
bindkey "^R" history-incremental-search-backward

# Powerline Zsh Prompt
# source "/usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh"

