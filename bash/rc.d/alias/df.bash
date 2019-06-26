# Bash aliases for Df
# ===================
# Tim Friske <me@tifr.de>

# Show human-readable file system sizes in powers of 1,000.
#
alias df='df ${DF_X_OPTIONS:-}'

# Exclude neglectable types of file systems.
#
alias dff='df -x devtmpfs -x tmpfs'
