# Bash aliases for Fzf
# ====================
# Tim Friske <me@tifr.de>

# Test if fuzzy finder program _Fzf_ is installed.
#
if type -p fzf &> /dev/null; then

  # Test if _Fzf_ specific _Readline_ file is readable.
  #
  if [[ -f ~/.inputrc.fzf && -r ~/.inputrc.fzf ]]; then

    # Make _Fzf_ available through _Readline_ key bindings.
    #
    bind -f ~/.inputrc.fzf
  fi
  source fzf-insert.bash &> /dev/null
  if source fzf-files.bash &> /dev/null; then
    bind -m vi-insert -x '"\C-af": "fzf_files"'
    bind -m vi-command '"\C-af": "i\C-af"'
  fi
  if source fzf-folders.bash &> /dev/null; then
    bind -m vi-insert -x '"\C-ad": "fzf_folders"'
    bind -m vi-command '"\C-ad": "i\C-ad"'
  fi
  if type -p fzf-git-branch &> /dev/null; then
    bind -m vi-insert -x '"\C-gb": "fzf-git-branch"'
    bind -m vi-command '"\C-gb": "i\C-gb"'
    bind -m vi-insert -x \
      '"\C-gr": "branch_opts=--remotes fzf-git-branch"'
    bind -m vi-command '"\C-gr": "i\C-gr"'
  fi
  if source fzf-git-branch-insert.bash &> /dev/null; then
    bind -m vi-insert -x '"\C-ab": "fzf_git_branch_insert"'
    bind -m vi-command '"\C-ab": "i\C-ab"'
    bind -m vi-insert -x \
      '"\C-ar": "branch_opts=--remotes fzf_git_branch_insert"'
    bind -m vi-command '"\C-ar": "i\C-ar"'
  fi
  if type -p fzf-git-tag &> /dev/null; then
    bind -m vi-insert -x '"\C-gt": "fzf-git-tag"'
    bind -m vi-command '"\C-gt": "i\C-gt"'
  fi
  if source fzf-git-tag-insert.bash &> /dev/null; then
    bind -m vi-insert -x '"\C-at": "fzf_git_tag_insert"'
    bind -m vi-command '"\C-at": "i\C-at"'
  fi
fi
