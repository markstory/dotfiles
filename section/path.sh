# Set path for homebrew binaries
if [[ -n "$BREW_PREFIX" ]]; then
    PATH="$BREW_PREFIX/sbin:$BREW_PREFIX/bin:$PATH"
fi

# node through homebrew
if [[ -d "$BREW_PREFIX/lib/node_modules" ]]; then
    PATH="$PATH:$BREW_PREFIX/lib/node_modules"
fi

# Ruby in homebrew
if [[ -d "$BREW_PREFIX/opt/ruby/bin" ]]; then
    PATH="$BREW_PREFIX/opt/ruby/bin:$PATH"
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
if [ -x "$BREW_PREFIX/bin/pyenv" ] || [ -s "$HOME/.local/bin/pyenv" ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    eval "$(pyenv init -)"
    PATH="$PYENV_ROOT/shims:$PATH"
fi

# Use /snap/bin if it exists.
if [[ -d "/snap/bin" ]]; then
    PATH="$PATH:/snap/bin"
fi

# Direnv if installed
[ -s "$BREW_PREFIX/bin/direnv" ] && eval "$(direnv hook zsh)"
[ -s "/usr/bin/direnv" ] && eval "$(direnv hook zsh)"

# Rust CLI tools installed via `cargo install`.
PATH="$PATH:$HOME/.cargo/bin"

# Custom CLI tools
PATH="$PATH:$HOME/.dotfiles/bin"

export PATH
