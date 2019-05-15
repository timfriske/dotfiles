# Bash aliases for Systemctl
# ==========================
# Tim Friske <me@tifr.de>

# Define aliases to quickly control the system and user units, e.g.
# services, mounts, timers etc., managed and supervised by _Systemd_.
#
alias sd='systemctl'
alias sds='systemctl --system'
alias sdu='systemctl --user'
