# Bash aliases for Xargs
# ======================
# Tim Friske <me@tifr.de>

# Run given command on every argument usually read from pipe.  The alias
# `map` resembles the well-known mathematical term `mapping' also known
# as `map'.
#
alias map='xargs --max-args=1'
