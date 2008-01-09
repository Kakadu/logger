(**************************************************************************
 *  Copyright (C) 2005
 *  Dmitri Boulytchev (db@tepkom.ru), St.Petersburg State University
 *  Universitetskii pr., 28, St.Petersburg, 198504, RUSSIA    
 *
 *  This library is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU Lesser General Public
 *  License as published by the Free Software Foundation; either
 *  version 2.1 of the License, or (at your option) any later version.
 *
 *  This library is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *  Lesser General Public License for more details.
 *
 *  You should have received a copy of the GNU Lesser General Public
 *  License along with this library; if not, write to the Free Software
 *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA
 *
 *  See the GNU Lesser General Public License version 2.1 for more details
 *  (enclosed in the file COPYING).
 **************************************************************************)

(** This module provides the syntax extensions to facilitate printing the 
    log traces. Two extensions supplied: LOG and REPR.

    LOG extends expression with the construction 

    {C [LOG <view-specification> ( <expression> )]}

    Here the [<view-specification>] is the optional comma-separated list
    of identifiers enclosed in square brackets. Each listed identifier 
    attaches the LOG expression to the corresponding view. Examples:

    [LOG (Printf.printf "Log message\n")]

    [LOG[firstView] (Printf.printf "First View\n")]

    [LOG[secondView] (Printf.printf "Second View\n")]

    [LOG[firstView, secondView] (Printf.printf "First and Second View\n")]

    Here the first [LOG] expression attached to no views, second expression attached
    to [firstView], third - to [secondView], and forth - to both [firstView] and [secondView].

    By default all views are disbled and so substituted with expression [()]. To enable
    certain view one has to pass the option [-VIEW viewName] to [camlp4] :

    {C [ocamlc -pp "camlp4o pa_log.cmo -VIEW firstView" foo.ml]}

    All [LOG] expressions attached to specified view will be enabled. There may be more
    than one [-VIEW] option specified.

    Finally the option [-LOG] enables {i all} [LOG] expressions regardless the
    views.

    REPR construction extends expression as well and has the form

    {C [REPR ( <expression> )]}

    Each REPR expression substituted with the pair. The first member of the pair is the
    string representation of the expression given as an argument to [REPR], the second - 
    its value. For example

    [REPR (let x = 2 and y = 3 in x+y)]

    replaced with the pair

    [("let x = 2 and y = 3 in x+y", 5)]

    The examples are given in the [regression] subdirectory.    
*)

(**/**)

open Camlp4.PreCast;
open Syntax;

module P = Camlp4.Printers.OCaml.Make (Camlp4.PreCast.Syntax);

value log_enabled = ref False;
value log_views = ref [];

EXTEND Gram
  GLOBAL: expr;
  expr: LEVEL "top" [ 
    [ "REPR"; "("; e = expr; ")" -> 
        let buf = Buffer.create 256 in
        let _   = Format.bprintf buf "%a@?" (new P.printer ())#expr e in
        let str = Printf.sprintf "%S" (Buffer.contents buf) in       
        let str = String.sub str 1 ((String.length str) - 2) in 
        <:expr<($str:str$, $e$)>>        
    ] |
    [ "LOG"; args = args; "("; e = expr; ")" -> 
        if log_enabled.val 
        then e 
        else match args with
          [ None      -> <:expr<()>>
          | Some list -> 
            try
              do {
               ignore (List.find (fun view -> 
                         try do {ignore (List.find (fun x -> x = view) list); True} with [Not_found -> False]
                        ) 
                        log_views.val
                      ); 
               e
              }
            with [Not_found -> <:expr<()>>]
          ]
    ] 
  ];

  args: [
    [OPT arglist]
  ];

  arglist: [
    ["["; list = LIST1 [x = LIDENT -> x] SEP ","; "]" -> list]
  ];

END;

Camlp4.Options.add "-LOG" (Arg.Set log_enabled) " - enable logging";
Camlp4.Options.add "-VIEW" (Arg.String (fun s -> log_views.val := [s :: log_views.val])) 
                   "<name> - enable logging the specified view";
