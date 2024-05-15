#!/usr/bin/env python3

"""
The bwt_codec module provides functions to encode and decode strings via the burrow-wheeler-transform (BWT) algorithm. It can also be run as
a script. It reads its input from the standard input stream and writes its output the standard output stream. Log messages are written to
the standard error stream.
"""

import atexit
import csv
import enum
import os.path
import sys
from argparse import ArgumentDefaultsHelpFormatter, ArgumentParser
from collections import defaultdict
from dataclasses import dataclass
from datetime import datetime
from enum import Enum, IntEnum
from functools import lru_cache, partial
from typing import Any, Callable, Dict, List, Union


@enum.unique
class Subcommand(Enum):
    """Supported subcommands when run as a script."""

    ENCODE = "encode"
    DECODE = "decode"


@dataclass(frozen=True)
class Config:
    """Configuration settings."""

    subcommand: Subcommand
    """The subcommand to execute when run as a script."""
    csv_field_decoded_string: str
    """The CSV field denoting the decoded string either as name or zero-based index."""
    csv_field_encoded_string: str
    """The CSV field denoting the encoded string either as name or zero-based index."""
    csv_field_encoded_index: str
    """The CSV field denoting the encoded index either as name or zero-based index."""
    input_csv_delimiter: str
    """The CSV delimiter used to separate the input columns."""
    input_csv_terminator: str
    """The CSV terminator used to end the input records."""
    output_csv_delimiter: str
    """The CSV delimiter used to separate the output columns."""
    output_csv_terminator: str
    """The CSV terminator used to end the output records."""


@dataclass(frozen=True)
class Encoded:
    """Encoded data."""

    string: str
    """Last column of (imaginary) rotation table representing the encoded string."""
    index: int
    """Index of original string within (imaginary) rotation table for reconstruction."""


@dataclass(frozen=True)
class Decoded:
    """Decoded data."""

    string: str
    """Original string to encode."""


@enum.unique
class CSVField(IntEnum):
    DECODED_STRING = 0
    ENCODED_STRING = enum.auto()
    ENCODED_INDEX = enum.auto()


FILENAME = os.path.basename(__file__)
SUBCOMMAND = "subcommand"
CSV_DELIMITER = "\t"
DECODED_EMPTY = Decoded(string="")
ENCODED_EMPTY = Encoded(string="", index=-1)

log: Callable[[str], None] = partial(print, file=sys.stderr)
"""Curried function to print log messages to standard error stream."""


@lru_cache()
def encode(decoded: Decoded) -> Encoded:
    if decoded == DECODED_EMPTY:
        return ENCODED_EMPTY
    string_len = len(decoded.string)
    string_rotations_by_char = decoded.string * 2
    string_rotations_by_index = sorted(range(string_len), key=lambda index: string_rotations_by_char[index:])
    encoded_string = ENCODED_EMPTY.string.join(
        string_rotations_by_char[(index - 1 + string_len) % string_len] for index in string_rotations_by_index
    )
    decoded_string_index = string_rotations_by_index.index(0)
    return Encoded(string=encoded_string, index=decoded_string_index)


@lru_cache()
def decode(encoded: Encoded) -> Decoded:
    if encoded == ENCODED_EMPTY:
        return DECODED_EMPTY
    string_len = len(encoded.string)
    indexes_grouped_by_char: Dict[str, List[int]] = defaultdict(list)
    for index, char in enumerate(encoded.string):
        indexes_grouped_by_char[char].append(index)
    indexes_sorted_by_char = [index for char in sorted(set(encoded.string)) for index in indexes_grouped_by_char[char]]
    decoded_string = DECODED_EMPTY.string
    index = encoded.index
    for _ in range(string_len):
        if (index := indexes_sorted_by_char[index]) >= string_len:
            break
        decoded_string += encoded.string[index]
    return Decoded(string=decoded_string)


def log_program_start_and_finish() -> None:
    program_execution_started = datetime.now()
    log(f"Program {FILENAME} started to execute at '{program_execution_started}'.")

    @atexit.register
    def log_program_finish() -> None:
        program_execution_finished = datetime.now()
        program_execution_duration = program_execution_finished - program_execution_started
        log(f"Program {FILENAME} finished to execute at '{program_execution_finished}' and took '{program_execution_duration}'.")


def get_csv_field_index(expected_field: Union[str, int], actual_field_names: List[str]) -> int:
    try:
        if isinstance(expected_field, int):
            # Check index is valid.
            _actual_field_name = actual_field_names[expected_field]
            return expected_field
        if expected_field.isdigit():
            expected_field_index = int(expected_field)
            # Check index is valid.
            _actual_field_name = actual_field_names[expected_field_index]
            return expected_field_index
        return actual_field_names.index(expected_field)
    except IndexError as error:
        raise IndexError(f"Expected field not found by index '{expected_field}' in '{actual_field_names}'.") from error
    except ValueError as error:
        raise ValueError(f"Expected field not found by name '{expected_field}' in '{actual_field_names}'.") from error


