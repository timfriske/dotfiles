# Mv program setup
# ================
# Tim Friske <me@tifr.de>

# Make moving files and folders with the _Mv_ program more pleasant by
# default in the following ways:
#
# interactive::
#   Let _Mv_ prompt before overwriting.
#
# verbose::
#   Let _Mv_ report what it is doing.
#
export MV_X_OPTIONS=''
MV_X_OPTIONS+='--interactive '
MV_X_OPTIONS+='--verbose '
