# Insert fuzzy-found Git tags into command line
# =============================================
# Tim Friske <me@tifr.de>
#
# Program to let the user list _Git_ tags, fuzzy-find, pick and perform actions
# on those s/he is interested in. The tags are represented by their short
# reference names (refname:short) for quick identification. Each tag is hereby
# displayed on its own line. The tags are sorted by version under the assumption
# that they might contain version identfiers.
#
# Note that this program is intended for interactive use. For quick access it
# should be bound to a hot key such as `Ctrl-gt` (mnemonic `git tag') as
# follows:
#
# .Intended usage (`~/.bashrc`)
# [source,bash]
# ----
# # Test if fuzzy finder program _Fzf_ is installed.
# if type -p fzf &> /dev/null; then
#   source fzf-insert.bash &> /dev/null
#   if source fzf-git-tag-insert.bash &> /dev/null; then
#     bind -m vi-insert -x '"\C-gt": "fzf_git_tag_insert"'
#     bind -m vi-command '"\C-gt": "i\C-gt"'
#   fi
# fi
# ----
#
# Deps:: bash, fzf-git-tag, fzf-insert

function fzf_git_tag_insert {
  cmd=fzf-git-tag fzf_insert
}
