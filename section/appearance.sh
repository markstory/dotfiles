#!/usr/bin/env bash

# Colours
BOLD="\e[1m"
GREEN="\[\e[0;32m"
WHITE="\[\e[0;37m"
MAGENTA="\[\e[0;35m"
BLUE="\[\e[0;34m"
RESET="\[\e[0m"
RED="\[\e[0;31m"

export COLORTERM="truecolor"

# Grep
export GREP_COLOR='1;33'

# ls colours
export CLICOLOR=1
export LSCOLORS='Gxfxcxdxdxegedabagacad'

# Determine active Python virtualenv details.
function set_virtualenv () {
  if [[ -n "$VIRTUAL_ENV" ]]; then
      echo -n " ${BLUE}py:$(basename $VIRTUAL_ENV)${RESET}"
  fi
}


VCPROMPT_CMD=$DOTFILES_DIR/bin/vcprompt
function vcprompt () {
    if [[ -e "$VCPROMPT_CMD" ]]; then
        $VCPROMPT_CMD -f " on ${GREEN}%b[%m%a%u]${RESET}"
    fi
}

# Prompt config
function set_bash_prompt {
    local EXIT_CODE="$?"

    PROMPT="${BLUE}\D{%H:%M:%S}${RESET} \u ${MAGENTA}\w${RESET}$(set_virtualenv)$(vcprompt)"
    if [[ $EXIT_CODE == 0 ]]
    then
        PS1="${PROMPT}\n${GREEN}ᐉ${RESET}\] "
    else
        PS1="${PROMPT}\n${RED}ᐉ${RESET}\] "
    fi
    history -a
}
PROMPT_COMMAND="set_bash_prompt;$PROMPT_COMMAND"
