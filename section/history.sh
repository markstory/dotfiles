# History
SAVEHIST=5000
HISTSIZE=2000
HISTFILE=${HOME}/.zsh_history

# Share history across sessions.
setopt SHARE_HISTORY
setopt APPEND_HISTORY

# Add commands incrementally
setopt INC_APPEND_HISTORY

# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST 

# do not store duplications
setopt HIST_IGNORE_DUPS

#ignore duplicates when searching
setopt HIST_FIND_NO_DUPS

# removes blank lines from history
setopt HIST_REDUCE_BLANKS

# Enable prompt substitutions
setopt prompt_subst
