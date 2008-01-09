SUBDIRS = camlp4 camlp5

.PHONY: doc
doc:
	for dir in $(SUBDIRS); do \
		(cd $$dir; make doc) \
	done
