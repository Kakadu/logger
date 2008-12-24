SUBDIRS = . $(P4_SUBDIR) $(P5_SUBDIR)

if CAMLP4
P4_SUBDIR = camlp4
endif

if CAMLP5
P5_SUBDIR = camlp5
endif

.PHONY: doc
doc:
	for dir in $(SUBDIRS); do \
		test "$$dir" = "." || (cd $$dir; make doc) \
	done
