# Bash aliases for Tmux
# =====================
# Tim Friske <me@tifr.de>

# Define aliases to ease access to the terminal multiplexer program
# _Tmux_.
#
if type -p tmux &> /dev/null; then

  # Expect terminals to display 256 colors.
  #
  alias tmux='tmux -2'

  alias t='tmux'
  alias tt='{ tmux attach-session || tmux new-session; } &> /dev/null'
  alias tas='tmux attach-session'
  alias tdc='tmux detach-client'
  alias tks='tmux kill-session'
  alias tlc='tmux list-clients'
  alias tls='tmux list-sessions'
  alias tns='tmux new-session'
  alias trc='tmux refresh-client'
fi
