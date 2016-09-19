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
alias vimdiff='vim -d'

# ssh
alias ssh="$DOTFILES_DIR/bin/colorssh"

# OSX quicklook
alias look="qlmanage -p"

# Bundle exec is annoying.
alias be="bundle exec"

# PHPUnit installed with composer
alias phpunit="vendor/bin/phpunit"

# Clear DNS caches.
alias dnsclear="sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
