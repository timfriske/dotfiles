# Bash shell options
# ==================
# Tim Friske <me@tifr.de>

# Edit commands with Vi- instead of Emacs-like key bindings.
#
shopt -os vi

# Make it easy to name and navigate directories.
#
shopt -s autocd cdable_vars cdspell dirspell

# List any stopped and running jobs before exiting an interactive shell
# in order to not kill important jobs unintentionally but exit them
# manually, e.g. by saving their data first.  To list the remaining jobs
# is what most users would usually do if the shell they are about to
# exit reports that there are a number of stopped jobs.
#
shopt -s checkjobs

# Update window size after each command.
#
shopt -s checkwinsize

# Also store multi-line commands in history in case the user wants to
# adapt them later on, e.g. in case of syntax errors.
#
shopt -s cmdhist lithist

# Recognize extended set of patterns during pattern matching and path
# name expansion.
#
shopt -s extglob globstar

# Make command history more accessible.
#
shopt -s histappend histreedit histverify

# Don't overwrite files with `>` file redirection operator.  This
# setting may be overruled adhoc by using the `>|` operator.
#
shopt -os noclobber

# Attempt to complete commands once a non-empty prefix is given in order
# to not list the entire arsenal of commands but an already reduced list.
#
shopt -s no_empty_cmd_completion

# Ignore upper- and lower case during path name expansion and pattern
# matching.
#
shopt -s nocaseglob nocasematch
