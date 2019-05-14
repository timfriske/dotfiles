# Bash aliases for Rsync
# ======================
# Tim Friske <me@tifr.de>

# Call `tar` with default options.
#
alias rsync='rsync $RSYNC_X_OPTIONS'

# The verbs `backup' and `mirror' should be much more memorable than the
# alternative of having to type `rsync` together with all these options.
#
alias backup='rsync --archive --hard-links --acls --xattrs'
alias mirror='backup --delete'
