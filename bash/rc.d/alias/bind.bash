# Bash aliases for Bind
# =====================
# Tim Friske <me@tifr.de>

# List Vi-like key bindings in different modes.
#
alias vi-command='bind -m vi-command -p \
  | \grep --extended-regexp --invert-match "^#|self-insert$"'
alias vi-command-all='bind -m vi-command -p'
alias vi-insert='bind -m vi-insert -p \
  | \grep --extended-regexp --invert-match "^#|self-insert$"'
alias vi-insert-all='bind -m vi-insert -p'
