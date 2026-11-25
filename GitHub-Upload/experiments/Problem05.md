# Experiment 05 — The triangular sum

Twice the sum from 1 through n equals n times n + 1, including the empty sum at n = 0.

## Statement check

The recursive sum starts at zero and adds n + 1 in the successor case. The right side is n multiplied by (n + 1).

## Fixed Lean input

```lean
def sumTo : Nat → Nat
  | 0 => 0
  | n + 1 => sumTo n + (n + 1)

theorem problem05 (n : Nat) : 2 * sumTo n = n * (n + 1) := by
  sorry
```

## Attempt 1

```lean
induction n with
| zero => rfl
| succ n ih =>
  rw [sumTo, Nat.mul_add, ih]
  simp [Nat.add_mul, Nat.mul_add]
  omega
```

**Accepted.** Lean exited successfully with no diagnostics.

## Proof idea

Expand the sum at the successor, substitute the induction hypothesis, and distribute the products. The remaining arithmetic is linear in the common terms.

[Verified Lean source](../Problem05.lean) · [Raw attempts and compiler outputs](runs/05/) · [Study protocol](../REPORT.md)
