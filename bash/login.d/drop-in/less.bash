# Less program setup
# ==================
# Tim Friske <me@tifr.de>

# Make paging with the _Less_ program more pleasant by default in the
# following ways:
#
#   no-init::
#     Prevent _Less_ from clearing the terminal screen when it quits.
#     This way the user has a chance to refer to the last screen full of
#     output even after _Less_ exited.
#
#   tabs=4::
#     Let _Less_ display each tabulator four spaces wide in order to let
#     its output consume less space on the screen.
#
#   LONG-PROMPT::
#     Let _Less_ to prompt even more verbosely than _More_.
#
#   ignore-case::
#     Let _Less_ search smarter by ignoring the case if the pattern
#     consists of lower-case characters only.  Let it perform a case-
#     sensitive search if the pattern contains upper-case characters.
#
#   jump-target=.5::
#     Let _Less_ position the next or previous line that matches a
#     search pattern in the center of the terminal screen.  This should
#     give the user enough context, i.e. lines surrounding that line.
#
#   hilite-unread::
#     Let _Less_ give the user visual guidance as to where s/he left off
#     reading after paging through a screen worth of output.
#
#   RAW-CONTROL-CHARS::
#     Let _Less_ output colors and escape the rest of `raw' control
#     characters in order to not mess up the terminal screen.
#
#   chop-long-lines::
#     Let _Less_ truncate overlong lines to the left and right but make
#     them horizontally scrollable instead.  Line wrapping works well
#     with continuous text such as text in paragraphs of text documents
#     but breaks structured text such as text arranged in table columns.
#
#   quit-if-one-screen::
#     Let _Less_ display automatically quit itself if there is less than
#     a screen full of output to display.  Don't let the user have to do
#     that every time.
#
export LESS=''
LESS+='--no-init '
LESS+='--tabs=4 '
LESS+='--LONG-PROMPT '
LESS+='--ignore-case '
LESS+='--jump-target=.5 '
LESS+='--hilite-unread '
LESS+='--RAW-CONTROL-CHARS '
LESS+='--chop-long-lines '
LESS+='--quit-if-one-screen '
