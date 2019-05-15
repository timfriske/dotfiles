# Bash aliases for Find
# =====================
# Tim Friske <me@tifr.de>

# Find broken links, i.e. symbolic links which lost their target files
# or folders.  This usually occurs when either the symbolic links or
# their targets move and their references are not updated.
#
alias broken-links='find -xtype l'
