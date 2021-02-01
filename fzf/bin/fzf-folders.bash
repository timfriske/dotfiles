# Insert fuzzy-found folders into command line
# ============================================
# Tim Friske <me@tifr.de>
#
# This utility program searches below the current folder for folders and
# if found, quotes any special characters in their names, sorts them by
# version and let the user fuzzy-find and pick one or more of them
# interactively.
#
# Note that this _Bash_ file is intended for interactive use.  It should
# be sourced by a parent shell and bound to a hot key such as `Ctrl-ad`
# (mnemonic `all directories') as follows:
#
# .Intended usage
# ----
# # Test if fuzzy finder program _Fzf_ is installed.
# if type -p fzf &> /dev/null; then
#   source fzf-insert.bash &> /dev/null
#   if source fzf-folders.bash &> /dev/null; then
#     bind -m vi-insert -x '"\C-ad": "fzf_folders"'
#     bind -m vi-command '"\C-ad": "i\C-ad"'
#   fi
# fi
# ----
#
# Deps:: bash, fzf-finder, fzf-insert, fzf-pick, fzf-quote, fzf-sort

fzf_folders() {
  cmd="kind=folder fzf-finder \
    | fzf-quote \
    | order=version fzf-sort \
    | cmd='' write=1 fzf-pick" \
    fzf_insert
}
