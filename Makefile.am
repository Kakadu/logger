SUBDIRS=.

if CAMLP4
SUBDIRS+=camlp4
endif

if CAMLP5
SUBDIRS+=camlp5
endif

.PHONY: doc
doc:
	for dir in $(SUBDIRS); do \
		(cd $$dir; make doc) \
	done
