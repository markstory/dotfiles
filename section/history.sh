#!/usr/bin/env bash

# Append history on exit
shopt -s histappend

# Erase duplicates
export HISTCONTROL='erasedups'

# Big history
export HISTSIZE=5000

function rh {
	history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head
}
