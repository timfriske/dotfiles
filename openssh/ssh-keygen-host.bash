#!/usr/bin/env bash
#
# = OpenSSH host key generation
# Tim Friske <me@tifr.de>
#
# This program generates _OpenSSH_ keys for the current host.  It
# generates two keys, one _Ed25519_ key and one _RSA-4096_ key.
#
# Imprtant note: For increased security and performance you should
# prefer the modern _Ed25519_ key whenever possible.  For backwards
# compatibility with older _SSH_ clients and servers you can fallback to
# the dated but widely supported _RSA-4096_ key.
#
# Tip: Run this program with `sudo` as user `root' to generate _OpenSSH_
# keys for this host on-the-fly, i.e. without using `su` to to log in as
# user `root' and out again.

# Defines and creates a non-standard folder below which the public and
# private host key pairs are stored.  By doing so unintended overwrites
# by standard invocations of `ssh-keygen` become less probable.  It
# should also hint others that the owner spent some thoughts on the
# topic of `key generation' and took special care when creating those
# host keys.
#
key_folder=/etc/ssh/host/key
mkdir --verbose --parents "$key_folder"
