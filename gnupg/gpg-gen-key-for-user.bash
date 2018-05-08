#!/usr/bin/env bash
#
# = GPG Key Generation for Personal Use
# Tim Friske <me@tifr.de>
#
# Generates _OpenPGP_ keys with _GPG_ for personal use for a given user
# ID following best practices:
#
#   . Only one user ID to keep identities separate.
#   . One key per capability to revoke them independently.
#   . Favor elliptic curve 25519 over NIST curve key algorithm.
#   . Favor elliptic curve 25519 over RSA key algorithm.
#   . One certification-only Ed25519 primary key.
#   . One signature-only Ed25519 secondary key.
#   . One encryption-only Cv25519 secondary key.
#   . One authentication-only Ed25519 secondary key.

# Terminate execution on first error and abort this program.
set -o errexit

# Output _GPG_ version with which _OpenPGP_ keys are generated.
gpg --version

# User ID *must* be given as first parameter.
user_id="${user_id-$1}"

if [[ -z "$user_id" ]]; then
  echo 'Please specify a user ID of the form'
  echo '"Real Name (Comment) <real.name@example.com>"'
  echo 'where "Real Name" and "(Comment)" are optional.'
  echo 'An email address alone must be given without "<>".'
  exit 1
fi
