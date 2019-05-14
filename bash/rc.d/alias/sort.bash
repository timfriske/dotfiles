# Bash aliases for Sort
# =====================
# Tim Friske <me@tifr.de>

# Count the number of occurrences and list them in ascending order of
# their counts.
#
alias count='sort | uniq --count | sort --sort=numeric'
