# Bash aliases for Ch XYZ
# =======================
# Tim Friske <me@tifr.de>

# Never start from the root directory because this would almost always
# mean to *destroy* the *entire* root file system and *all* file systems
# mounted below.  Report only when and which files and directories
# actually changed.
#
alias chgrp='chgrp --preserve-root --changes'
alias chmod='chmod --preserve-root --changes'
alias chown='chown --preserve-root --changes'
