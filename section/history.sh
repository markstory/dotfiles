# Append history on exit instead of overwriting.
shopt -s histappend

# Erase duplicates
export HISTCONTROL='ignoredups:erasedups'

# Big history
export HISTSIZE=5000

function rh {
	history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head
}
