# Experiment 06 — A finite geometric sum

The sum of the first n powers of two, starting with 1, plus one equals two to the power n.

## Statement check

The base sum is zero, and the successor adds 2 to the power n. Thus the n terms have exponents 0 through n − 1.

## Fixed Lean input

```lean
def powerSum : Nat → Nat
  | 0 => 0
  | n + 1 => powerSum n + 2 ^ n

theorem problem06 (n : Nat) : powerSum n + 1 = 2 ^ n := by
  sorry
```

## Attempt 1

```lean
induction n with
| zero => rfl
| succ n ih =>
  rw [powerSum, Nat.pow_succ]
  omega
```

**Accepted.** Lean exited successfully with no diagnostics.

## Proof idea

Unfold one recursive step and expand the successor power. The induction hypothesis then suffices for linear arithmetic.

[Verified Lean source](../Problem06.lean) · [Raw attempts and compiler outputs](runs/06/) · [Study protocol](../REPORT.md)
