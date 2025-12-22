(*Question 1*)
((*Soln 1:*))
let split list =
  let length = List.length list in
  let middle = (length + 1) / 2 in
  let rec auxillary first_half remaining_list =
    match remaining_list with
    | [] -> List.rev first_half, []
    | x :: v when List.length first_half < middle -> auxillary (x :: first_half) v
    | x :: v -> List.rev first_half, remaining_list
  in
  auxillary [] list
(*test cases:
1)split [1;2;3;4];;
Output: - : int list * int list = ([1; 2], [3; 4])
2)split [1;2;3;4;5];;
Output:- : int list * int list = ([1; 2; 3], [4; 5])
3)split [345;613;67;25;2346;9];;
Output:- : int list * int list = ([345; 613; 67], [25; 2346; 9])*)
(*Question 2*)
(*Soln 2:*)
let rec filter_map f list out_list = 
  match list with 
  | [] -> List.rev out_list
  | x :: v -> 
    match f x with
    | Some a -> filter_map f v (a :: out_list)
    | None -> filter_map f v out_list;;
(*Test cases:
1)utop # let l = [];;
val l : 'a list = []
utop # let g x = Some (x + x);;
val g : int -> int option = <fun>
utop # filter_map g [1;2;3;4] l;;
Output: - : int list = [2; 4; 6; 8]
2)utop # let l = [];;
val l : 'a list = []
utop # let g x = Some (x*x);;
val g : int -> int option = <fun>
utop # filter_map g [1;2;3;4] l;;
Output: - : int list = [1; 4; 9; 16]
3)utop # let l = [];;
val l : 'a list = []
utop # let g x = Some ((x*x + x)*(x*x));;
val g : int -> int option = <fun>
utop # filter_map g [1;2;3;4] l;;
Output: - : int list = [2; 24; 108; 320]*)
(*Question 3*)
(*Soln 3:*)
type 'b tree = 
  | Empty
  | Node of 'b * 'b tree * 'b tree
let rec tree_map x tr =
  match tr with
  | Empty -> Empty
  | Node (a, l, r) ->
      Node (x a, tree_map x l, tree_map x r)
(*Test cases:
1)utop # let tr = Node(1, Node(2, Empty, Empty), Node(3, Empty, Empty));;
val tr : int tree = Node (1, Node (2, Empty, Empty), Node (3, Empty, Empty))
utop # let x y = y*y;;
val x : int -> int = <fun>
utop # tree_map x tr;;
Output: - : int tree = Node (1, Node (4, Empty, Empty), Node (9, Empty, Empty))
2)utop # let tr = Node(1, Node(2, Empty, Empty), Node(3, Empty, Empty));;
val tr : int tree = Node (1, Node (2, Empty, Empty), Node (3, Empty, Empty))
utop # let x y = y*y + 3*y;;
val x : int -> int = <fun>
utop # tree_map x tr;;
Output: - : int tree = Node (4, Node (10, Empty, Empty), Node (18, Empty, Empty))
3)utop # let tr = Node(1, Node(2, Empty, Empty), Node(3, Empty, Empty));;
val tr : int tree = Node (1, Node (2, Empty, Empty), Node (3, Empty, Empty))
utop # let x y = y*y*y - y*y + y - 1;;
val x : int -> int = <fun>
utop # tree_map x tr;;
Output: - : int tree = Node (0, Node (5, Empty, Empty), Node (20, Empty, Empty))*)
(*Question 4 part a*)
(*Soln 4a:*)
let rec flatten list list1 =
  match list with
  |[] -> List.rev list1
  |x :: v -> flatten v (List.rev x @ list1)
