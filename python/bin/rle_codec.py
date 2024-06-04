#!/usr/bin/env python3

"""
The rle_codec module provides functions to encode and decode strings via the run-length-encoding algorithm. It can also be run as a script.
It reads its input from the standard input stream and writes its output the standard output stream. Log messages are written to the standard
error stream.
"""

import atexit
import enum
import itertools
import os.path
import re
import sys
from argparse import ArgumentDefaultsHelpFormatter, ArgumentParser
from dataclasses import dataclass
from datetime import datetime
from enum import Enum
from functools import lru_cache, partial
from typing import Callable, TypeAlias

FILENAME = os.path.basename(__file__)
SUBCOMMAND = "subcommand"


@enum.unique
class Subcommand(Enum):
    """Supported subcommands when run as a script."""
    ENCODE = "encode"
    DECODE = "decode"


@dataclass(frozen=True)
class Config:
    """Configuration settings."""
    characters: str
    """The set of characters to accept."""
    subcommand: Subcommand
    """The subcommand to execute when run as a script."""


Codec: TypeAlias = Callable[[str], str]

log: Callable[[str], None] = partial(print, file=sys.stderr)
"""Curried function to print log messages to standard error stream."""

CHARACTERS = "characters"
LENGTH = "length"
RUN = "run"


def encoding(characters: str) -> Codec:
    """Factory function to create and configure an encoder."""
    character_set = set(characters)

    @lru_cache()
    def encoder(string: str) -> str:
        index = 0
        encoded = ""
        for key, group in itertools.groupby(string):
            length = sum(1 for _ in group)
            if key not in character_set:
                raise ValueError(f"Encountered illegal character '{key}' at index '{index}' in string '{string}'.")
            index += length
            encoded += key if length == 1 else f"{key}{length}"
        return encoded

    return encoder


def decoding(characters: str) -> Codec:
    """Factory function to create and configure a decoder."""
    rle_regex = create_rle_regex(characters)

    @lru_cache()
    def decoder(string: str) -> str:
        if 0 <= len(string) <= 1:
            return string
        decoded = ""
        for match in rle_regex.finditer(string):
            if (length := match.group(LENGTH)) is None:
                decoded += match[RUN]
            else:
                decoded += match[RUN] * int(length)
        return decoded

    return decoder


def create_rle_regex(characters: str) -> re.Pattern:
    """Factory function to create a regular expression to find run-length-encoded tokens."""
    return re.compile(fr"(?P<{RUN}>[{re.escape("".join(set(characters)))}])(?P<{LENGTH}>[1-9]\d*)?")


def add_option_characters(parser: ArgumentParser) -> None:
    """Add the --characters option to the argument parser."""
    help_text = "Set of allowed characters as string. Duplicate characters are ignored."
    parser.add_argument(f"--{CHARACTERS}", required=True, help=help_text)


def log_program_start_and_finish() -> None:
    program_execution_started = datetime.now()
    log(f"Program {FILENAME} started to execute at '{program_execution_started}'.")

    def log_program_finish() -> None:
        program_execution_finished = datetime.now()
        program_execution_duration = program_execution_finished - program_execution_started
        log(f"Program {FILENAME} finished to execute at '{program_execution_finished}' and took '{program_execution_duration}'.")

    atexit.register(log_program_finish)


def main() -> None:
    log_program_start_and_finish()
    parser = ArgumentParser(description=__doc__, formatter_class=ArgumentDefaultsHelpFormatter)
    add_option_characters(parser)
    subparsers = parser.add_subparsers(dest=SUBCOMMAND, required=True)
    subparsers.add_parser(Subcommand.ENCODE.value)
    subparsers.add_parser(Subcommand.DECODE.value)
    parsed_args = vars(parser.parse_args())
    config = Config(characters=parsed_args[CHARACTERS], subcommand=Subcommand(parsed_args[SUBCOMMAND]))
    match config.subcommand:
        case Subcommand.ENCODE:
            codec = encoding(config.characters)
        case Subcommand.DECODE:
            codec = decoding(config.characters)
        case _:
            raise RuntimeError(f"Unknown '{config.subcommand=}'.")
    for line in sys.stdin:
        print(codec(line.rstrip()))


if __name__ == "__main__":
    main()
