#!/usr/bin/env bash

# Colours
GREEN="\[\033[0;32m\]"
WHITE="\[\033[0;37m\]"
MAGENTA="\[\033[0;35m\]"
BLUE="\[\033[0;34m\]"
RESET="\[\033[0m\]"
RED="\[\033[0;31;m\]"

# Grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;33'

# ls colours
export LSCOLORS='Gxfxcxdxdxegedabagacad'

# Determine active Python virtualenv details.
function set_virtualenv () {
  if test -z "$VIRTUAL_ENV"
  then
      PYTHON_VIRTUALENV=""
  else
      PYTHON_VIRTUALENV=" ${BLUE}🐍`basename \"$VIRTUAL_ENV\"`"
  fi
}

# Prompt config
function set_bash_prompt {
    EXIT="$?"
    set_virtualenv

    PROMPT="${BLUE}\D{%H:%M:%S}${RESET} \u:\W${PYTHON_VIRTUALENV}${GREEN}$(__git_ps1)${RESET}"

    if [ $EXIT -eq 0 ]
    then
        PS1="${PROMPT}\n\[\e[0m\]\$ "
    else
        PS1="🔴 ${PROMPT}\n\[\e[0m\]\$ "
    fi
    history -a
}
PROMPT_COMMAND=set_bash_prompt
