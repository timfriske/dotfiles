# Bash aliases for Xdg-open
# =========================
# Tim Friske <me@tifr.de>

# Just type `open` to open a file or URL in the user's preferred
# application.  No one can remember that the program is named
# `xdg-open`.
#
# On some systems a program named `open` might already exist. Only
# define `open` as alias if no such program exists.
#
if ! type -p open &> /dev/null; then
  alias open='xdg-open'
fi
