import pytest
import textwrap
import xml.etree.ElementTree as ET
from split_master_xml_file import *


def make_measure_xml(number, bar_style, note=None, attributes=None):
    if bar_style is None:
        bar_xml = ""
    else:
        assert isinstance(bar_style, str)
        bar_xml = """
            <barline location='right'>
                <bar-style>{bar_style}</bar-style>
            </barline>""".format(bar_style=bar_style)

    if note is None:
        note_xml = ""
    else:
        assert isinstance(note, str)
        note_xml = "<note>{}</note>".format(note)

    if attributes is None:
        attr_string = ""
    else:
        assert isinstance(attributes, str)
        attr_string = """
            <attributes>
                {}
            </attributes>""".format(attributes)

    xml = "<measure number='{number}'>{note_xml}{bar_xml}{attr_string}</measure>".format(
        number=number, note_xml=note_xml, bar_xml=bar_xml, attr_string=attr_string)

    return xml


def make_measure(number, bar_style, note=None, attributes=None):
    xml = make_measure_xml(number, bar_style, note=note, attributes=attributes)
    return ET.fromstring(xml)


def test_check_xml_type():
    # These should pass
    check_xml_type(ET.fromstring("<measure><note></note></measure>"), 'measure')
    check_xml_type(ET.fromstring("<note></note>"), 'note')

    for x in ['foo', 42, ET.fromstring("<note></note>")]:
        with pytest.raises(TypeError):
            check_xml_type(x, 'measure')


def test_is_xml_measure():
    m1 = make_measure(1, None, 'a')
    m2 = make_measure(1, 'light-heary', 'a')
    m3 = ET.fromstring("<note></note>")
    m4 = ET.fromstring("<foo></foo>")

    assert is_xml_measure(m1)
    assert is_xml_measure(m2)
    assert not is_xml_measure(m3)
    assert not is_xml_measure(m4)
    assert not is_xml_measure("foo")
    assert not is_xml_measure(42)


def test_get_measure_number():
    m1 = ET.fromstring("<measure number='1'></measure>")
    m2 = ET.fromstring("<measure number='3'></measure>")
    m3 = ET.fromstring("<measure number='42'></measure>")
    m4 = ET.fromstring("<measure number='X5'></measure>")
    m5 = ET.fromstring("<measure></measure>")

    assert get_measure_number(m1) == 1
    assert get_measure_number(m2) == 3
    assert get_measure_number(m3) == 42
    assert get_measure_number(m4) == 'X5'

    with pytest.raises(MeasureNumberError):
        get_measure_number(m5)


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


def test_get_measure_attribute():
    div_str = "<divisions>768</divisions>"
    key_str = "<key><fifths>0</fifths><mode>major</mode></key>"
    clef_str = "<clef><sign>G</sign><line>2</line><clef-octave-change>-1</clef-octave-change></clef>"
    time_str = "<time><beats>15</beats><beat-type>4</beat-type></time>"

    attrs1 = div_str + clef_str + time_str
    attrs2 = clef_str + key_str + div_str
    attrs3 = time_str

    m1 = make_measure(4, None, attributes=attrs1)
    m2 = make_measure(2, None, attributes=attrs2)
    m3 = make_measure(9, None, attributes=attrs3)
    m4 = make_measure(9, None)

    def assert_attribute_equal(m, name, attr_string):
        a = get_measure_attribute(m, name)
        assert ET.tostring(a).strip() == attr_string.strip()

    assert_attribute_equal(m1, 'divisions', div_str)
    assert_attribute_equal(m1, 'clef', clef_str)
    assert_attribute_equal(m1, 'time', time_str)

    assert_attribute_equal(m2, 'clef', clef_str)
    assert_attribute_equal(m2, 'key', key_str)
    assert_attribute_equal(m2, 'divisions', div_str)

    assert_attribute_equal(m3, 'time', time_str)

    with pytest.raises(MeasureAttributeError):
        get_measure_attribute(m1, 'key')
    with pytest.raises(MeasureAttributeError):
        get_measure_attribute(m1, 'foo')
    with pytest.raises(MeasureAttributeError):
        get_measure_attribute(m2, 'time')
    with pytest.raises(MeasureAttributeError):
        get_measure_attribute(m3, 'div')
    with pytest.raises(MeasureAttributeError):
        get_measure_attribute(m4, 'key')

    with pytest.raises(TypeError):
        get_measure_attribute('foo', 'key')


