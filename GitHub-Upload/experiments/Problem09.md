# Experiment 09 — Bounds for a weighted sum

Split w natural-number units between quantities a and b with a ≤ b. If k units receive a and the remaining units receive b, the total is between w times a and w times b.

## Statement check

The weights are counts, so they are nonnegative integers. The condition k ≤ w makes natural subtraction w − k the intended remainder. The result bounds the total, without division by w.

## Fixed Lean input

```lean
theorem problem09 (a b k w : Nat) (hab : a ≤ b) (hk : k ≤ w) :
    w * a ≤ k * a + (w - k) * b ∧ k * a + (w - k) * b ≤ w * b := by
  sorry
```

## Attempt 1

```lean
have h : k + (w - k) = w := by omega
constructor
· calc
    w * a = k * a + (w - k) * a := by rw [← Nat.add_mul, h]
    _ ≤ _ := Nat.add_le_add_left (Nat.mul_le_mul_left (w - k) hab) _
· calc
    k * a + (w - k) * b ≤ k * b + (w - k) * b :=
      Nat.add_le_add_right (Nat.mul_le_mul_left k hab) _
    _ = w * b := by rw [← Nat.add_mul, h]
```

**Accepted.** Lean exited successfully with no diagnostics.

## Proof idea

The weights add to w. Replace the higher value by the lower one for the lower bound, and the lower value by the higher one for the upper bound. Multiplication by either weight preserves order.

[Verified Lean source](../Problem09.lean) · [Raw attempts and compiler outputs](runs/09/) · [Study protocol](../REPORT.md)
