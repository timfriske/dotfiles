# Program setup
# =============
# Tim Friske <me@tifr.de>

# Tell programs to open files in favorite text editor _Vim_ _Vi
# Improved_.  Don't care about line-oriented vs. visual editors just
# assign both `$EDITOR` and `$VISUAL` the same editor.
#
export EDITOR='vim'
export VISUAL='vim'

# Tell programs to open files in favorite pager _Less_.
#
export PAGER='less'
export SYSTEMD_LESS="$LESS"