def assert_attribute_equal(m, name, attr_string):
    a = get_measure_attribute(m, name)
    assert ET.tostring(a).strip() == attr_string.strip()


def assert_has_not_attribute(m, name):
    with pytest.raises(MeasureAttributeError):
        get_measure_attribute(m, name)


def test_update_measure_attributes():
    div_str = "<divisions>768</divisions>"
    key_str = "<key><fifths>0</fifths><mode>major</mode></key>"
    key_str_2 = "<key><fifths>1</fifths><mode>major</mode></key>"
    clef_str = "<clef><sign>G</sign><line>2</line><clef-octave-change>-1</clef-octave-change></clef>"
    time_str = "<time><beats>15</beats><beat-type>4</beat-type></time>"
    time_str_2 = "<time><beats>27</beats><beat-type>4</beat-type></time>"

    attrs1 = div_str + key_str
    attrs2 = clef_str + key_str_2 + time_str
    attrs3 = time_str_2

    m0 = make_measure(4, None)
    m1 = make_measure(3, None, attributes=attrs1)
    m2 = make_measure(2, None, attributes=attrs2)
    m3 = make_measure(9, None, attributes=attrs3)

    m01 = update_measure_attributes(m0, get_measure_attributes(m1))
    assert_attribute_equal(m01, 'divisions', div_str)
    assert_attribute_equal(m01, 'key', key_str)
    assert_has_not_attribute(m01, 'clef')
    assert_has_not_attribute(m01, 'time')

    m02 = update_measure_attributes(m0, get_measure_attributes(m2))
    assert_attribute_equal(m02, 'clef', clef_str)
    assert_attribute_equal(m02, 'key', key_str_2)
    assert_attribute_equal(m02, 'time', time_str)
    assert_has_not_attribute(m02, 'divisions')

    m03 = update_measure_attributes(m0, get_measure_attributes(m3))
    assert_attribute_equal(m03, 'time', time_str_2)
    assert_has_not_attribute(m03, 'key')
    assert_has_not_attribute(m03, 'clef')
    assert_has_not_attribute(m03, 'divisions')

    m12 = update_measure_attributes(m1, get_measure_attributes(m2))
    assert_attribute_equal(m12, 'divisions', div_str)
    assert_attribute_equal(m12, 'clef', clef_str)
    assert_attribute_equal(m12, 'key', key_str)  # should not be updated because it already exists in m1!
    assert_attribute_equal(m12, 'time', time_str)

    m123 = update_measure_attributes(m12, get_measure_attributes(m3))
    assert_attribute_equal(m123, 'divisions', div_str)
    assert_attribute_equal(m123, 'clef', clef_str)
    assert_attribute_equal(m123, 'key', key_str)
    assert_attribute_equal(m123, 'time', time_str)  # should not be updated because it already exists in m12!

    # Try updating with dict that contains None
    m1_new = update_measure_attributes(m1, {'divisions': None, 'time': None})
    assert_attribute_equal(m1_new, 'divisions', div_str)
    assert_attribute_equal(m1_new, 'key', key_str)
    assert_has_not_attribute(m1_new, 'clef')
    assert_has_not_attribute(m1_new, 'time')

    # Try update in-place
    assert_attribute_equal(m1, 'divisions', div_str)
    assert_attribute_equal(m1, 'key', key_str)
    assert_has_not_attribute(m1, 'clef')
    assert_has_not_attribute(m1, 'time')
    update_measure_attributes(m1, get_measure_attributes(m2), inplace=True)
    assert_attribute_equal(m1, 'divisions', div_str)
    assert_attribute_equal(m1, 'clef', clef_str)
    assert_attribute_equal(m1, 'key', key_str)  # should not be updated because it already exists in m1!
    assert_attribute_equal(m1, 'time', time_str)


