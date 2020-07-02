# Enable vi mode
set -o vi

OS_NAME=$(uname -a | cut -f1 -d' ')

BREW_PREFIX=''
if [[ "$OS_NAME" = "Darwin" ]]; then
    BREW_PREFIX=`brew --prefix`
fi

# Set path for homebrew binaries
PATH=/usr/local/sbin:/usr/local/bin:$PATH

# node through homebrew
PATH="$PATH:/usr/local/lib/node_modules"

# Yarn and global packages
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Pyenv if available.
[ -s "/usr/local/bin/pyenv" ] && eval "$(pyenv init -)"

# Direnv if installed
[ -s "/usr/local/bin/direnv" ] && eval "$(direnv hook bash)"

# Ruby in homebrew
PATH="/usr/local/opt/ruby/bin:$PATH"

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

# Load each section file.
for f in ~/.dotfiles/section/*
do
    source $f
done

# Homebrew tab completion.
if [ -f $BREW_PREFIX/etc/bash_completion ]; then
    . $BREW_PREFIX/etc/bash_completion
fi
