#!/usr/bin/env bash -e

# Aliases for various tools

# coloured ssh
#alias ssh='colorssh'

# ls
alias ls='ls -FG'
alias ll='ls -laoh'

# ps
alias psg="ps aux | grep $1"

# tail
alias tf="tail -f"

# vim 
alias vim='mvim -v'

# ssh
alias ssh="$DOTFILES_DIR/bin/colorssh"

# git extras
alias gap="git add -p"

# Does a rebase pull + stash so I can be extra lazy.
# 
# usage: gpull origin
gpull () {
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

#
# Push the current branch with a remote specifier
#
gpush () {
	local head
	head=$(basename $(git symbolic-ref HEAD 2>/dev/null) 2>/dev/null)
	if [ "" = "$head" ]; then
		echo "Not on a branch, can't push"
		return 1
	fi
	if [ "$1" = "" ]; then
		echo "No remote selected can't push"
		return 2
	fi
	git push "$1" "$head"
}

__git_stash_pop () {
	[ "$1" != "No local changes to save" ] && git stash pop
}

#
# Take a branch and do the following:
#
# * Stash current changes.
# * Check out $1
# * git pull origin $1
# * Checkout the previous branch
# * Rebase it on $1
#
grebase () {
	local head
	local s
	local remote
	s=$(git stash 2>/dev/null)
	head=$(basename $(git symbolic-ref HEAD 2>/dev/null) 2>/dev/null)
	remote=$2

	if [ "" == "$head" ]; then
		echo "Not on a branch, can't pull"
		__git_stash_pop "$s"
		return 1
	fi
	if [ "$1" == "" ]; then
		echo "No branch selected, can't pull and rebase"
		__git_stash_pop "$s"
		return 2
	fi
	if [ "$remote" == "" ]; then
		remote="origin"
	fi
	# Switch to the original branch and get changes
	git checkout "$1"
	git pull $remote "$1"

	# Switch back and rebase
	git checkout $head
	git rebase "$1"
	__git_stash_pop "$s"
	return 0
}