class TestPieceCounter():
    def setup(self):
        self.div_str_1 = "<divisions>768</divisions>"
        self.div_str_2 = "<divisions>1024</divisions>"

        self.key_str_1 = "<key><fifths>0</fifths><mode>major</mode></key>"
        self.key_str_2 = "<key><fifths>-1</fifths><mode>major</mode></key>"

        self.clef_str_1 = "<clef><sign>G</sign><line>2</line><clef-octave-change>-1</clef-octave-change></clef>"
        self.clef_str_2 = "<clef><sign>G</sign><line>2</line></clef>"

        self.time_str_1 = "<time><beats>15</beats><beat-type>4</beat-type></time>"
        self.time_str_2 = "<time><beats>23</beats><beat-type>4</beat-type></time>"

    def _check_consume(self, pc, m, number):
        """
        Consume the measure and check that afterwards the counter is
        equal to 'number'.
        """
        pc.consume(m)
        assert pc.cnt == number

    def test_consume_returns_the_right_thing(self):
        pc = PieceCounter()
        pc.cnt = 7
        pc._last_was_final = False

        div_str = "<divisions>768</divisions>"
        key_str = "<key><fifths>0</fifths><mode>major</mode></key>"
        m1 = make_measure(3, None, attributes=div_str)
        m2 = make_measure(5, 'light-heavy', attributes=key_str)
        m3 = make_measure(1, None, attributes=key_str)
        foo = ET.fromstring("<foo></foo>")

        res1 = pc.consume(m1, piece_numbers=3)
        assert res1 is None

        res2 = pc.consume(m1, piece_numbers=7)
        assert xml_is_equal(res2, m1)
        assert_attribute_equal(res2, 'divisions', div_str)
        assert_has_not_attribute(res2, 'key')
        assert_has_not_attribute(res2, 'clef')
        assert_has_not_attribute(res2, 'time')

        # Since m2 is not an initial measure, it should be returned unaltered
        res3 = pc.consume(m2, piece_numbers=7)
        assert xml_is_equal(res3, m2)
        assert_attribute_equal(res3, 'key', key_str)
        assert_has_not_attribute(res3, 'division')
        assert_has_not_attribute(res3, 'clef')
        assert_has_not_attribute(res3, 'time')

        # Since m3 is an initial measure and the previous one m2 was a
        # final measure, the measure attributes of m3 should be
        # updated from the ones in m2.
        res4 = pc.consume(m3, piece_numbers=8)
        assert_attribute_equal(res4, 'divisions', div_str)
        assert_attribute_equal(res4, 'key', key_str)
        assert_has_not_attribute(res4, 'clef')
        assert_has_not_attribute(res4, 'time')

        with pytest.raises(ValueError):
            pc.consume(foo, piece_numbers=None)

    def test_counter_should_increase_only_at_boundaries(self):
        m1 = make_measure(1, None)           # initial measure
        m2 = make_measure(4, None)           # middle
        m3 = make_measure(8, 'light-heavy')  # final
        foo = ET.fromstring("<foo>bar</foo>")  # random element (should be ignored)

        # Initially the counter should be zero
        pc = PieceCounter()
        assert pc.cnt == 0

        # Since we are at the beginning, consuming an initial measure
        # should increase the counter.
        self._check_consume(pc, m1, 1)

        # However, consuming more initial measures should not increase the
        # counter because the previous measure was not a final measure.
        self._check_consume(pc, m1, 1)
        self._check_consume(pc, m1, 1)

        # Similarly, consuming a bunch of middle measures should not
        # increase the counter.
        for i in xrange(12):
            self._check_consume(pc, m2, 1)

        # If we consume a final measure that is not immediately followed
        # by an initial measure the counter should not increase.
        self._check_consume(pc, m3, 1)
        self._check_consume(pc, m2, 1)
        self._check_consume(pc, m1, 1)

        # Only when we consume a final measure immediately followed by an
        # initial measure should the counter increase.
        self._check_consume(pc, m3, 1)
        self._check_consume(pc, m1, 2)

        # Let's try again, just for luck
        for i in xrange(12):
            self._check_consume(pc, m2, 2)
        self._check_consume(pc, m3, 2)
        self._check_consume(pc, m1, 3)

        for i in xrange(8):
            self._check_consume(pc, m2, 3)
        self._check_consume(pc, m3, 3)
        self._check_consume(pc, m1, 4)

    def test_consuming_non_initial_measures_at_the_beginning_should_leave_counter_at_zero(self):
        m1 = make_measure(1, None)           # initial measure
        m2 = make_measure(4, None)           # middle
        m3 = make_measure(8, 'light-heavy')  # final
        foo = ET.fromstring("<foo>bar</foo>")  # random element (should be ignored)

        pc = PieceCounter()
        assert pc.cnt == 0

        self._check_consume(pc, m3, 0)
        self._check_consume(pc, m2, 0)
        self._check_consume(pc, m3, 0)
        self._check_consume(pc, m1, 1)

    def test_consuming_measures_updates_attributes(self):
        attr1 = self.div_str_1 + self.key_str_1 + self.time_str_1
        attr2 = self.clef_str_2 + self.div_str_2
        attr3 = self.time_str_2

        m1 = make_measure(5, None, attributes=attr1)
        m2 = make_measure(3, 'light-heavy', attributes=attr2)
        m3 = make_measure(8, None, attributes=attr3)

        def xml2str(attr_dict):
            def to_str(value):
                if value is None:
                    return None
                else:
                    return ET.tostring(value).strip()
            return {key: to_str(value) for (key, value) in attr_dict.iteritems()}

        def str2xml(attr_dict):
            def to_xml(value):
                if value is None:
                    return None
                else:
                    return ET.fromstring(value)
            return {key: to_xml(value) for (key, value) in attr_dict.iteritems()}


        def assert_attributes_equal(attrs, attrs_expected):
            assert xml2str(attrs) == xml2str(attrs_expected)

        pc = PieceCounter()
        assert_attributes_equal(pc.last_measure_attributes, {'divisions': None, 'key': None, 'clef': None, 'time': None})

        pc.consume(m1)
        assert_attributes_equal(pc.last_measure_attributes,
                                str2xml({'divisions': self.div_str_1,
                                         'key': self.key_str_1,
                                         'clef': None,
                                         'time': self.time_str_1}))

        pc.consume(m2)
        assert_attributes_equal(pc.last_measure_attributes,
                                str2xml({'divisions': self.div_str_2,
                                         'key': self.key_str_1,
                                         'clef': self.clef_str_2,
                                         'time': self.time_str_1}))

        pc.consume(m3)
        assert_attributes_equal(pc.last_measure_attributes,
                                str2xml({'divisions': self.div_str_2,
                                         'key': self.key_str_1,
                                         'clef': self.clef_str_2,
                                         'time': self.time_str_2}))


