# Ls program setup
# ================
# Tim Friske <me@tifr.de>

# Make listing directories with the _Ls_ program more pleasant by default in
# the following ways:
#
#   si::
#     Let _Ls_ display file sizes as human-readable numbers in powers of
#     1,000 with their units in the _SI_-system, the _International
#     System of Units_ (Système International (d'unités)), e.g. KB, MB,
#     TB etc.  The _SI_-system is also the system in which most storage
#     device capacities are advertised.
#
#   classify::
#     Let _Ls_ append an indicator sign to each type of file to help the
#     user identify its file type, e.g. `/` for directories or `*` for
#     executable files.
#
#   clolor=auto::
#     Let _Ls_ colorize its output if it goes to a terminal.
#
#   time-style::
#     Let _Ls_ display the date-time in ISO-8601 `long' format.  Due to
#     the format's fixed-width pattern `+%Y-%m-%d %H:%M` it should be
#     more readable and independent from the current locale.  With up to
#     the minute precision it should be good enough for everyday use.
#
#   group-directories-first::
#     Let _Ls_ list all directories before all other kinds of files,
#     e.g. regular files, symbolic links etc. because such directory
#     listings might be easier on the eye and therefore to comprehend.
#
export LS_X_OPTIONS=''
LS_X_OPTIONS+='--si '
LS_X_OPTIONS+='--classify '
LS_X_OPTIONS+='--color=auto '
LS_X_OPTIONS+='--time-style=long-iso '
LS_X_OPTIONS+='--group-directories-first '
