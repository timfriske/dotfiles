# Rm program setup
# ================
# Tim Friske <me@tifr.de>

# Make removing files and folders with the _Rm_ program more pleasant by
# default in the following ways:
#
# interactive::
#   Let _Rm_ prompt before overwriting.
#
# verbose::
#   Let _Rm_ report what it is doing.
#
export RM_X_OPTIONS=''
RM_X_OPTIONS+='--interactive '
RM_X_OPTIONS+='--verbose '
