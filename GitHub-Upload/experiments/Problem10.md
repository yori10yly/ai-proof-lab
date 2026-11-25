# Experiment 10 — A quadratic inequality

For any two integers a and b, four times their product is at most the square of their sum.

## Statement check

The quantities are arbitrary integers, including negative values. The right-hand side uses the whole sum as both factors.

## Fixed Lean input

```lean
theorem problem10 (a b : Int) : 4 * a * b ≤ (a + b) * (a + b) := by
  sorry
```

## Attempt 1

```lean
have h := Int.mul_self_nonneg (a - b)
grind
```

**Rejected.** The name Int.mul_self_nonneg was unavailable. The repair splits on a ≤ b and applies Int.mul_nonneg to the nonnegative difference in each branch.

```text
<stdin>:2:12: error(lean.unknownIdentifier): Unknown constant `Int.mul_self_nonneg`
<stdin>:1:65: error: unsolved goals
a b : Int
⊢ 4 * a * b ≤ (a + b) * (a + b)
```

## Attempt 2

```lean
by_cases h : a ≤ b
· have hn : 0 ≤ b - a := by omega
  have hs := Int.mul_nonneg hn hn
  simp only [Int.sub_mul, Int.mul_sub] at hs
  simp only [Int.add_mul, Int.mul_add, Int.mul_assoc]
  rw [Int.mul_comm b a] at *
  omega
· have hn : 0 ≤ a - b := by omega
  have hs := Int.mul_nonneg hn hn
  simp only [Int.sub_mul, Int.mul_sub] at hs
  simp only [Int.add_mul, Int.mul_add, Int.mul_assoc]
  rw [Int.mul_comm b a] at *
  omega
```

**Accepted.** Lean exited successfully with no diagnostics.

## Proof idea

Choose the nonnegative difference b − a or a − b. Multiply it by itself, expand the products, and use the resulting inequality to bound 4ab.

[Verified Lean source](../Problem10.lean) · [Raw attempts and compiler outputs](runs/10/) · [Study protocol](../REPORT.md)