(*Test cases:
1)utop # let list = [[1;2;3]; [3;7;8]];;
val list : int list list = [[1; 2; 3]; [3; 7; 8]]
utop # let list1 = [];;
val list1 : 'a list = []
utop # flatten list list1;;
Output: - : int list = [1; 2; 3; 3; 7; 8]
2)utop # let list = [[1;4]; [3;6;23;9]];;
val list : int list list = [[1; 4]; [3; 6; 23; 9]]
utop # let list1 = [];;
val list1 : 'a list = []
utop # flatten list list1;;
Output: - : int list = [1; 4; 3; 6; 23; 9]
3)utop # let list = [[2;7]; [6];[1;3;9]];;
val list : int list list = [[2; 7]; [6]; [1; 3; 9]]
utop # let list1 = [];;
val list1 : 'a list = []
utop # flatten list list1;;
Output: - : int list = [2; 7; 6; 1; 3; 9]
*)
(*Question 4b*)
(*Soln 4b:*)
let rec flatten list list1 =
  match list with
  |[] -> List.rev list1
  |x :: v -> flatten v (List.rev_append x list1);;
(*Test cases:
1)utop # let list = [[1;2;3]; [3;7;8]];;
val list : int list list = [[1; 2; 3]; [3; 7; 8]]
utop # let list1 = [];;
val list1 : 'a list = []
utop # flatten list list1;;
Output: - : int list = [1; 2; 3; 3; 7; 8]
2)utop # let list = [[1;4]; [3;6;23;9]];;
val list : int list list = [[1; 4]; [3; 6; 23; 9]]
utop # let list1 = [];;
val list1 : 'a list = []
utop # flatten list list1;;
Output: - : int list = [1; 4; 3; 6; 23; 9]
3)utop # let list = [[2;7]; [6];[1;3;9]];;
val list : int list list = [[2; 7]; [6]; [1; 3; 9]]
utop # let list1 = [];;
val list1 : 'a list = []
utop # flatten list list1;;
Output: - : int list = [2; 7; 6; 1; 3; 9]
*)
(*Question 5*)
(*Soln 5:*)
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
(*Question 6*)
(*Soln 6:*)
type shape = 
  |Circle of float 
  |Rectangle of float*float;;
let pi = 3.14159;;
let area shape = 
  match shape with
  |Circle radius -> pi*.radius*.radius
  |Rectangle (lenth, width) -> lenth*.width
(*Test cases:
1)utop # let x = Circle(5.0);;
val x : shape = Circle 5.
area x;;
Output: - : float = 78.53975
2)utop # let x = Rectangle(5.6, 4.5);;
val x : shape = Rectangle (5.6, 4.5)
area x;;
Output: - : float = 25.2
3)utop # let x = Rectangle(51.3, 6.7);;
val x : shape = Rectangle (51.3, 6.7)
area x;;
Output: - : float = 343.71
*)
(*Question 7*)
(*Soln 7:*)
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
(*Question 8*)
(*Soln 8:*)
exception Misplaced of string;;
let parse_int_list string list =
  let parts = String.split_on_char ',' string in
  let parse_int s =
    try int_of_string (String.trim s)
    with Failure _ -> raise (Misplaced ("Invalid integer: " ^ s))
  in
  list @ List.map parse_int parts
let () =
  try
    let result = parse_int_list "1, 2, 3, 4" [] in
    List.iter (Printf.printf "%d ") result
  with
  | Misplaced message -> Printf.printf "Error: %s\n" message;;
(*Test cases:
1)utop # list = [];;
- : bool = false
utop # let string = "1,4,5,6,7";;
val string : string = "1,4,5,6,7"
utop # parse_int_list string list;;
Output: - : int list = [1; 4; 5; 6; 7]
2)utop # list = [];;
- : bool = false
utop # let string = "4,10,69,3";;
val string : string = "4,10,69,3"
utop # parse_int_list string list;;
Output: - : int list = [4; 10; 69; 3]
3)utop # list = [];;
- : bool = false
utop # let string = "1,2,3,4";;
val string : string = "1,2,3,4"
utop # parse_int_list string list;;
Output: - : int list = [1; 2; 3; 4]*)