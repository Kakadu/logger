#load "pa_extend.cmo";
#load "q_MLast.cmo";

open Pcaml;

value log_enabled = 
  ref False
;

EXTEND
  GLOBAL: expr str_item sig_item;
  expr: LEVEL "top"
    [ [ "LOG"; "("; e = expr; ")" ->
          if log_enabled.val then e else <:expr<()>>
    ] ]
  ;
END;

Pcaml.add_option "-LOG" (Arg.Set log_enabled)
  "<string> Define for IfDef instruction."
;
