(*Definition 1*)
let safe_div a b = 
  if b = 0 then None
  else Some(a/b);;
(*Definition 2*)
let safe_div a b = 
  try Some(a/b)
  with Division_by_zero -> None;;
(*Test cases:
1)safe_div 18 9;;
Output:- : int option = Some 2
2)safe_div 2 0;;
Output:- : int option = None
3)safe_div 8 2;;
Output:- : int option = Some 4
*)

