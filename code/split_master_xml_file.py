import xml.etree.ElementTree as ET
import copy
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
    attr = m.find(name)
    if attr is None:
        raise MeasureAttributeError("Measure has no attribute '{}'".format(name))
    return attr


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
                result.append(attr2)
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
            except AttributeError:
                pass

    def consume(self, m):
        if not is_xml_measure(m):
            # Non-measure XML elements are ignored
            return

        self.update_last_measure_attributes(m)

        if is_initial_measure(m) and self._last_was_final:
            self.cnt += 1
            print("[DDD] Found new piece: #{}".format(self.cnt))
            import sys
            sys.stdout.flush()
            update_measure_attributes(m, self.last_measure_attributes, inplace=True)
        self._last_was_final = is_final_measure_candidate(m)


def copy_relevant_subtrees(node, pc, piece_number, piece_found):
    node_out = copy_element(node)
    for child in node:
        if not is_xml_measure(child):
            subtree, piece_found_subtree = copy_relevant_subtrees(child, pc, piece_number, piece_found)
            piece_found = piece_found or piece_found_subtree
            node_out.append(subtree)
        else:
            pc.consume(child)
            if pc.cnt == piece_number:
                piece_found = True
                node_out.append(copy.deepcopy(child))
    return node_out, piece_found


def extract_piece(xml_string, number):
    pc = PieceCounter()
    tree = ET.fromstring(xml_string)
    tree_out, piece_found = copy_relevant_subtrees(tree, pc, number, False)

    if not piece_found:
        raise NoSuchPieceError("Piece number #{} not found in XML string.".format(number))

    return ET.tostring(tree_out)
