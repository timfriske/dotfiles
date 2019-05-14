# Bash aliases for Pbcopy/Pbpaste/Xsel/Xclip
# ==========================================
# Tim Friske <me@tifr.de>

# Simplify data exchange between CLI and GUI via clipboard.
#
if type -p xclip &> /dev/null; then
  alias pbc='xclip -selection clipboard -in'
  alias pbp='xclip -selection clipboard -out'
elif type -p xsel &> /dev/null; then
  alias pbc='xsel --clipboard --input'
  alias pbp='xsel --clipboard --output'
elif ! type -p pbcopy pbpaste &> /dev/null; then
  alias pbc='echo Please install xclip, xsel or pbcopy.'
  alias pbp='echo Please install xclip, xsel or pbpaste.'
fi
