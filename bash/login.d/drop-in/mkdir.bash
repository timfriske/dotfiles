# Mkdir program setup
# ===================
# Tim Friske <me@tifr.de>

# Make creating *empty* folders with the _Mkdir_ program more pleasant
# by default in the following ways:
#
# parents::
#   Let _Mkdir_ create all folders, i.e. also the intermediate ones.
#
# verbose::
#   Let _Mkdir_ report what it is doing.
#
export MKDIR_X_OPTIONS=''
MKDIR_X_OPTIONS+='--parents '
MKDIR_X_OPTIONS+='--verbose '
