# Experiment 07 — Reversing a concatenation

For lists over any element type, reversing xs appended to ys equals the reverse of ys appended to the reverse of xs. Use the supplied reverse function.

## Statement check

Both input lists have the same arbitrary element type. The conclusion swaps the order of the lists; the definition reverses by appending the head at the end.

## Fixed Lean input

```lean
def labReverse {α : Type} : List α → List α
  | [] => []
  | x :: xs => labReverse xs ++ [x]

theorem problem07 {α : Type} (xs ys : List α) :
    labReverse (xs ++ ys) = labReverse ys ++ labReverse xs := by
  sorry
```

## Attempt 1

```lean
induction xs with
| nil => simp [labReverse]
| cons x xs ih => simp [labReverse, ih, List.append_assoc]
```

**Accepted.** Lean exited successfully with no diagnostics.

## Proof idea

Induct on the first list. The successor step turns into associativity of append after applying the induction hypothesis.

[Verified Lean source](../Problem07.lean) · [Raw attempts and compiler outputs](runs/07/) · [Study protocol](../REPORT.md)
