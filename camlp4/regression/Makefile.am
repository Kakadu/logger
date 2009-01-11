TESTS = test001 test002 test003 test004 test005 test006 test007

TESTS_ENVIRONMENT = $(srcdir)/test.sh

include $(top_srcdir)/m4/Makefile.am.vars

PARSER_INCLUDES += -I $(top_srcdir)/camlp4

TARGET = 

CLEAN_EXTRA += $(addsuffix .cmi, $(TESTS)) $(addsuffix .cmo, $(TESTS))
CLEAN_EXTRA += $(addsuffix -log$(EXEEXT), $(TESTS)) $(addsuffix -nolog$(EXEEXT), $(TESTS))
CLEAN_EXTRA += *.diff *.log

include $(top_srcdir)/m4/Makefile.am.targets

# do not call ocamldep
.depend:
	touch .depend

# Rules to build tests
test007-log$(EXEEXT): test007.ml
	$(OCAMLC) $(BFLAGS) -pp "$(CAMLP4O) $(PARSER_INCLUDES) pr_o.cmo pa_log.cmo -LOG" -o $@ $<

test006-log$(EXEEXT): test006.ml
	$(OCAMLC) $(BFLAGS) -pp "$(CAMLP4O) $(PARSER_INCLUDES) pr_o.cmo pa_log.cmo -LOG" -o $@ $<

test001-log$(EXEEXT): test001.ml
	$(OCAMLC) $(BFLAGS) -pp "$(CAMLP4O) $(PARSER_INCLUDES) pr_o.cmo pa_log.cmo -LOG" -o $@ $<

test004-log$(EXEEXT): test004.ml
	$(OCAMLC) $(BFLAGS) -pp "$(CAMLP4O) $(PARSER_INCLUDES) pr_o.cmo pa_log.cmo -VIEW test002 -VIEW test003" -o $@ $<

test005-log$(EXEEXT): test005.ml
	$(OCAMLC) $(BFLAGS) -pp "$(CAMLP4O) $(PARSER_INCLUDES) pr_o.cmo pa_log.cmo -LOG -VIEW test002 -VIEW test003" -o $@ $<

%-log$(EXEEXT): %.ml
	$(OCAMLC) $(BFLAGS) -pp "$(CAMLP4O) $(PARSER_INCLUDES) pr_o.cmo pa_log.cmo -VIEW $*" -o $@ $<

%-nolog$(EXEEXT): %.ml
	$(OCAMLC) $(BFLAGS) -pp "$(CAMLP4O) $(PARSER_INCLUDES) pr_o.cmo pa_log.cmo" -o $@ $<

$(TESTS): $(addsuffix -log$(EXEEXT), $(TESTS)) $(addsuffix -nolog$(EXEEXT), $(TESTS))

include $(top_srcdir)/m4/Makefile.am.rules
