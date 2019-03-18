# Insert fuzzy-found Git tags into command line
# =============================================
# Tim Friske <me@tifr.de>
#
# Program to let the user list _Git_ tags, fuzzy-find, pick and perform
# actions on those s/he is interested in.  The tags are represented by
# their short reference names (refname:short) for quick identification.
# Each tag is hereby displayed on its own line.  The tags are sorted by
# version under the assumption that they might contain version
# identfiers.
#
# Note that this program is intended for interactive use.  For quick
# access it should be bound to a hot key.

function fzf_git_tag_insert {
  cmd="fzf-git-tag" fzf_insert
}
