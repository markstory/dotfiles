# Enable vi mode
set -o vi

# Set path
PATH=/usr/local/sbin:/usr/local/bin:/usr/local/share/python:$PATH

# Ruby in homebrew
if [ -d "/usr/local/Cellar/ruby/1.9.2-p136/bin" ]
then
	PATH="$PATH:/usr/local/Cellar/ruby/1.9.2-p136/bin"
fi

# PHP through homebrew
if [ -d "/usr/local/Cellar/php54/5.4.19/bin" ]
then
	PATH="$PATH:/usr/local/Cellar/php54/5.4.19/bin"
fi


export PATH
export DOTFILES_DIR="$HOME/.dotfiles"

# Node
export NODE_PATH='/usr/local/share/npm/lib/node_modules'

# Homebrew tab completion.
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# Load each section file.
for f in ~/.dotfiles/section/*
do
	source $f
done
