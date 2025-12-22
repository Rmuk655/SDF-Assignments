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