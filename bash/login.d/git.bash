# Git program setup
# =================
# Tim Friske <me@tifr.de>

# Let _Git_ skip reading settings from its system-wide configuration
# file `{system-home}/gitconfig`.  Assume that the user is a power user
# of _Git_ and configured every aspect of it down to the smallest detail
# in her/his personal _Git_ configuration files.
#
export GIT_CONFIG_NOSYSTEM=true

# Add _Git's_ commit message footer line `Signed-off-by`.
#
export GIT_X_SIGNOFF='--signoff'
