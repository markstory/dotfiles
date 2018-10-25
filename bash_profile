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

# node through homebrew
if [ -d '/usr/local/lib/node_modules' ]
then
	PATH="/usr/local/lib/node_modules:$PATH"
fi

# Rust CLI tools installed via `cargo install`.
if [ -d "$HOME/.cargo/bin" ]
then
	PATH="$HOME/.cargo/bin:$PATH"
fi

# Custom CLI tools
PATH="$PATH:$HOME/.dotfiles/bin"

export PATH
export DOTFILES_DIR="$HOME/.dotfiles"

# Node
export NODE_PATH='/usr/local/share/npm/lib/node_modules'

# Homebrew tab completion.
if [ -f $BREW_PREFIX/etc/bash_completion ]; then
    . $BREW_PREFIX/etc/bash_completion
fi

# Python virtualenvwrapper
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi

# NVM
export NVM_DIR="$HOME/.nvm"
source "/usr/local/opt/nvm/nvm.sh"

# Load each section file.
for f in ~/.dotfiles/section/*
do
	source $f
done

# Rustup
export PATH="$HOME/.cargo/bin:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
