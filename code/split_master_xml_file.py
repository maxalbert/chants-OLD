from types import NoneType, IntType
import xml.etree.ElementTree as ET
import copy
import sys
import re


class MeasureNumberError(Exception):
    pass


class MeasureAttributeError(Exception):
    pass


class FinalMeasureError(Exception):
    pass


class NoSuchPieceError(Exception):
    pass


def check_xml_type(element, xml_type):
    if not isinstance(element, ET.Element):
        raise TypeError("Not an XML element: '{}' (type: {})".format(element, type(element)))

    if element.tag != xml_type:
        raise TypeError("XML Element is not of type '{}': {}".format(xml_type, element))


def is_xml_measure(element):
    return isinstance(element, ET.Element) and element.tag == 'measure'


def tidy_up_xml(xml_string, remove_newlines=False):
    lines = xml_string.split('\n')
    lines_stripped = [l.strip() for l in lines]
    lines_tidy = [re.sub('"', '\'', l) for l in lines_stripped if l != ""]
    if remove_newlines:
        res = ''.join(lines_tidy)
    else:
        res = '\n'.join(lines_tidy)
    return res.strip()


def xml_strings_are_equivalent(xml1_string, xml2_string):
    xml1 = ET.fromstring(xml1_string)
    xml2 = ET.fromstring(xml2_string)
    return xml_is_equal(xml1, xml2)


def xml_is_equal(xml1, xml2):
    xml1_string = ET.tostring(xml1, method='html')
    xml2_string = ET.tostring(xml2, method='html')
    xml1_tidy = tidy_up_xml(xml1_string, remove_newlines=True)
    xml2_tidy = tidy_up_xml(xml2_string, remove_newlines=True)
    return xml1_tidy == xml2_tidy


def get_measure_number(element):
    check_xml_type(element, 'measure')
    attribs = element.attrib
    try:
        return int(attribs['number'])
    except ValueError:
        return attribs['number']
    except KeyError:
        raise MeasureNumberError("Measure has no 'number' attribute: '{}'".format(element))


def is_initial_measure(element):
    """
    Return `True` if the XML element is of type 'measure' and has the
    attribute "number='1'". Otherwise return `False`.

    """
    try:
        n = get_measure_number(element)
        return n == 1
    except MeasureNumberError:
        return False


def is_final_measure_candidate(element):
    check_xml_type(element, 'measure')

    try:
        barline = element.find('barline')
        barstyle = barline.find('bar-style')
        if barstyle.text == 'light-heavy':
            if get_measure_number(element) == 1:
                raise FinalMeasureError("Final measure candidate should not have measure number '1'. Aborting.")
            else:
                return True
    except AttributeError:
        return False


def is_chant_boundary(m1, m2):
    """
    Return `True` if the pair of measures defines a chant boundary and
    `False` otherwise. This is the case iff the first measure is a
    final-measure candidate and the second measure is an initial
    measure.

    """
    return is_final_measure_candidate(m1) and is_initial_measure(m2)


def get_measure_attribute(m, name):
    check_xml_type(m, 'measure')
    attributes = m.find('attributes')
    if attributes is None:
        raise MeasureAttributeError("Measure has no attribute '{}'".format(name))
    attr = attributes.find(name)
    if attr is None:
        raise MeasureAttributeError("Measure has no attribute '{}'".format(name))
    return attr


def set_measure_attribute(m, name, value):
    assert isinstance(value, ET.Element)
    check_xml_type(m, 'measure')
    attributes = m.find('attributes')
    if attributes is None:
        attributes = ET.fromstring("<attributes></attributes>")
        m.append(attributes)

    attr = attributes.find(name)
    if attr is not None:
        attributes.remove(attr)
    attributes.append(value)


def get_measure_attributes(m):
    res = {}
    for name in PieceCounter.attr_names:
        try:
            res[name] = get_measure_attribute(m, name)
        except MeasureAttributeError:
            pass
            #res[name] = None
    return res


def update_measure_attributes(m, attrs, inplace=False):
    """
    Updates the attributes key, clef, time, divsions of `m1` with
    those of `m2` if they are not defined yet.

    """
    check_xml_type(m, 'measure')
    assert isinstance(attrs, dict)

    result = m if inplace else copy.deepcopy(m)

    for name in PieceCounter.attr_names:
        try:
            attr1 = get_measure_attribute(result, name)
        except MeasureAttributeError:
            try:
                attr2 = attrs[name]
                if attr2 is not None:
                    set_measure_attribute(result, name, attr2)
            except KeyError:
                continue

    return result


def copy_element(elem):
    result = ET.Element(elem.tag, attrib=elem.attrib)
    result.text = elem.text
    return result


def copy_tree(tree):
    assert isinstance(tree, ET.Element)

    result = copy_element(tree)
    for child in tree:
        result.append(copy_tree(child))

    return result


class PieceCounter(object):
    attr_names = ['divisions', 'key', 'time', 'clef']

    def __init__(self):
        self.cnt = 0
        self._last_was_final = True
        self.last_measure_attributes = {name: None for name in self.attr_names}

    def update_last_measure_attributes(self, m):
        for name in self.attr_names:
            try:
                self.last_measure_attributes[name] = get_measure_attribute(m, name)
            except MeasureAttributeError:
                pass

    def consume(self, m, piece_numbers=None):
        """
        If `m` is a measure, check whether it belongs to the piece
        with number `piece_number`. If not, return `None`. Otherwise
        return a copy of `m`. If `m` is the first measure of the piece
        then any attributes in [divisions, key, time, clef] which
        aren't set in it are updated with the values from the
        previously seen measure.

        If `m` is not a measure but a different XML element, an
        unaltered copy of `m` is returned.

        """
        if not isinstance(piece_numbers, (list, NoneType)):
            assert isinstance(piece_numbers, IntType)
            piece_numbers = [piece_numbers]

        if not is_xml_measure(m):
            # Non-measure XML elements are ignored
            raise ValueError("PieceCounter.consume() received argument which was not a measure: '{}'".format(m))

        if is_initial_measure(m) and self._last_was_final:
            self.cnt += 1
            print("[DDD] Found new piece: #{}".format(self.cnt))
            sys.stdout.flush()

        if piece_numbers is None or self.cnt in piece_numbers:
            res = copy.deepcopy(m)
            if is_initial_measure(m) and self._last_was_final:
                res = update_measure_attributes(res, self.last_measure_attributes)
        else:
            res = None

        self._last_was_final = is_final_measure_candidate(m)
        self.update_last_measure_attributes(m)
        return res


def copy_relevant_subtrees(node, pc, piece_numbers, piece_found):
    node_out = copy_element(node)
    for child in node:
        if not is_xml_measure(child):
            subtree, piece_found_subtree = copy_relevant_subtrees(child, pc, piece_numbers, piece_found)
            piece_found = piece_found or piece_found_subtree
            node_out.append(subtree)
        else:
            res = pc.consume(child, piece_numbers)
            if res is not None:
                piece_found = True
                node_out.append(res)
    return node_out, piece_found


def extract_piece_from_string(xml_string, numbers):
    print "[DDD] Converting string to XML tree... ",
    sys.stdout.flush()
    tree = ET.fromstring(xml_string)
    print "Done."
    tree_out = extract_piece(tree, numbers)
    result = ET.tostring(tree_out)
    return result


def extract_piece(tree, numbers):
    pc = PieceCounter()
    tree_out, piece_found = copy_relevant_subtrees(tree, pc, numbers, False)

    if not piece_found:
        raise NoSuchPieceError("None of the piece numbers were found in XML string: {}".format(numbers))

    return tree_out
