# Aliases for various tools
alias grep='grep --color=auto'

# ls
alias ls='ls --color=auto -FG'
alias ll='ls --color=auto -laoh'

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

