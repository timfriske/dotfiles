# Rsync program setup
# ===================
# Tim Friske <me@tifr.de>

# Make synchronizing large/many files and folders, i.e. by copying,
# moving and deleting them, with the _Rsync_ program more pleasant by
# default in the following ways:
#
# human-readable::
#   Let _Rsync_ output numbers, in a human-friendly format.  For example
#   thousands separators, units to the power of 1000, symbols for units
#   larger than 1000, etc.
#
# progress::
#   Let _Rsync_ report what it is doing on a per-file basis. See also
#   `info=progress2` option if you want to see statistics about the
#   transfer as a whole.
#
export RSYNC_X_OPTIONS=''
RSYNC_X_OPTIONS+='--human-readable '
RSYNC_X_OPTIONS+='--progress '
