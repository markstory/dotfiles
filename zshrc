#!/bin/zsh

# General ZSH options.
# Enable automatic CD when paths are used without cd
setopt AUTO_CD
# enable case insensitive globbing
setopt NO_CASE_GLOB

# enable vi mode.
bindkey -v
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

OS_NAME=$(uname -a | cut -f1 -d' ')
OS_ARCH=$(uname -m)

BREW_PREFIX=''
if [[ "$OS_NAME" = "Darwin" && "$OS_ARCH" = "arm64" ]]; then
    BREW_PREFIX=`/opt/homebrew/bin/brew --prefix`
fi
if [[ "$OS_NAME" = "Darwin" && "$OS_ARCH" = "x86_64" ]]; then
    BREW_PREFIX=`/usr/local/bin/brew --prefix`
fi

export DOTFILES_DIR="$HOME/.dotfiles"

# Load relevant section files
for f in $DOTFILES_DIR/section/*
do
    source $f
done

# Enable powerlevel10k prompt
source $HOME/.config/powerlevel10k/powerlevel10k.zsh-theme

# Include my configuration for powerlevel10k
source $DOTFILES_DIR/p10k.zsh

# Include autosuggestsion
source $HOME/.config/zsh-autosuggestions/zsh-autosuggestions.zsh
