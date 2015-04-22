import xml.etree.ElementTree as ET


def is_initial_measure(element):
    """
    Return `True` if the XML element is of type 'measure' and has the
    attribute "number='1'". Otherwise return `False`.

    """
    assert isinstance(element, ET.Element)

    if element.tag != 'measure':
        raise TypeError("XML Element is not of type 'measure': {}".format(element))

    attribs = element.attrib
    try:
        return attribs['number'] == '1'
    except KeyError:
        return False
