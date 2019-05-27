# Rmdir program setup
# ===================
# Tim Friske <me@tifr.de>

# Make removing *empty* folders with the _Rmdir_ program more pleasant
# by default in the following ways:
#
# parents::
#   Let _Rmdir_ create all folders, i.e. also the intermediate ones.
#
# verbose::
#   Let _Rmdir_ report what it is doing.
#
export RMDIR_X_OPTIONS=''
RMDIR_X_OPTIONS+='--parents '
RMDIR_X_OPTIONS+='--verbose '
