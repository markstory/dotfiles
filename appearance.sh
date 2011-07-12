# Colours
GREEN="\[\033[0;32m\]"
WHITE="\[\033[0;37m\]"
RED="\033[0;31;m\]"


# Prompt config
function exitstatus {
	EXIT="$?"
	PROMPT="\u:\W$(__git_ps1) \$ "

	if [ $EXIT -eq 0 ]
	then
		PS1=":) $PROMPT"
	else
		PS1="$RED:($WHITE $PROMPT"
	fi
}
PROMPT_COMMAND=exitstatus
