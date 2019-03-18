# Insert fuzzy-found Git branches into command line
# =================================================
# Tim Friske <me@tifr.de>
#
# Program to let the user list _Git_ branches, fuzzy-find, pick and
# perform actions on those s/he is interested in.  The branches are
# represented by their short reference names (refname:short) for quick
# identification.  Each branch is hereby displayed on its own line.  The
# branches are sorted by version under the assumption that they might
# contain version identfiers.
#
# Note that this program is intended for interactive use.  For quick
# access it should be bound to a hot key such as `Ctrl-gb` (mnemonic
# `git branch') as follows:
#
# .Intended usage (`~/.bashrc`)
# ----
# # Test if fuzzy finder program _Fzf_ is installed.
# if type -p fzf &> /dev/null; then
#   source fzf-insert.bash &> /dev/null
#   if source fzf-git-branch-insert.bash &> /dev/null; then
#     bind -m vi-insert -x '"\C-gb": "fzf_git_branch_insert"'
#     bind -m vi-command '"\C-gb": "i\C-gb"'
#   fi
# fi
# ----

function fzf_git_branch_insert {
  cmd="fzf-git-branch" fzf_insert
}
