# Bash aliases for Tar
# ====================
# Tim Friske <me@tifr.de>

# Call `tar` with default options.
#
alias tar='tar $TAR_X_OPTIONS'

alias mktar='tar --create'
alias dftar='tar --diff'
alias lstar='tar --list'
alias rmtar='tar --delete'
alias untar='tar --extract'
alias uptar='tar --update'
