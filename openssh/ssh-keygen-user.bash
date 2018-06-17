#!/usr/bin/env bash
#
# = OpenSSH user key generation
# Tim Friske <me@tifr.de>
#
# This program generates _OpenSSH_ keys for the current user.  It
# generates two keys, one _Ed25519_ key and one _RSA-4096_ key.
#
# Imprtant note: For increased security and performance you should
# prefer the modern _Ed25519_ key whenever possible.  For backwards
# compatibility with older _SSH_ clients and servers you can fallback to
# the dated but widely supported _RSA-4096_ key.
#
# Tip: Run this program with `sudo` as another user to generate
# _OpenSSH_ keys for that user on-the-fly, i.e. without to to log in as
# that user and out again.

# Defines and creates a non-standard folder below which the public and
# private user key pairs are stored.  By doing so unintended overwrites
# by standard invocations of `ssh-keygen` become less probable.  It
# should also hint others that the owner spent some thoughts on the
# topic of `key generation' and took special care when creating those
# user keys.
#
key_folder=~/.ssh/user/key
mkdir --verbose --parents "$key_folder"

# Generates the following types of _OpenSSH_ keys:
#
#   1. Ed25519: Generates a public and private key pair encoded
#      according to the _EdDSA_ _Edwards-curve Digital Signature
#      Algorithm_ public-key cryptography algorithm because it seems to
#      be the type of key with the most secure and also fastest digital
#      signature scheme currently supported by _OpenSSH_.  Other
#      advantages are that an _Ed25519_ key is of fixed length and also
#      relatively short, e.g.  when compared to variable length types of
#      keys such as _RSA_.
#
#   2. RSA: Generates a public and private key pair encoded according to
#      the _RSA_ _Rivest, Shamir and Adleman_ public-key cryptography
#      algorithm as a second best choice compared to the _Ed25519_ key.
#
# Makes use of the following non-standard options:
#
#   1. Output file (f): Makes it clear that the owner took special care
#      when generating the keys.
#
#   2. Type (t): Generates the safest type of pair of keys.
#
#   3. Key size (b): Increases the key size to make the key even more
#      secure.
#
#   4. Comment (C): Only includes the user name of the current user as
#      opposed to also the appended FQDN fully qualified domain name of
#      the current host because the user should be able to reuse the key
#      pair from any host where he has an account.
#
#   5. New-format private key (o): Saves the private key in the new file
#      format that makes the key harder for attackers to disclose and
#      corrput.  The `-o` flag is implicitly set for an _Ed25519_ key
#      but should be explicitly set for any Protocol 2 key.
#
#   6. KDF rounds (a): Increases the KDF key derivation function rounds
#      in order to make it harder to verify and thus to brute-force
#      crack the passphrase.
#
key_purpose="${1:+${1}_}"
ssh-keygen \
  -f "$key_folder/${key_purpose}ed25519" \
  -t ed25519 \
  -C "$USER" \
  -a 100
ssh-keygen \
  -f "$key_folder/${key_purpose}rsa4096" \
  -t rsa \
  -b 4096 \
  -C "$USER" \
  -o \
  -a 100
