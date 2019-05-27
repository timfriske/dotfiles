# Tar program setup
# =================
# Tim Friske <me@tifr.de>

# Make handling _TARs_ _tape archives_ with the _Tar_ program more
# pleasant by default in the following ways:
#
#   verbose::
#     Let _Tar_ report what it is doing.
#
export TAR_X_OPTIONS=''
TAR_X_OPTIONS+='--auto-compress '
TAR_X_OPTIONS+='--verbose '
