#!/usr/bin/env python

import sys
import re
from glob import glob


def read_file_contents(filename):
    with open(filename, 'r') as f:
        contents = f.read()
    return contents


def write_file_contents(filename, contents):
    with open(filename, 'w') as f:
        f.write(contents)


def tweak_key_none_to_major(s):
    pattern = r'\\key c \\none'
    repl = r'\\key c \\major'

    if re.search(pattern, s):
        print(r'Replacing:  "\key c \none" -> "\key c \major"')
        s = re.sub(pattern, repl, s)

    return s


if __name__ == '__main__':
    try:
        glob_patterns = sys.argv[1:]
    except IndexError:
        glob_patterns = ["*.ly"]

    xml_files = []
    for pattern in glob_patterns:
        if not pattern.endswith('.ly'):
            print("Warning: File pattern does not end with '.ly': '{}'".format(pattern))
        xml_files += glob(pattern)
    xml_files = sorted(xml_files)

    for filename in xml_files:
        print("Postprocessing file: '{}'".format(filename))
        s = read_file_contents(filename)
        s = tweak_key_none_to_major(s)
        write_file_contents(filename, s)
