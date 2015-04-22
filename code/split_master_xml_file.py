import xml.etree.ElementTree as ET


class MeasureNumberError(Exception):
    pass


class FinalMeasureError(Exception):
    pass


def check_xml_type(element, xml_type):
    if not isinstance(element, ET.Element):
        raise TypeError("Not an XML element: '{}' (type: {})".format(element, type(element)))

    if element.tag != xml_type:
        raise TypeError("XML Element is not of type '{}': {}".format(xml_type, element))


def is_xml_measure(element):
    return isinstance(element, ET.Element) and element.tag == 'measure'


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


class PieceCounter(object):
    def __init__(self):
        self.cnt = 0
        self._last_was_final = True

    def consume(self, m):
        try:
            check_xml_type(m, 'measure')
        except TypeError:
            # Non-measure XML elements are ignored
            return

        if is_initial_measure(m) and self._last_was_final:
            self.cnt += 1
        self._last_was_final = is_final_measure_candidate(m)
