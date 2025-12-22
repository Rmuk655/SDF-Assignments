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