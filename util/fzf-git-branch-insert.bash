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
# access it should be bound to a hot key.

function fzf_git_branch_insert {
  cmd="fzf-git-branch" fzf_insert
}
