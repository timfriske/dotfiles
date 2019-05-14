# Bash aliases for Cd
# ===================
# Tim Friske <me@tifr.de>

# Toggle between current and previous directory.  Hitting `cc` should be
# much faster than typing `cd`, space, and then reaching out for `-`.
#
# Note that on some systems the alias `cc` could conflict with the GNU
# Compiler collection's C-compiler but that disadvantage is taken into
# account.
#
alias cc='cd -'

# With the shell option `autocd` switched on executing `..` already
# changes to the parent directory.  The alias `...` expands on that idea
# by making it possible to go up two directories at once.  More than two
# levels in one go would mean too much mental work.
#
alias ..='cd ..'
alias ...='cd ../..'
