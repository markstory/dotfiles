#!/bin/zsh

# Enable automatic CD when paths are used without cd
setopt AUTO_CD
# enable case insensitive globbing
setopt NO_CASE_GLOB

# History
SAVEHIST=5000
HISTSIZE=2000
HISTFILE=${HOME}/.zsh_history
# Share history across sessions.
setopt SHARE_HISTORY
setopt APPEND_HISTORY
# Add commands incrementally
setopt INC_APPEND_HISTORY
# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST 
# do not store duplications
setopt HIST_IGNORE_DUPS
#ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS
# Enable prompt substitutions
setopt prompt_subst

# enable vi mode.
bindkey -v

# Load modules
autoload -Uz vcs_info
autoload -Uz compinit

# {{{ Completion
# partial completion suggestions
zstyle ':completion:*' list-suffixes zstyle ':completion:*' expand prefix suffix 
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# }}}

OS_NAME=$(uname -a | cut -f1 -d' ')

BREW_PREFIX=''
if [[ "$OS_NAME" = "Darwin" ]]; then
    BREW_PREFIX=`brew --prefix`
fi

# {{{ Setup PATH
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
# }}}

export DOTFILES_DIR="$HOME/.dotfiles"

# {{{ FZF config (temporarily here)
# Use the_silver_searcher for fzf
# this makes fzf faster, and exclude git guts and pyc.
export FZF_DEFAULT_COMMAND='ag --hidden --ignore "*.pyc" --ignore ".git" -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='
  --color=bg:#ffffff,bg+:#dadada,fg:#444444,fg+:#444444
  --color=hl:#af5f00,hl+:#af5f00,info:#008787
  --color=border:#dadada,prompt:#005faf,pointer:#005faf,header:#808080
'

# Set fzf preview window theme (provided by bat) to match terminal and vim.
export BAT_THEME="OneHalfLight"

if [[ "$OS_NAME" = "Darwin" ]]; then
    # Add autocompletion for fzf
    [[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null

    # Key bindings
    # ------------
    source "/usr/local/opt/fzf/shell/key-bindings.zsh"
fi

if [[ "$OS_NAME" = "Linux" ]]; then
    # Add autocompletion for fzf
    [[ $- == *i* ]] && source "$HOME/.fzf/shell/completion.zsh" 2> /dev/null

    # Key bindings
    # ------------
    source "$HOME/.fzf/shell/key-bindings.zsh"
fi
# }}}

# Load relevant section files
source "$DOTFILES_DIR/section/aliases.sh"
source "$DOTFILES_DIR/section/editors.sh"
source "$DOTFILES_DIR/section/git-extras.sh"
source "$DOTFILES_DIR/section/gnupg.sh"
source "$DOTFILES_DIR/section/jump.sh"
source "$DOTFILES_DIR/section/python.sh"
source "$DOTFILES_DIR/section/secrets.sh"
source "$DOTFILES_DIR/section/sentry.sh"

# {{{ Prompt configuration
export COLORTERM="truecolor"

# Grep
export GREP_COLOR='1;33'

# ls colours
export CLICOLOR=1
export LSCOLORS='Gxfxcxdxdxegedabagacad'


# Determine active Python virtualenv details.
function set_virtualenv () {
  if [[ -n "$VIRTUAL_ENV" ]]; then
      echo -n " %F{blue}py:$(basename $VIRTUAL_ENV)%f"
  fi
}


# Configure version control status
zstyle ':vcs_info:*' enable git
local formats="on %F{green}%b%f%m%c%u"
local actionformats="${formats} %a"
zstyle ':vcs_info:*' formats $formats
zstyle ':vcs_info:*' actionformats $actionformats
zstyle ':vcs_info:*' stagedstr "%F{blue}+%f"
zstyle ':vcs_info:*' unstagedstr  "%F{red}*%f"
zstyle ':vcs_info:*' check-for-changes true

precmd () { vcs_info }


# Prompt config
PROMPT='%F{blue}%*%f %n %F{magenta}%~%f$(set_virtualenv) ${vcs_info_msg_0_}%f
%(?.%F{green}.%F{red})ᐉ%f '
# }}}
