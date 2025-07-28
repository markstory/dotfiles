# Editors
export EDITOR='nvim'
export SVN_EDITOR='nvim'
export GIT_EDITOR='nvim'


# LESS - add colours to LESS
export LESS="--RAW-CONTROL-CHARS"
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2) # green blink
export LESS_TERMCAP_md=$(tput bold; tput setaf 6) # cyan bold
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_so=$(tput setaf 0; tput setab 6) # white on cyan for reversed text
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 3) # orange underline
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)
export LESS_TERMCAP_ZN=$(tput ssubm)
export LESS_TERMCAP_ZV=$(tput rsubm)
export LESS_TERMCAP_ZO=$(tput ssupm)
export LESS_TERMCAP_ZW=$(tput rsupm)
export GROFF_NO_SGR=1

# XDG config for sentry direnv
export XDG_RUNTIME_DIR="${HOME}/.local/run"
