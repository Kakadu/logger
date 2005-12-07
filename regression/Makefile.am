TESTS = test001 test002 test003 test004 test005 test006

TESTS_ENVIRONMENT = $(srcdir)/test.sh

PARSER_INCLUDES += -I $(top_srcdir)/src
#MODULE_INCLUDES += -I $(top_srcdir)/src

# OCaml parser call with flags
#AM_P4FLAGS := -pp "$(CAMLP4O) $(PARSER_INCLUDES) pa_log.cmo $(LOG)"
#AM_P4FLAGS = -pp "$(CAMLP4R) $(PARSER_INCLUDES)"

# bytecode compiling flags
AM_BFLAGS = -w p $(MODULE_INCLUDES) $(DEBUG)
# native (optimized) compiling flags
AM_OFLAGS = -w p $(MODULE_INCLUDES) $(DEBUG)

clean-am:
	rm -f $(addsuffix .cmi, $(TESTS)) $(addsuffix .cmo, $(TESTS))
	rm -f $(addsuffix -log$(EXEEXT), $(TESTS)) $(addsuffix -nolog$(EXEEXT), $(TESTS))
	rm -f *.diff *.log

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
