import pytest
import textwrap
import xml.etree.ElementTree as ET
from split_master_xml_file import *


def test_check_xml_type():
    # These should pass
    check_xml_type(ET.fromstring("<measure><note></note></measure>"), 'measure')
    check_xml_type(ET.fromstring("<note></note>"), 'note')

    for x in ['foo', 42, ET.fromstring("<note></note>")]:
        with pytest.raises(TypeError):
            check_xml_type(x, 'measure')


def test_is_initial_measure():
    """
    Check whether a measure is the initial measure of a chant. This is
    based purely on whether the measure number is '1'.

    """
    m1 = ET.fromstring("<measure number='1'></measure>")
    m2 = ET.fromstring("<measure number='3'></measure>")
    m3 = ET.fromstring("<measure number='42'></measure>")
    m4 = ET.fromstring("<measure></measure>")
    m5 = ET.fromstring("<note number='1'></note>")

    assert is_initial_measure(m1)
    assert not is_initial_measure(m2)
    assert not is_initial_measure(m3)
    assert not is_initial_measure(m4)

    with pytest.raises(TypeError):
        is_initial_measure(m5)
