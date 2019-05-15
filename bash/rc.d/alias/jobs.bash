# Bash aliases for Jobs
# =====================
# Tim Friske <me@tifr.de>

# Define aliases and functions to ease job control.
#
if type -p fzf fzf-jobs &> /dev/null; then
  function jb {
    eval "$(jobs | cmd='bg' fzf-jobs "$@")"
  }

  function jd {
    eval "$(jobs | cmd='disown' fzf-jobs "$@")"
  }

  function jdh {
    eval "$(jobs | cmd='disown -h' fzf-jobs "$@")"
  }

  function jf {
    eval "$(jobs | cmd='fg' fzf-jobs "$@")"
  }

  function jj {
    eval "$(jobs | cmd='jobs' fzf-jobs "$@")"
  }

  function jkc {
    eval "$(jobs | cmd='kill -SIGCONT' fzf-jobs "$@")"
  }

  function jkk {
    eval "$(jobs | cmd='kill -SIGKILL' fzf-jobs "$@")"
  }

  function jkt {
    eval "$(jobs | cmd='kill -SIGTERM' fzf-jobs "$@")"
  }
else
  alias jb='bg'
  alias jd='disown'
  alias jdh='disown -h'
  alias jf='fg'
  alias jj='jobs'
  alias jkc='kill -SIGCONT'
  alias jkk='kill -SIGKILL'
  alias jkt='kill -SIGTERM'
fi
