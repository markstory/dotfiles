# Set path for homebrew binaries
PATH=/usr/local/sbin:/usr/local/bin:$PATH

# node through homebrew
if [[ -d "/usr/local/lib/node_modules" ]]; then
    PATH="$PATH:/usr/local/lib/node_modules"
fi

# Ruby in homebrew
if [[ -d "/usr/local/opt/ruby/bin" ]]; then
    PATH="/usr/local/opt/ruby/bin:$PATH"
fi

# Binaries in home directory
if [[ -d "$HOME/.local/bin" ]]; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Yarn and global packages
PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Volta for node versions
export VOLTA_HOME="$HOME/.volta"
PATH="$VOLTA_HOME/bin:$PATH"

# Pyenv if available.
[ -x "/usr/local/bin/pyenv" ] && eval "$(pyenv init -)"
[ -s "$HOME/.local/bin/pyenv" ] && eval "$(pyenv init -)"
export PYENV_ROOT="$HOME/.pyenv/"

# Direnv if installed
[ -s "/usr/local/bin/direnv" ] && eval "$(direnv hook zsh)"
[ -s "/usr/bin/direnv" ] && eval "$(direnv hook zsh)"

# Rust CLI tools installed via `cargo install`.
PATH="$PATH:$HOME/.cargo/bin"

# Custom CLI tools
PATH="$PATH:$HOME/.dotfiles/bin"

export PATH
