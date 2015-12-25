# Enable vi mode
set -o vi

BREW_PREFIX=`brew --prefix`

# Set path
PATH=/usr/local/sbin:/usr/local/bin:$PATH

# Ruby in homebrew
if [ -d "/usr/local/opt/ruby/bin" ]
then
	PATH="/usr/local/opt/ruby/bin:$PATH"
fi

# PHP through homebrew
if [ -d "/usr/local/opt/php55/bin" ]
then
	PATH="/usr/local/opt/php55/bin:$PATH"
fi

# node through homebrew
if [ -d '/usr/local/lib/node_modules' ]
then
	PATH="/usr/local/lib/node_modules:$PATH"
fi

# MacTex
if [ -d "/usr/texbin" ]
then
	PATH="/usr/texbin:$PATH"
fi

# Rust CLI tools installed via `cargo install`.
if [ -d "$HOME/.cargo/bin" ]
then
	PATH="$HOME/.cargo/bin:$PATH"
fi


export PATH
export DOTFILES_DIR="$HOME/.dotfiles"

# Node
export NODE_PATH='/usr/local/share/npm/lib/node_modules'

# Homebrew tab completion.
if [ -f $BREW_PREFIX/etc/bash_completion ]; then
    . $BREW_PREFIX/etc/bash_completion
fi

# Load each section file.
for f in ~/.dotfiles/section/*
do
	source $f
done
