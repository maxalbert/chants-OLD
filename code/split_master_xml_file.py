import xml.etree.ElementTree as ET
import copy
import re


class MeasureNumberError(Exception):
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


def tidy_up_xml(xml_string):
    lines = xml_string.split('\n')
    lines_stripped = [l.strip() for l in lines]
    lines_tidy = [re.sub('"', '\'', l) for l in lines_stripped]
    res = '\n'.join(lines_tidy)
    return res.strip()


def get_measure_number(element):
    check_xml_type(element, 'measure')
    attribs = element.attrib
    try:
        return int(attribs['number'])
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
    attr = m.find(name)
    if attr is None:
        raise AttributeError("Measure has no attribute '{}'".format(name))
    return attr


def get_measure_attributes(m):
    res = {}
    for name in PieceCounter.attr_names:
        try:
            res[name] = get_measure_attribute(m, name)
        except AttributeError:
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
        except AttributeError:
            try:
                attr2 = attrs[name]
                result.append(attr2)
            except KeyError:
                continue

    return result


class PieceCounter(object):
    attr_names = ['key', 'clef', 'time', 'divisions']

    def __init__(self):
        self.cnt = 0
        self._last_was_final = True
        self.last_measure_attributes = {name: None for name in self.attr_names}

    def update_last_measure_attributes(self, m):
        for name in self.attr_names:
            try:
                self.last_measure_attributes[name] = get_measure_attribute(m, name)
            except AttributeError:
                pass

    def consume(self, m):
        if not is_xml_measure(m):
            # Non-measure XML elements are ignored
            return

        self.update_last_measure_attributes(m)

        if is_initial_measure(m) and self._last_was_final:
            self.cnt += 1
        self._last_was_final = is_final_measure_candidate(m)


def extract_piece(xml_string, number):
    pc = PieceCounter()
    tree = ET.fromstring(xml_string)

    parent_map = dict((c, p) for p in tree.getiterator() for c in p)

    def process_node(node, piece_found):
        for child in list(node):
            if is_xml_measure(child):
                pc.consume(child)
                if pc.cnt != number:
                    node.remove(child)
                else:
                    update_measure_attributes(child, pc.last_measure_attributes, inplace=True)
                    piece_found = True
            else:
                piece_found_child = process_node(child, piece_found)
                piece_found = piece_found or piece_found_child

        return piece_found

    piece_found = process_node(tree, False)

    if not piece_found:
        raise NoSuchPieceError("Piece number #{} not found in XML string.".format(number))

    return ET.tostring(tree)
