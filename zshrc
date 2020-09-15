#!/bin/zsh

# Enable automatic CD when paths are used without cd
setopt AUTO_CD
# enable case insensitive globbing
setopt NO_CASE_GLOB

# enable vi mode.
bindkey -v

OS_NAME=$(uname -a | cut -f1 -d' ')

BREW_PREFIX=''
if [[ "$OS_NAME" = "Darwin" ]]; then
    BREW_PREFIX=`brew --prefix`
fi

export DOTFILES_DIR="$HOME/.dotfiles"

# Load relevant section files
for f in ~/.dotfiles/section/*
do
    source $f
done
