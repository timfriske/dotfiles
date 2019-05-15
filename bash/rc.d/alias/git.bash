# Bash aliases for Git
# ====================
# Tim Friske <me@tifr.de>

# Define _Git_ itself as well as all of its aliases as _Bash_ aliases
# with the prefix letter `g`.  The _Git_ aliases will be lazily loaded
# and defined as _Bash_ aliases by the `git` function below.  Upon the
# first time this function is called it dynamically defines one _Bash_
# alias for e	ach _Git_ alias that is defined in one of _Git's_
# configuration files.  It then executes the `git` command with all the
# given arguments as if this function had never existed.  Once completed
# it eventually makes way for the `git` command by undefining itself.
#
function git {
  alias g='git'
  local git_alias
  for git_alias in $(command git config --list --name-only \
      | command grep '^alias\.' \
      | command cut --delimiter=. --fields=2); do
    alias "g$git_alias=git $git_alias"
  done
  command git "$@"
  unset -f git
}
