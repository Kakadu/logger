# type in sources here
if CAMLP4
SOURCES = pa_log.ml
SUBDIRS = regression doc
else
SOURCES =
SUBDIRS =
endif

.PHONY: doc
doc:
	(cd doc; make doc)

include $(top_srcdir)/m4/Makefile.am.vars

# overwrite some variables
PXFLAGS = $(P4FLAGS)
CAMLPXLIB = $(CAMLP4LIB)
MODULE_INCLUDES += -I $(CAMLP4LIB)

include $(top_srcdir)/m4/Makefile.am.targets

# overwrite some targets
TARGET := $(CMO) $(CMI)

include $(top_srcdir)/m4/Makefile.am.rules
