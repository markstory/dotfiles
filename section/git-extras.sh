# git extras
alias gap="git add -p"

# Does a rebase pull + stash so I can be extra lazy.
#
# usage: gpull origin
gpull () {
	local s=$(git stash 2>/dev/null)
	local ref=$(git symbolic-ref HEAD 2>/dev/null)
	local head=$(echo "$ref" | cut -d'/' -f3-9)

	if [ "" = "$head" ]; then
		echo "Not on a branch, can't pull"
		__git_stash_pop "$s"
		return 1
	fi
	local remote="$1"
	if [ "$remote" = "" ]; then
		remote="origin"
	fi
	git fetch -a "$remote"
	git pull --rebase "$remote" "$head"
	__git_stash_pop "$s"
	return 0
}

#
# Push the current branch with a remote specifier
#
gpush () {
	local head
	local ref
	local remote
	ref=$(git symbolic-ref HEAD 2>/dev/null)
	head=$(echo "$ref" | cut -d'/' -f3-9)
	remote="$1"
	if [ "" = "$head" ]; then
		echo "Not on a branch, can't push"
		return 1
	fi
	if [ "$remote" = "" ]; then
		remote="origin"
	fi
	git push "$remote" "$head"
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
# * Pop stash
#
grebase () {
	local head
	local s
	local ref
	local remote
	s=$(git stash 2>/dev/null)
	ref=$(git symbolic-ref HEAD 2>/dev/null)
	head=$(echo "$ref" | cut -d'/' -f3-9)
	remote=$2

	if [ "" = "$head" ]; then
		echo "Not on a branch, can't pull"
		__git_stash_pop "$s"
		return 1
	fi
	if [ "$1" = "" ]; then
		echo "No branch selected, can't pull and rebase"
		__git_stash_pop "$s"
		return 2
	fi
	if [ "$remote" = "" ]; then
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
