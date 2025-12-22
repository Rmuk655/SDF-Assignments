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