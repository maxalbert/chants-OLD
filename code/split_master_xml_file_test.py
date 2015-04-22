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


def make_measure_xml(number, bar_style, note=None):
    if bar_style is None:
        bar_xml = ""
    else:
        assert isinstance(bar_style, str)
        bar_xml = """
            <barline location='right'>
                <bar-style>{bar_style}</bar-style>
            </barline>\n""".format(bar_style=bar_style)

    if note is None:
        note_xml = ""
    else:
        assert isinstance(note, str)
        note_xml = "<note>{}</note>".format(note)

    xml = "<measure number='{number}'>{note_xml}{bar_xml}</measure>".format(
        number=number, note_xml=note_xml, bar_xml=bar_xml)

    return xml


def make_measure(number, bar_style, note=None):
    xml = make_measure_xml(number, bar_style, note=note)
    return ET.fromstring(xml)


def test_is_final_measure_candidate():
    """
    Check whether a measure is a candidate the final measure of a chant.
    This is the case iff it has a barline of type 'light-heavy'.
    """
    m1 = make_measure(4, 'light-heavy')
    m2 = make_measure(3, 'light-light')
    m3 = make_measure(15, 'dashed')
    m4 = make_measure(11, 'none')
    m5 = make_measure(12, None)
    m6 = ET.fromstring("<measure number='9'><barline></barline></measure>")
    m7 = make_measure(1, 'light-heavy')

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
    m1 = make_measure(1, None)
    m2 = make_measure(8, 'light-heavy')
    m3 = make_measure(2, None)
    m4 = make_measure(12, 'dashed')
    m5 = make_measure(1, 'light-heavy')

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


def test_PieceCounter():
    m1 = make_measure(1, None)           # initial measure
    m2 = make_measure(4, None)           # middle
    m3 = make_measure(8, 'light-heavy')  # final
    foo = ET.fromstring("<foo>bar</foo>")  # random element (should be ignored)

    def check_consume(pc, m, number):
        """
        Consume the measure and check that afterwards the counter is
        equal to 'number'.
        """
        pc.consume(m)
        assert pc.cnt == number


    # Initially the counter should be zero
    pc = PieceCounter()
    assert pc.cnt == 0

    # Since we are at the beginning, consuming an initial measure
    # should increase the counter.
    check_consume(pc, m1, 1)

    # However, consuming more initial measures should not increase the
    # counter because the previous measure was not a final measure.
    check_consume(pc, m1, 1)
    check_consume(pc, m1, 1)

    # Similarly, consuming a bunch of middle measures should not
    # increase the counter.
    for i in xrange(12):
        check_consume(pc, m2, 1)

    # If we consume a final measure that is not immediately followed
    # by an initial measure the counter should not increase.
    check_consume(pc, m3, 1)
    check_consume(pc, m2, 1)
    check_consume(pc, m1, 1)

    # Only when we consume a final measure immediately followed by an
    # initial measure should the counter increase.
    check_consume(pc, m3, 1)
    check_consume(pc, m1, 2)

    # Let's try again, just for luck
    for i in xrange(12):
        check_consume(pc, m2, 2)
    check_consume(pc, m3, 2)
    check_consume(pc, m1, 3)

    for i in xrange(8):
        check_consume(pc, m2, 3)
        check_consume(pc, foo, 3)  # non-measure elements should be ignored
    check_consume(pc, m3, 3)
    check_consume(pc, m1, 4)

    # One more time with a fresh counter, but this time we consume
    # some non-initial measures first.
    #
    # TODO: Currently this leaves the counter at 0. Is this the best option?!?
    pc = PieceCounter()
    assert pc.cnt == 0

    check_consume(pc, m3, 0)
    check_consume(pc, m2, 0)
    check_consume(pc, m3, 0)
    check_consume(pc, m1, 1)
