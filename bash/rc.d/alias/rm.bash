# Bash aliases for Rm
# ===================
# Tim Friske <me@tifr.de>

# Call `rm` with default options.
#
alias rm='rm $RM_X_OPTIONS'

# Define alias for recursively deleting files in a directory tree.
#
alias rr='rm --recursive'

# The `recursive` option does not play well with the `interactive`
# option because `rm` would prompt the user for each and every directory
# and file whether to descend into that directory as well as whether to
# delete that file.  The same cumbersome behavior would apply to read-
# only directories and files but is overridden with the `force` option.
#
alias rrf='rr --force'
