# Enable vi mode
set -o vi

BREW_PREFIX=`brew --prefix`

# Set path
PATH=/usr/local/sbin:/usr/local/bin:$PATH

# node through homebrew
PATH="$PATH:/usr/local/lib/node_modules"

# Yarn and global packages
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Poetry for python
PATH="$PATH:/$HOME/.poetry/bin"

# Ruby in homebrew
PATH="$PATH:/usr/local/opt/ruby/bin"

# Rust CLI tools installed via `cargo install`.
PATH="$PATH:$HOME/.cargo/bin"

# Volta for nodejs environments
export VOLTA_HOME="$HOME/.volta"
[ -s "$VOLTA_HOME/load.sh" ] && . "$VOLTA_HOME/load.sh"

export PATH="$VOLTA_HOME/bin:$PATH"


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

# Load each section file.
for f in ~/.dotfiles/section/*
do
    source $f
done