def add_option_csv_field_decoded_string(parser: ArgumentParser) -> None:
    """Add the --csv-field-decoded-string option to the argument parser."""
    help_text = "The CSV field denoting the decoded string either as name or zero-based index."
    parser.add_argument("--csv-field-decoded-string", default=CSVField.DECODED_STRING.name, help=help_text)


def add_option_csv_field_encoded_string(parser: ArgumentParser) -> None:
    """Add the --csv-field-encoded-string option to the argument parser."""
    help_text = "The CSV field denoting the encoded string either as name or zero-based index."
    parser.add_argument("--csv-field-encoded-string", default=CSVField.ENCODED_STRING.name, help=help_text)


def add_option_csv_field_encoded_index(parser: ArgumentParser) -> None:
    """Add the --csv-field-encoded-index option to the argument parser."""
    help_text = "The CSV field denoting the encoded index either as name or zero-based index."
    parser.add_argument("--csv-field-encoded-index", default=CSVField.ENCODED_INDEX.name, help=help_text)


def add_option_input_csv_delimiter(parser: ArgumentParser) -> None:
    """Add the --input-csv-delimiter option to the argument parser."""
    help_text = "The CSV delimiter used to separate the input columns."
    parser.add_argument("--input-csv-delimiter", default=CSV_DELIMITER, help=help_text)


def add_option_input_csv_terminator(parser: ArgumentParser) -> None:
    """Add the --input-csv-terminator option to the argument parser."""
    help_text = "The CSV terminator used to end the input records."
    parser.add_argument("--input-csv-terminator", default=os.linesep, help=help_text)


def add_option_output_csv_delimiter(parser: ArgumentParser) -> None:
    """Add the --output-csv-delimiter option to the argument parser."""
    help_text = "The CSV delimiter used to separate the output columns."
    parser.add_argument("--output-csv-delimiter", default=CSV_DELIMITER, help=help_text)


def add_option_output_csv_terminator(parser: ArgumentParser) -> None:
    """Add the --output-csv-terminator option to the argument parser."""
    help_text = "The CSV terminator used to end the output records."
    parser.add_argument("--output-csv-terminator", default=os.linesep, help=help_text)


def create_argument_parser() -> ArgumentParser:
    parser = ArgumentParser(description=__doc__, formatter_class=ArgumentDefaultsHelpFormatter)
    add_option_csv_field_decoded_string(parser)
    add_option_csv_field_encoded_string(parser)
    add_option_csv_field_encoded_index(parser)
    add_option_input_csv_delimiter(parser)
    add_option_input_csv_terminator(parser)
    add_option_output_csv_delimiter(parser)
    add_option_output_csv_terminator(parser)
    subparsers = parser.add_subparsers(dest=SUBCOMMAND, required=True)
    subparsers.add_parser(Subcommand.ENCODE.value)
    subparsers.add_parser(Subcommand.DECODE.value)
    return parser


def create_config(parsed_args: Dict[str, Any]) -> Config:
    return Config(
        subcommand=Subcommand(parsed_args[SUBCOMMAND]),
        csv_field_decoded_string=parsed_args["csv_field_decoded_string"],
        csv_field_encoded_string=parsed_args["csv_field_encoded_string"],
        csv_field_encoded_index=parsed_args["csv_field_encoded_index"],
        input_csv_delimiter=parsed_args["input_csv_delimiter"],
        input_csv_terminator=parsed_args["input_csv_terminator"],
        output_csv_delimiter=parsed_args["output_csv_delimiter"],
        output_csv_terminator=parsed_args["output_csv_terminator"],
    )


def main() -> None:
    log_program_start_and_finish()
    parser = create_argument_parser()
    config = create_config(vars(parser.parse_args()))
    csv_reader = csv.reader(sys.stdin, delimiter=config.input_csv_delimiter, lineterminator=config.input_csv_terminator)
    csv_writer = csv.writer(sys.stdout, delimiter=config.output_csv_delimiter, lineterminator=config.output_csv_terminator)
    match config.subcommand:
        case Subcommand.ENCODE:
            actual_field_names = next(csv_reader, None)
            if actual_field_names is None:
                return
            csv_field_index_decoded_string = get_csv_field_index(config.csv_field_decoded_string, actual_field_names)
            csv_writer.writerow([csv_field.name for csv_field in CSVField])
            for row in csv_reader:
                decoded = Decoded(string=row[csv_field_index_decoded_string])
                encoded = encode(decoded)
                csv_writer.writerow([decoded.string, encoded.string, encoded.index])
        case Subcommand.DECODE:
            actual_field_names = next(csv_reader, None)
            if actual_field_names is None:
                return
            csv_field_index_encoded_string = get_csv_field_index(config.csv_field_encoded_string, actual_field_names)
            csv_field_index_encoded_index = get_csv_field_index(config.csv_field_encoded_index, actual_field_names)
            csv_writer.writerow([CSVField.DECODED_STRING.name])
            for row in csv_reader:
                encoded = Encoded(
                    string=row[csv_field_index_encoded_string],
                    index=int(row[csv_field_index_encoded_index]),
                )
                decoded = decode(encoded)
                csv_writer.writerow([decoded.string])
        case _:
            raise RuntimeError(f"Unknown '{config.subcommand=}'.")


if __name__ == "__main__":
    main()
