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

BREW_PREFIX=''
if [[ "$OS_NAME" = "Darwin" ]]; then
    BREW_PREFIX=`brew --prefix`
fi

export DOTFILES_DIR="$HOME/.dotfiles"

# Load relevant section files
for f in $DOTFILES_DIR/section/*
do
    source $f
done

# Enable powerlevel10k prompt
source $HOME/.config/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit $DOTFILES_DIR/.p10k.zsh.
source $DOTFILES_DIR/p10k.zsh
