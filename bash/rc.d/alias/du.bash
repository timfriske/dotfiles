# Bash aliases for Du
# ===================
# Tim Friske <me@tifr.de>

# Show human-readable file and directory sizes in powers of 1,000.
# Summarize files and directories up to the current directory.
#
alias du='du --si'
alias dud="du --max-depth=1 \
> >(sort --human-numeric-sort --reverse)"
alias duf="du --all --max-depth=1 \
> >(sort --human-numeric-sort --reverse)"
alias dus='du --summarize'
