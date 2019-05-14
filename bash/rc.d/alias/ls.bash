# Bash aliases for Ls
# ===================
# Tim Friske <me@tifr.de>

# Call `ls` with default options.
#
alias ls='ls $LS_X_OPTIONS'

# Short directory listings
# ------------------------

alias la='ls --almost-all'
alias lh='ls --almost-all --ignore="*"'

# Sorted directory lisings
# ~~~~~~~~~~~~~~~~~~~~~~~~

alias lt='ls --sort=time'
alias lv='ls --sort=version'
alias lx='ls --sort=extension'
alias lz='ls --sort=size'

# Let `ls` list directories in `long' format.
#
alias ll='ls --format=long'

# Long directory listings
# -----------------------

alias lla='ll --almost-all'
alias llh='ll --almost-all --ignore="*"'

# Sorted directory lisings
# ~~~~~~~~~~~~~~~~~~~~~~~~

alias llt='ll --sort=time'
alias llv='ll --sort=version'
alias llx='ll --sort=extension'
alias llz='ll --sort=size'
