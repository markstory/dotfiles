export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/share/python:$PATH

# Aliases
alias ls='ls -G'
alias ll='ls -laoh'

# Editors
export EDITOR=vim
export SVN_EDITOR=vim
export GIT_EDITOR=vim

# Node
export NODE_PATH='/usr/local/lib/node'

# Homebrew tab completion.
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# load appearance settings.
. ./appearance.sh
