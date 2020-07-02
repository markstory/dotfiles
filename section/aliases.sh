#!/usr/bin/env bash -e

# Aliases for various tools

# ls
alias ls='ls -FG'
alias ll='ls -laoh'

# ps
alias psa="ps aux"
alias psg="ps aux | grep $1"

# tail
alias tf="tail -f"

# vim
if [ -x $(command -v nvim) ]; then
	alias vim='nvim'
	alias vi='nvim'
	alias vimdiff='nvim -d'
fi

if [[ "$OS_NAME" =  "Darwin" ]]; then
    # ssh with host colors
    alias ssh="$DOTFILES_DIR/bin/colorssh"

    # OSX quicklook
    alias look="qlmanage -p"

    # Clear DNS caches.
    alias dnsclear="sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
fi

# Bundle exec is annoying.
alias be="bundle exec"

# PHPUnit installed with composer
alias phpunit="vendor/bin/phpunit"

