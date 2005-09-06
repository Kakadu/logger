let _ = 
   let str, expr = REPR (let x, y = 2, 3 in x+y) in
   LOG (Printf.printf "%S = %d\n" str expr)
;;
