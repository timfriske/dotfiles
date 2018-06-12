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
