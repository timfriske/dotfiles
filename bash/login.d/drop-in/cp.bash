# Cp program setup
# ================
# Tim Friske <me@tifr.de>

# Make copying files and folders with the _Cp_ program more pleasant by
# default in the following ways:
#
# interactive::
#   Let _Cp_ prompt before overwriting.
#
# verbose::
#   Let _Cp_ report what it is doing.
#
export CP_X_OPTIONS=''
CP_X_OPTIONS+='--interactive '
CP_X_OPTIONS+='--verbose '
