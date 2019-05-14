# Bash aliases for Diff
# =====================
# Tim Friske <me@tifr.de>

# Call `diff` with default options.
#
alias diff='diff $DIFF_X_OPTIONS'

# When comparing directories only show the name of the files which are
# in either one of the two given directories or differ.  Do not show the
# differences in content between the actual files because that would
# result in cognitive overload.
#
alias diff-dirs='diff --recursive --brief'
