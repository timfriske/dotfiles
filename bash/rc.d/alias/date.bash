# Bash aliases for Date
# =====================
# Tim Friske <me@tifr.de>
#
# _UTC_:: _Universal Time Coordinated_.
# _GMT_:: _Greenwich Mean Time_.

# Show _GMT_ _Greenwich Mean Time_.
#
alias gmt='TZ=GMT date'

# Show _UTC_ _Universal Time Coordinated_.
#
alias utc='TZ=UTC date'

# Show calendar week of year.
#
alias week='date +"week %V"'
