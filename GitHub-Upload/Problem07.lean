-- Reversing a concatenation

def labReverse {α : Type} : List α → List α
  | [] => []
  | x :: xs => labReverse xs ++ [x]

theorem problem07 {α : Type} (xs ys : List α) :
    labReverse (xs ++ ys) = labReverse ys ++ labReverse xs := by
  induction xs with
  | nil => simp [labReverse]
  | cons x xs ih => simp [labReverse, ih, List.append_assoc]