def make_piece_xml(measure_strings):
    def indent(s, num):
        lines = s.split('\n')
        return '\n'.join([" "*num + l for l in lines])
    measures_indented = [indent(m, 20) for m in measure_strings]
    xml = textwrap.dedent("""
        <score-partwise version='3.0'>
            <part id='P1'>\n{}
            </part>
        </score-partwise>""".format('\n'.join(measures_indented)))
    return xml


def test_tidy_up_xml():
    xml_string = textwrap.dedent("""
        <score-partwise version='3.0'>
            <part id='P1'>
                <measure number='1'><note>a</note></measure>

        <measure number='2'><note>b</note></measure>
          </part>
        <score-partwise>

        """)

    xml_string_tidy = tidy_up_xml(xml_string)

    xml_string_tidy_expected = textwrap.dedent("""\
        <score-partwise version='3.0'>
        <part id='P1'>
        <measure number='1'><note>a</note></measure>
        <measure number='2'><note>b</note></measure>
        </part>
        <score-partwise>""")

    xml_string2 = textwrap.dedent("""
        <foo>
           <bar>
           </bar>
           <baz>
              <quux>a</quux>
           </baz>
        </foo>
        """)
    xml_string2_tidy = tidy_up_xml(xml_string2, remove_newlines=True)
    xml_string2_tidy_expected = "<foo><bar></bar><baz><quux>a</quux></baz></foo>"

    assert xml_string_tidy == xml_string_tidy_expected
    assert xml_string2_tidy == xml_string2_tidy_expected


def test_xml_strings_are_equivalent():
    xml1 = textwrap.dedent("""
        <foo>
           <bar>
           </bar>
        </foo>
        """)
    xml2 = "<foo><bar/></foo>"
    xml3 = "<foo><baz></baz></foo>"
    assert xml_strings_are_equivalent(xml1, xml2)
    assert not xml_strings_are_equivalent(xml1, xml3)


def test_xml_is_equal():
    xml1 = ET.fromstring(textwrap.dedent("""
        <foo>
           <bar>
           </bar>
        </foo>
        """))
    xml2 = ET.fromstring("<foo><bar/></foo>")
    xml3 = ET.fromstring("<foo><baz></baz></foo>")
    assert xml_is_equal(xml1, xml2)
    assert not xml_is_equal(xml1, xml3)


