# Colour configuration
export COLORTERM="truecolor"

# Grep
export GREP_COLOR='1;33'

# ls colours
export CLICOLOR=1
export LSCOLORS='Gxfxcxdxdxegedabagacad'

if [[ "$TERM" = "" && "$OS_NAME" = "Linux" ]]; then
    #export TERM=screen-256color
fi
