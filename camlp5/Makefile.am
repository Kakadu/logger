# type in sources here
SOURCES = pa_log.ml
SUBDIRS = regression doc

include $(top_srcdir)/m4/Makefile.am.vars

# overwrite some variables
PXFLAGS = -pp "$(CAMLP5O) $(PARSER_INCLUDES)"
CAMLPXLIB = $(CAMLP5LIB)
MODULE_INCLUDES += -I "$(CAMLP5LIB)"

include $(top_srcdir)/m4/Makefile.am.targets

# overwrite some targets
TARGET := $(CMO) $(CMI)

.PHONY: doc
doc:

include $(top_srcdir)/m4/Makefile.am.rules
