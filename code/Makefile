BASENAME ?= split_master_xml_file
PYTEST ?= py.test
PYTEST_OPTIONS ?= -svx

all: test

test:
	$(PYTEST) $(PYTEST_OPTIONS) $(BASENAME)_test.py -m "not slow"

test-all:
	$(PYTEST) $(PYTEST_OPTIONS) $(BASENAME)_test.py