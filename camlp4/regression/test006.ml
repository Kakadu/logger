let _ = 
   let str, expr = REPR (let x, y = 2, 3 in x+y) in
   LOG (Printf.printf "%S = %d\n" str expr);
   let str, expr = REPR (["a", "b", "c"]) in
   LOG (Printf.printf "%s\n" str);
;;
