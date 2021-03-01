# Aliases for various tools
alias grep='grep --color=auto'

# ls
if [[ "$OS_NAME" = "Darwin" ]]; then
    alias ls='ls -FG'
    alias ll='ls -FGlaoh'
else
    alias ls='ls --color=auto -F'
    alias ll='ls --color=auto -laoh'
    alias copy='xclip -sel copy'
    alias paste='xclip -out -sel clip'
fi

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

