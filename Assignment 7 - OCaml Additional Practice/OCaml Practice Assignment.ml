(*Beginner Set of Questions:*)
(*Question 1: Tail of a List*)
(*Soln 1:*)
let rec last list = 
  match list with
  | [] -> None
  | [ x ] -> Some x
  | a :: v -> last v;;
(*Question 2: Length of a List*)
(*Soln 2:*)
let rec length list = 
  match list with
  | [] -> 0
  | x :: v -> 1 + length v;;
(*Question 3: Last Two Elements of a List*)
(*Soln 3:*)
let rec last_2 list =
  match list with
  | [] -> None
  | [ x ] -> None
  | [ a; b ] -> Some [a; b]
  | u :: v -> last_2 v;;
(*Question 4: N'th Element of a List*)  
(*Soln 4:*)
let rec list_n n list = 
    match list with
    | [] -> None
    | [ x ] -> if n = 0 then Some x else None
    | x :: (b :: c as v) -> if n = 1 then Some b else list_n (n - 1) v;;
(*Question 5: Reverse a List*)
(*Soln 5:*)
let rec rev list = 
  let rec aux index list = 
    match list with
    | [] -> []
    | x :: v -> (aux (index + 1) v) @ [x] in aux 0 list;;
(*Question 6: Palindrome*)  
(*Soln 6:*)
let is_pal list = 
  if list = List.rev list then
    true
  else
    false;;
(*Question 7: Determine Whether Two Positive Integer Numbers Are Coprime*)  
(*Soln 7:*)
let rec gcd a b = 
  if b = 0 then a
  else gcd b (a mod b);;
let co_prime a b = 
  if (gcd a b = 1) then
    true
  else
    false;;
(*Question 8: Create a List Containing All Integers Within a Given Range*)  
(*Soln 8:*)
let rec create a b = 
  if a > b then []
  else a :: create (a + 1) b;;
(*Question 9: Duplicate the Elements of a List*)
(*Soln 9:*)
let rec dup list =
  match list with
  | [] -> List.rev []
  | x :: v ->  x :: x :: dup v;;
(*Question 10: Remove Kth element*)
(*Soln 10:*)
let rec length list = 
  match list with
  | [] -> 0
  | x :: v -> 1 + length v;;
let rec remove k list =
  match list with
  | [] -> []
  | u :: v -> 
  if k = 0 then v
  else u :: remove (k - 1) v;;
(*Intermediate set of questions*)
(*Question 1: GCD*)  
(*Soln 1:*)
  let rec gcd_a_b a b = 
    if b = 0 then a
    else gcd_a_b b (a mod b);;
(*Question 2: Eliminate Consecutive Duplicates*)  
(*Soln 2:*)
let rec elim list = 
  match list with
  | [] -> []
  | [ x ] -> [ x ]
  | u :: (b :: _ as v) -> 
    if u = b then elim v
    else u :: elim v;;
(*Question 3: English Number Words*)
(*Soln 3:*)
let word n = 
  match n with
  | 1 -> "one"
  | 2 -> "two"
  | 3 -> "three"
  | 4 -> "four"
  | 5 -> "five"
  | 6 -> "six"
  | 7 ->"seven"
  | 8 -> "eight"
  | 9 -> "nine"
  | 0 -> "zero" 
  | _ -> "Invalid";;
let rec full_words n = 
  if n < 10 then word n
  else full_words (n / 10) ^ "-" ^ word (n mod 10);;
(*Question 4: Drop Every N'th Element From a List*)
(*Soln 4:*)
let drop list n =
  let rec helper index list = 
    match list with
    | [] -> []
    | u :: v ->
    if index mod n = 0 then
      helper (index + 1) v
    else
      u :: helper (index + 1) v
  in 
  if n > 0 then helper 1 list 
  else list;;
(*Question 5: Replicate the Elements of a List a Given Number of Times*)  
(*Soln 5:*)
let rec repli a n = 
  if n <= 0 then []
  else a :: repli a (n - 1);;
let rec repl list n =
  match list with
  | [] -> []
  | u :: v -> repli u n @ repl v n;;
(*Advanced set of questions*)
(*Question 1: Huffmann Code*)  
(*Soln 1:*)
type tree = 
  | Leaf of int * char
  | Node of int * tree * tree
  
let rec convert_input_to_nodes input =
  match input with
  | [] -> []
  | (c, f)::rest -> Leaf (f, c) :: convert_input_to_nodes rest

let get_freq n =
  match n with
  | Leaf (freq, _) -> freq 
  | Node (freq, _, _) -> freq 

let freq_compare a b = compare (get_freq a) (get_freq b) 

let rec merge_two a b = Node ((get_freq a) + (get_freq b), a, b)

let rec merge_nodes nodes = 
  match List.sort freq_compare nodes with
  | a::b::rest -> (merge_two a b) :: rest

let rec create_huffmann_tree nodes = 
  match nodes with
  | [ x ] -> x
  | _ -> create_huffmann_tree (merge_nodes nodes)

let rec convert_tree_to_codes tree prefix =
  match tree with 
  | Leaf (_, c) -> [(c, prefix)]
  | Node (_, left, right) -> List.append 
                               (convert_tree_to_codes left (prefix ^ "0"))
                               (convert_tree_to_codes right (prefix ^ "1"))

