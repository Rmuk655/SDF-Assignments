exception NotFound of string;;
let rec find_index predicate list index = 
  match list with
  |[] -> raise (NotFound (Printf.sprintf "Not found at index %d in a list of size %d" index (List.length list)))
  |x :: u -> 
    if predicate x then
      index
    else
      find_index predicate u (index + 1);;
(*Test cases:
1)utop # let predicate x = x mod 2 = 0;;
val predicate : int -> bool = <fun>
utop # let list = [];;
val list : 'a list = []
utop # let index = 0;;
val index : int = 0
utop # find_index predicate list index;;
Output: Exception: NotFound "Not found at index 0 in a list of size 0".
2)utop # let predicate x = x mod 2 = 0;;
val predicate : int -> bool = <fun>
utop # let list = [1; 4; 6];;
val list : 'a list = [1; 4; 6]
utop # let index = 0;;
val index : int = 0
utop # find_index predicate list index;;
Output: - : int = 1
3)utop # let predicate x = x mod 3 = 0;;
val predicate : int -> bool = <fun>
utop # let list = [1; 4; 6];;
val list : 'a list = [1; 4; 6]
utop # let index = 0;;
val index : int = 0
utop # find_index predicate list index;;
Output: - : int = 2*)