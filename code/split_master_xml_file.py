import xml.etree.ElementTree as ET


def check_xml_type(element, xml_type):
    if not isinstance(element, ET.Element):
        raise TypeError("Not an XML element: '{}' (type: {})".format(element, type(element)))

    if element.tag != xml_type:
        raise TypeError("XML Element is not of type '{}': {}".format(xml_type, element))


def is_initial_measure(element):
    """
    Return `True` if the XML element is of type 'measure' and has the
    attribute "number='1'". Otherwise return `False`.

    """
    check_xml_type(element, 'measure')

    attribs = element.attrib
    try:
        return attribs['number'] == '1'
    except KeyError:
        return False
