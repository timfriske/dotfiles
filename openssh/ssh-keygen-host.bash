#!/usr/bin/env bash
#
# = SSH host key generation
# Tim Friske <me@tifr.de>
#
# This interactive program generates _SSH_ keys for the current host.
# It generates two keys, one _Ed25519_ key and one _RSA-4096_ key.  Any
# options are presented to the user whose default values s/he can either
# accept or overwrite.
#
# Imprtant note: For increased security and performance you should
# prefer the modern _Ed25519_ key whenever possible.  For compatibility
# with older _SSH_ implementations you can fallback to the dated but
# widely supported _RSA-4096_ key.
#
# Tip: Run this program with `sudo` as user `root` to generate _SSH_
# keys for this host on-the-fly, i.e. without logging in as that user
# and out again.

# Terminate execution on first error and abort this program.
set -o errexit

echo Choose folder common to all SSH key pairs for the host.
key_folder=/etc/ssh
read -p 'Key folder: ' -e -i "$key_folder" key_folder
key_folder=${key_folder:-.}
mkdir --verbose --parents -- "$key_folder"

# Generate the following types of _SSH_ keys for below reasons:
#
#   1. Ed25519: Generates a public and private key pair encoded
#      according to the _EdDSA_ _Edwards-curve Digital Signature
#      Algorithm_ public-key cryptography algorithm because it seems to
#      be the type of key with the most secure and also fastest digital
#      signature scheme currently supported by _SSH_ implementations
#      such as _OpenSSH_.  Other advantages are that an _Ed25519_ key is
#      of fixed length and also relatively short, e.g. when compared to
#      variable length types of keys such as _RSA_.
#
#   2. RSA: Generates a public and private key pair encoded according to
#      the _RSA_ _Rivest, Shamir and Adleman_ public-key cryptography
#      algorithm as a second best choice compared to the _Ed25519_ key
#      mainly for compatibility with older _SSH_ implementations.
#
# Important note: Because the files storing the private parts of host
# keys cannot be protected by passphrases they are secured with very
# restrictive file permissions instead such that only the owning user
# `root' may read these but no one else is able to access them in any
# way.
#
# Make use of the following non-standard options for below reasons:
#
#   1. Output file (f): Makes it clear that the owner took special care
#      when generating the keys.
#
#   2. Type (t): Generates the safest type of pair of keys.
#
#   3. Key size (b): Increases the key size to make the key even more
#      secure.
#
#   4. Comment (C): Includes the FQDN fully qualified domain name of the
#      current host in order to be able to identify the host key and to
#      differentiate it from other keys.
#
#   5. New-format private key (o): Saves the private key in the new file
#      format that makes the key harder for attackers to disclose and
#      corrput.  The `-o` flag is implicitly set for an _Ed25519_ key
#      but should be explicitly set for any Protocol 2 key.
#
#   6. New passphrase (N): Uses an empty passphrase, i.e. no passphrase
#      at all because host keys cannot have one.  Because the file
#      storing the private part of a host key cannot be protected by a
#      passphrase it is of utterly importance that only the user `root'
#      can read this file.  Also any write permissions to this file
#      should be withdrawn; even for the owning user `root'.
#
key_purpose="${1:+${1}_}"
echo Choose options of SSH Ed25519 public/private key pair.
key_file="id_ed25519"
read -p 'Key file: ' -e -i "$key_file" key_file
key_comment="SSH Ed25519 key of host $(hostname) created on \
$(date --iso-8601)."
read -p 'Key comment: ' -e -i "$key_comment" key_comment
key_path="$key_folder/$key_file"
ssh-keygen \
  -f  "$key_path" \
  -t ed25519 \
  -C "$key_comment" \
  -N ''
chmod --changes u=r,go= "$key_path"
echo Choose options of SSH RSA-4096 public/private key pair.
key_file="id_rsa"
read -p 'Key file: ' -e -i "$key_file" key_file
key_comment="SSH RSA-4096 key of host $(hostname) created on \
$(date --iso-8601)."
read -p 'Key comment: ' -e -i "$key_comment" key_comment
key_path="$key_folder/$key_file"
ssh-keygen \
  -f  "$key_path" \
  -t rsa \
  -b 4096 \
  -C "$key_comment" \
  -o \
  -N ''
chmod --changes u=r,go= "$key_path"
