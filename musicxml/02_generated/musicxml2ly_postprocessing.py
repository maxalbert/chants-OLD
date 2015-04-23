#!/usr/bin/env python

from glob import glob


def read_file_contents(filename):
    with open(filename, 'r') as f:
        contents = f.read()
    return contents


def tweak_key_none_to_major(s):
    if '\key c \none' in s:
        print('   Replacing:  "\key c \none" -> "\key c \major"')
        s = re.sub('\\key c \\none', '\\key c \\major', s)
    return s


if __name__ == '__main__':
    xml_files = glob("*.xml")

    for filename in xml_files:
        print("Postprocessing file: '{}'".format(filename)
        s = read_file_contents(filename)
        s = tweak_key_none_to_major(s)
