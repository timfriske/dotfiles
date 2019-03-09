# Insert fuzzy-found files into command line
# ==========================================
# Tim Friske <me@tifr.de>
#
# This utility program searches below the current folder for files and
# if found, quotes any special characters in their names, sorts them by
# version and let the user fuzzy-find and pick one or more of them
# interactively.
#
# Note that this _Bash_ file is intended for interactive use.  It should
# be sourced by a parent shell and bound to a hot key such as `Ctrl-af`
# (mnemonic `all files').
#
# Dependencies::
#   _Bash_, _Fzf-find_, _Fzf-insert_, _Fzf-pick_, _Fzf-quote_,
#   _Fzf-sort_

function fzf_files {
  cmd="kind=file fzf-find \
    | fzf-quote \
    | order=version fzf-sort \
    | cmd='' write=1 fzf-pick" \
    fzf_insert
}
