LOGS (
  module P =
   struct

      let print s = Printf.printf "%s\n" s

   end
)

let _ = 
  LOG (P.print "printed")
;;
