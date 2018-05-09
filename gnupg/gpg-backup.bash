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

# Terminate execution on first error and abort this program.
set -o errexit

# Output _GPG_ version with which _OpenPGP_ keys are generated.
gpg --version

# Backup file *must* be given as first parameter.
backup_name="${backup_name-$1}"

if [[ -z "$backup_name" ]]; then
  echo 'Please specify a backup name.'
  exit 1
fi

function backup_file {
  local file_to_backup="$1"
  if [[ -e "$file_to_backup" ]]; then
    if [[ ! -f "$file_to_backup" ]]; then
      echo "File '$file_to_backup' must be a regular file."
      exit 2
    fi
    if [[ ! -r "$file_to_backup" ]]; then
      echo "File '$file_to_backup' must be readable."
      exit 2
    fi
    # Back up the latest backup file which will be replaced by a new
    # one under the same name.
    chmod u=r,go= -- "$file_to_backup"
    cp --force --backup=numbered --archive \
      -- "$file_to_backup" "$file_to_backup"
    rm --force -- "$file_to_backup"
  fi
}
