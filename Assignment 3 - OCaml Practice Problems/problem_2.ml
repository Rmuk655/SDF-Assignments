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