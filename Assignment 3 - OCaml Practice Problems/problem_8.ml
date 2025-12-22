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