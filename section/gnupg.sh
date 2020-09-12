# Newer versions of GnuPG require GPG_TTY to be set
# in order to work with git.
export GPG_TTY=$(tty)
