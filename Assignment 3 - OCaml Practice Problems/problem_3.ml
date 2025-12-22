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