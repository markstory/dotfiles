#!/usr/bin/env bash

# Aliases for various tools

# ls
alias ls='ls -FG'
alias ll='ls -laoh'



# git extras
alias gap="git add -p"

# Does a rebase pull + stash so I can be extra lazy.
# 
# usage: gp origin
gp () {
	local s
	local head
	s=$(git stash 2>/dev/null)
	head=$(basename $(git symbolic-ref HEAD 2>/dev/null) 2>/dev/null)
	if [ "" == "$head" ]; then
		echo "Not on a branch, can't pull"
		__git_stash_pop "$s"
		return 1
	fi
	if [ "$1" = "" ]; then
		echo "No remote selected, can't pull"
		__git_stash_pop "$s"
		return 2
	fi
	git fetch -a $1
	git pull --rebase $1 "$head"
	__git_stash_pop "$s"
	return 0
}

__git_stash_pop () {
	[ "$1" != "No local changes to save" ] && git stash pop
}





