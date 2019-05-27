# Grep program setup
# ==================
# Tim Friske <me@tifr.de>

# Make full-text searches with the _Grep_ program more pleasant by
# default in the following ways:
#
#   directories=recurse::
#     If given no files search all files in the current directory and
#     below in a recursive manner.  Otherwise _Grep_ would read from
#     standard input or if given a directory tell the user that it is
#     one.  _Grep's_ default behavior is simply not what users most
#     likely expect it to be.
#
#   binary-file=without-match::
#     If _Grep_ encounters binary files just ignore them.
#
#   devices=skip::
#     If _Grep_ encounters devices just ignore them.
#
#   color=auto::
#     If _Grep_ output is to a terminal colorize it.
#
export GREP_X_OPTIONS=''
GREP_X_OPTIONS+='--directories=recurse '
GREP_X_OPTIONS+='--binary-files=without-match '
GREP_X_OPTIONS+='--devices=skip '
GREP_X_OPTIONS+='--color=auto '
