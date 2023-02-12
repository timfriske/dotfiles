# Insert fuzzy-found Tmux scrollback buffer strings into command line
# ===================================================================
# Tim Friske <me@tifr.de>
#
# This utility program searches through Tmux's scrollback buffer for individual
# strings and let the user fuzzy-find and pick one or more of them
# interactively.
#
# Note that this _Bash_ file is intended for interactive use. It should be
# sourced by a parent shell and bound to a hot key such as `Ctrl-as` (mnemonic
# `all strings') as follows:
#
# .Intended usage
# [source,bash]
# ----
# # Test if fuzzy finder program _Fzf_ is installed.
# if type -p fzf &> /dev/null; then
#   source fzf-insert.bash &> /dev/null
#   if source fzf-tmux-strings.bash &> /dev/null; then
#     bind -m vi-insert -x '"\C-as": "tmux_strings"'
#     bind -m vi-command '"\C-as": "i\C-as"'
#   fi
# fi
# ----
#
# Deps:: bash, fzf-insert, fzf-pick

function tmux_strings {
  cmd="tmux-strings | cmd='' read=1 write=1 fzf-pick" fzf_insert
}
