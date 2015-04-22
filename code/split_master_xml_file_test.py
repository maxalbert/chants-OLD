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


def test_get_measure_number():
    m1 = ET.fromstring("<measure number='1'></measure>")
    m2 = ET.fromstring("<measure number='3'></measure>")
    m3 = ET.fromstring("<measure number='42'></measure>")
    m4 = ET.fromstring("<measure></measure>")

    assert get_measure_number(m1) == 1
    assert get_measure_number(m2) == 3
    assert get_measure_number(m3) == 42

    with pytest.raises(MeasureNumberError):
        get_measure_number(m4)


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


def make_measure_xml(number, bar_style):
    return textwrap.dedent("""
        <measure number='{number}'>
            <barline location='right'>
                <bar-style>{bar_style}</bar-style>
            </barline>
        </measure>""".format(number=number, bar_style=bar_style))


def test_is_final_measure_candidate():
    """
    Check whether a measure is a candidate the final measure of a chant.
    This is the case iff it has a barline of type 'light-heavy'.
    """
    m1 = ET.fromstring(make_measure_xml(4, 'light-heavy'))
    m2 = ET.fromstring(make_measure_xml(3, 'light-light'))
    m3 = ET.fromstring(make_measure_xml(15, 'dashed'))
    m4 = ET.fromstring(make_measure_xml(11, 'none'))
    m5 = ET.fromstring("<measure number='12'></measure>")
    m6 = ET.fromstring("<measure number='9'><barline></barline></measure>")
    m7 = ET.fromstring(make_measure_xml(1, 'light-heavy'))

    assert is_final_measure_candidate(m1)
    assert not is_final_measure_candidate(m2)
    assert not is_final_measure_candidate(m3)
    assert not is_final_measure_candidate(m4)
    assert not is_final_measure_candidate(m5)
    assert not is_final_measure_candidate(m6)

    # A final measure should not have measure number '1'. This
    # probably doesn't occur, but if it does we need to decide what do
    # do with it, so we raise an exception for now to be able to
    # decide later.
    with pytest.raises(FinalMeasureError):
        is_final_measure_candidate(m7)


def test_is_chant_boudary():
    """
    Check whether a pair of measurs defines a chant boundary. This is
    the case iff the first measure is a final-measure candidate and
    the second measure is an initial measure.

    """
    m1 = ET.fromstring("<measure number='1'></measure>")
    m2 = ET.fromstring(make_measure_xml(8, 'light-heavy'))
    m3 = ET.fromstring("<measure number='2'></measure>")
    m4 = ET.fromstring(make_measure_xml(12, 'dashed'))
    m5 = ET.fromstring(make_measure_xml(1, 'light-heavy'))

    assert is_chant_boundary(m2, m1)

    assert not is_chant_boundary(m3, m1)
    assert not is_chant_boundary(m4, m1)

    assert not is_chant_boundary(m1, m2)
    assert not is_chant_boundary(m1, m3)
    assert not is_chant_boundary(m1, m4)

    assert not is_chant_boundary(m2, m3)
    assert not is_chant_boundary(m2, m4)

    with pytest.raises(FinalMeasureError):
        is_chant_boundary(m5, m1)

    # This does not raise the exception because `m1` is not a final
    # measure candidate, so the check doesn't even look at `m5`.
    assert not is_chant_boundary(m1, m5)
