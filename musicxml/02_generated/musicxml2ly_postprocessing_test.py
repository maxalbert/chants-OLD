from musicxml2ly_postprocessing import *


def test_tweak_key_none_to_major():
    test_pairs = [
        (r'key c none', r'key c none'),
        (r'\key c none', r'\key c none'),
        (r'\key c \none', r'\key c \major'),
        (r'\key d \none', r'\key d \none'),
        (r'\key c \major', r'\key c \major'),
        ]


    for s, out_expected in test_pairs:
        assert tweak_key_none_to_major(s) == out_expected
