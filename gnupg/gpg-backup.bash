#!/usr/bin/env bash
#
# = GPG Key Backup
# Tim Friske <me@tifr.de>
#
# Backs up _OpenPGP_ keys with _GPG_ by either exporting all keys from
# all key rings or, if at least one name is given, those of the given
# names.  The backup is written in _GnuPG's_ binary format to the backup
# file given as the first argument.  Any further arguments are treated
# as the names of the keys to back up.
