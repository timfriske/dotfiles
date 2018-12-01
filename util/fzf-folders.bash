# Insert fuzzy-found folders into command line
# ============================================
# Tim Friske <me@tifr.de>
#
# Dependencies::
#   _Bash_, _Fzf-find_, _Fzf-insert_, _Fzf-pick_, _Fzf-quote_,
#   _Fzf-sort_

function fzf_folders {
  cmd="kind=folder fzf-find \
    | fzf-quote \
    | order=version fzf-sort \
    | cmd='' write=1 fzf-pick" \
    fzf_insert
}
