# type in sources here
SOURCES = pa_log.ml
SUBDIRS = regression doc

include $(top_srcdir)/m4/Makefile.am.vars

# overwrite some variables
PXFLAGS = $(P5FLAGS)
CAMLPXLIB = $(CAMLP5LIB)
MODULE_INCLUDES += -I "$(CAMLP5LIB)"

include $(top_srcdir)/m4/Makefile.am.targets

# overwrite some targets
TARGET := $(CMO) $(CMI)

.PHONY: doc
doc:
	for dir in $(SUBDIRS); do \
		(cd $$dir; make doc) \
	done

include $(top_srcdir)/m4/Makefile.am.rules
