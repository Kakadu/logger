TESTS = test001 test002 test003 test004 test005 test006

TESTS_ENVIRONMENT = ./test-log.sh

clean-am:
	rm -f $(addsuffix .cmi, $(TESTS)) $(addsuffix .cmo, $(TESTS))
	rm -f $(addsuffix .log, $(TESTS)) $(addsuffix .nolog, $(TESTS))
	rm -f $(addsuffix -log, $(TESTS)) $(addsuffix -nolog, $(TESTS))
	rm -f $(addsuffix .diff, $(TESTS))

BFLAGS := -w p

test006-log: test006.ml
	$(OCAMLC) $(BFLAGS) -pp "$(CAMLP4O) -I .. pa_log.cmo -LOG" -o $@ $<

test001-log: test001.ml
	$(OCAMLC) $(BFLAGS) -pp "$(CAMLP4O) -I .. pa_log.cmo -LOG" -o $@ $<

test004-log: test004.ml
	$(OCAMLC) $(BFLAGS) -pp "$(CAMLP4O) -I .. pa_log.cmo -VIEW test002 -VIEW test003" -o $@ $<

test005-log: test005.ml
	$(OCAMLC) $(BFLAGS) -pp "$(CAMLP4O) -I .. pa_log.cmo -LOG -VIEW test002 -VIEW test003" -o $@ $<

%-log: %.ml
	$(OCAMLC) $(BFLAGS) -pp "$(CAMLP4O) -I .. pa_log.cmo -VIEW $*" -o $@ $<

%-nolog: %.ml
	$(OCAMLC) $(BFLAGS) -pp "$(CAMLP4O) -I .. pa_log.cmo" -o $@ $<

$(TESTS): $(addsuffix -log, $(TESTS)) $(addsuffix -nolog, $(TESTS))
