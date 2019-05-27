# Ln program setup
# ================
# Tim Friske <me@tifr.de>

# Make linking files and folders with the _Ln_ program more pleasant by
# default in the following ways:
#
# interactive::
#   Let _Ln_ prompt before overwriting.
#
# verbose::
#   Let _Ln_ report what it is doing.
#
export LN_X_OPTIONS=''
LN_X_OPTIONS+='--interactive '
LN_X_OPTIONS+='--verbose '
