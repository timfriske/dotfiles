# Bash aliases for Date
# =====================
# Tim Friske <me@tifr.de>
#
# _Epoch_:: Seconds since 1970-01-01T00:00:00 _UTC_, a.k.a _Unix time_.
# _UTC_:: _Universal Time Coordinated_.
# _GMT_:: _Greenwich Mean Time_.

# Show seconds since _Epoch_.
#
alias epoch='date +"%s"'

# Show _GMT_ _Greenwich Mean Time_.
#
alias gmt='TZ=GMT date'

# Show _UTC_ _Universal Time Coordinated_.
#
alias utc='TZ=UTC date'

# Show calendar week of year.
#
alias week='date +"week %V"'
