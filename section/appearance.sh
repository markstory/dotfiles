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
  if [[ -n "$VIRTUAL_ENV" ]]; then
      echo -n " ${BLUE}py:$(basename $VIRTUAL_ENV)${RESET}"
  fi
}


VCPROMPT_CMD=/usr/local/bin/vcprompt
function vcprompt () {
    if [[ -e "$VCPROMPT_CMD" ]]; then
        $VCPROMPT_CMD -f " on ${GREEN}%b%m%u${RESET}"
    fi
}

# Prompt config
function set_bash_prompt {
    EXIT="$?"

    PROMPT="${BLUE}\D{%H:%M:%S}${RESET} \u:\W$(set_virtualenv)$(vcprompt)"

    if [ $EXIT -eq 0 ]
    then
        PS1="ᐉ ${PROMPT}\n\[\e[0m\]\$ "
    else
        PS1="${RED}ᐉ${RESET} ${PROMPT}\n\[\e[0m\]\$ "
    fi
    history -a
}
PROMPT_COMMAND=set_bash_prompt
