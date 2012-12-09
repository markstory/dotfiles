PATH=/usr/local/sbin:/usr/local/bin:/usr/local/share/python:$PATH

# Ruby in macports
if [ -d "/usr/local/Cellar/ruby/1.9.2-p136/bin" ]; then
	PATH="$PATH:/usr/local/Cellar/ruby/1.9.2-p136/bin"
fi

export PATH
export DOTFILES_DIR="$HOME/.dotfiles"

# Aliases
. ~/.dotfiles/section/aliases.sh

# Editors
export EDITOR='mvim -v'
export SVN_EDITOR='mvim -v'
export GIT_EDITOR='mvim -v'

# Node
export NODE_PATH='/usr/local/lib/node'

# Homebrew tab completion.
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# load appearance settings.
. ~/.dotfiles/section/appearance.sh

# history
. ~/.dotfiles/section/history.sh
