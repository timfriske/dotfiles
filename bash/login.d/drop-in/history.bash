# History setup
# =============
# Tim Friske <me@tifr.de>

# Remember up to 100,000 commands in memory and on disk.  Store the
# history in the `history` file under the `~/.bash` folder where most
# _Bash_ related files are to be found in order to reduce the number of
# hidden files of various progams directly below the user's home folder.
# Record the time when each command entered history as an ISO-8601
# timestamp.  Exclude commands starting with whitespace from history.
# Erase all duplicate commands from history before the same command is
# appended again.
#
# By enabling the `$HISTCONTROL` option `erasedups` the history is kept
# free from duplicate commands which would otherwise clutter up the
# history.  With this option enabled the `$HISTIGNORE` list of command
# patterns to ignore becomes less useful because trivial commands such
# as `cd`, `ls`, etc. which the user would usually want to be excluded
# now appear at most once in the history.  Exlcluding any command from
# history would actually complicate recalling past commands because the
# user had to think twice whether a command really entered the history.
# Therefore the `$HISTIGNORE` variable should be left unspecified.
#
export HISTSIZE=100000
export HISTFILE=~/.bash/history
export HISTFILESIZE="$HISTSIZE"
export HISTTIMEFORMAT='%Y-%m-%d %H:%M:%S '
export HISTCONTROL='ignorespace:erasedups'
###export HISTIGNORE=''
###HISTIGNORE+='+([[:alnum:]])*([[:space:]])'