def test_copy_element():
    m_str = textwrap.dedent("""
        <measure number='4'>
            <note>a</note>
            <foo></foo>
        </measure>
        """)
    m = ET.fromstring(m_str)
    m_copy = copy_element(m)
    m_copy_expected = ET.fromstring("<measure number='4'></measure>")
    assert xml_is_equal(m_copy, m_copy_expected)


def test_copy_tree():
    tree_string = textwrap.dedent("""
        <root>
           <divisions>768</divisions>
           <key>
               <fifths>0</fifths>
               <mode>major</mode>
           </key>
           <child1>
           </child1>
           <child2>
              <child2a>
              </child2a>
              <child2b>
              </child2b>
           </child2>
           <child3>
              <foo>
                 <bar>a</bar>
              </foo>
           </child3>
        </root>
        """)
    tree = ET.fromstring(tree_string)
    tree2 = copy_tree(tree)

    assert not (tree is tree2)
    assert xml_is_equal(tree, tree2)


def test_extract_piece_from_string():
    div_str = "<divisions>768</divisions>"
    key_str = textwrap.dedent("""
            <key>
                <fifths>0</fifths>
                <mode>major</mode>
            </key>
        """)
    clef_str = textwrap.dedent("""
            <clef>
                <sign>G</sign>
                <line>2</line>
                <clef-octave-change>-1</clef-octave-change>
            </clef>
        """)
    time_str = textwrap.dedent("""
            <time>
                <beats>15</beats>
                <beat-type>4</beat-type>
            </time>
        """)

    attr_string_1 = div_str + key_str + time_str + clef_str
    attr_string_2 = clef_str + time_str
    attr_string_2_full = clef_str + time_str + div_str + key_str

    measures_piece_1 = [
        make_measure_xml(1, None, 'a', attributes=attr_string_1),
        make_measure_xml(2, None, 'b'),
        make_measure_xml(5, None, 'c'),
        make_measure_xml(1, None, 'd'),
        make_measure_xml(3, None, 'e'),
        make_measure_xml(7, None, 'f'),
        make_measure_xml(8, 'light-heavy', 'g'),
        ]

    piece_2_first_measure = make_measure_xml(1, None, 'h', attributes=attr_string_2)
    piece_2_first_measure_full = make_measure_xml(1, None, 'h', attributes=attr_string_2_full)

    measures_piece_2 = [
        piece_2_first_measure,
        make_measure_xml(2, None, 'i'),
        make_measure_xml(4, 'light-heavy', 'j'),
        make_measure_xml(5, None, 'k'),
        make_measure_xml(7, None, 'l'),
        ]

    measures_piece_2_expected = [
        piece_2_first_measure_full,
        make_measure_xml(2, None, 'i'),
        make_measure_xml(4, 'light-heavy', 'j'),
        make_measure_xml(5, None, 'k'),
        make_measure_xml(7, None, 'l'),
        ]

    xml_full = make_piece_xml(measures_piece_1 + measures_piece_2)
    xml_piece_1_expected = make_piece_xml(measures_piece_1)
    xml_piece_2_expected = make_piece_xml(measures_piece_2_expected)
    xml_piece_1_and_2_expected = make_piece_xml(measures_piece_1 + measures_piece_2_expected)

    xml_piece_1_extracted = extract_piece_from_string(xml_full, 1)
    xml_piece_2_extracted = extract_piece_from_string(xml_full, 2)

    assert xml_strings_are_equivalent(xml_piece_1_expected, xml_piece_1_extracted)
    assert xml_strings_are_equivalent(xml_piece_2_expected, xml_piece_2_extracted)

    with pytest.raises(NoSuchPieceError):
        extract_piece_from_string(xml_full, 0)

    with pytest.raises(NoSuchPieceError):
        extract_piece_from_string(xml_full, 3)

    # Check that extracting both pieces results in the whole score
    # (same as original, except with extra attributes in the first
    # measure of the second piece).
    xml_piece_1_and_2_extracted = extract_piece_from_string(xml_full, [1, 2])
    assert xml_strings_are_equivalent(xml_piece_1_and_2_expected, xml_piece_1_and_2_extracted)
