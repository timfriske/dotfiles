# Diff program setup
# ==================
# Tim Friske <me@tifr.de>

# Make comparing differences between files and directories with the
# _Diff_ program more pleasant by default in the following ways:
#
#  unified::
#    output NUMBER (3) lines above and below a diff hunk in the
#    `unified' diff format.  This format is more readable than _Diff's_
#    default `normal' format.  The `unified' format is also the default
#    format used by _Git_.
#
#  ignore-tab-expansion::
#  ignore-space-change::
#  ignore-trailing-space::
#  ignore-blank-lines::
#  ignore-all-space::
#    Don't get distracted from any kind of changes in whitespace.
#    Whitespace usually doesn't change the meaning of the content of a
#    file for most file formats.
#
#  color=auto::
#    If _Diff_ output is to a terminal colorize it.
#
export DIFF_X_OPTIONS=''
DIFF_X_OPTIONS+='--unified '
DIFF_X_OPTIONS+='--ignore-tab-expansion '
DIFF_X_OPTIONS+='--ignore-space-change '
DIFF_X_OPTIONS+='--ignore-trailing-space '
DIFF_X_OPTIONS+='--ignore-blank-lines '
DIFF_X_OPTIONS+='--ignore-all-space '
DIFF_X_OPTIONS+='--color=auto '
