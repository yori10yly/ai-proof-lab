# Experiment 04 — A product of consecutive numbers

For every natural number n, the product of n and n + 1 is divisible by two.

## Statement check

There is no parity hypothesis. For n = 0 the product vanishes, so zero is a valid witness.

## Fixed Lean input

```lean
theorem problem04 (n : Nat) : 2 ∣ n * (n + 1) := by
  sorry
```

## Attempt 1

```lean
induction n with
| zero => exact ⟨0, rfl⟩
| succ n ih =>
  obtain ⟨k, hk⟩ := ih
  refine ⟨k + (n + 1), ?_⟩
  calc
    (n + 1) * (n + 1 + 1) = n * (n + 1) + 2 * (n + 1) := by
      rw [Nat.mul_comm (n + 1) (n + 1 + 1), Nat.add_mul, Nat.add_mul]
      omega
    _ = 2 * (k + (n + 1)) := by rw [hk, Nat.mul_add]
```

**Rejected.** The untargeted distributive rewrite expanded a nested product on the wrong side. Specifying the operands 2, k, and n + 1 rewrote the intended right-hand side.

```text
<stdin>:11:31: error: unsolved goals
n k : Nat
hk : n * (n + 1) = 2 * k
⊢ 2 * k + (2 * n + 2 * 1) = 2 * (k + (n + 1))
```

## Attempt 2

```lean
induction n with
| zero => exact ⟨0, rfl⟩
| succ n ih =>
  obtain ⟨k, hk⟩ := ih
  refine ⟨k + (n + 1), ?_⟩
  calc
    (n + 1) * (n + 1 + 1) = n * (n + 1) + 2 * (n + 1) := by
      rw [Nat.mul_comm (n + 1) (n + 1 + 1), Nat.add_mul, Nat.add_mul]
      omega
    _ = 2 * (k + (n + 1)) := by rw [hk, Nat.mul_add 2 k (n + 1)]
```

**Accepted.** Lean exited successfully with no diagnostics.

## Proof idea

Induction turns a witness k for n(n + 1) into k + (n + 1) for the next product. The difference of the two products is 2(n + 1).

[Verified Lean source](../Problem04.lean) · [Raw attempts and compiler outputs](runs/04/) · [Study protocol](../REPORT.md)
