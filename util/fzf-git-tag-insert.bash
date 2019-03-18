# Insert fuzzy-found Git tags into command line
# =============================================
# Tim Friske <me@tifr.de>
#
# Program to let the user list _Git_ tags, fuzzy-find, pick and perform
# actions on those s/he is interested in.

function fzf_git_tag_insert {
  cmd="fzf-git-tag" fzf_insert
}
