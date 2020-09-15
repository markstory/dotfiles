# Colour configuration
export COLORTERM="truecolor"

# Grep
export GREP_COLOR='1;33'

# ls colours
export CLICOLOR=1
export LSCOLORS='Gxfxcxdxdxegedabagacad'

# Prompt configuration

# Determine active Python virtualenv details.
function set_virtualenv () {
  if [[ -n "$VIRTUAL_ENV" ]]; then
      echo -n " %F{blue}py:$(basename $VIRTUAL_ENV)%f"
  fi
}

# Load VCS module
autoload -Uz vcs_info

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
