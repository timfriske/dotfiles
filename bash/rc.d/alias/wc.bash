# Bash aliases for Wc
# ===================
# Tim Friske <me@tifr.de>

# Count entities in various units such as words, lines, etc.  Just pipe
# the output of a program whose entities to count into the appropriate
# one of the aliases below.
#
alias bytes='wc --bytes'
alias chars='wc --chars'
alias lines='wc --lines'
alias words='wc --words'
