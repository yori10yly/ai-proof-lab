# Experiment 03 — Constructing a divisibility witness

Any common divisor of a and b divides r times a plus s times b, for arbitrary natural coefficients r and s. Construct the witness from the two hypotheses.

## Statement check

The coefficients may be zero. The proof must exhibit a natural number multiplying d to give the full linear combination.

## Fixed Lean input

```lean
theorem problem03 (d a b r s : Nat) (ha : d ∣ a) (hb : d ∣ b) :
    d ∣ r * a + s * b := by
  sorry
```

## Attempt 1

```lean
obtain ⟨x, rfl⟩ := ha
obtain ⟨y, rfl⟩ := hb
refine ⟨r * x + s * y, ?_⟩
simp [Nat.mul_add, Nat.mul_assoc, Nat.mul_left_comm, Nat.mul_comm]
```

**Rejected.** Lean identified two unused rules in the simplifier list. Warnings count as errors in this study. Removing those rules preserved both the witness and the proof strategy.

```text
<stdin>:6:21: error: This simp argument is unused:
  Nat.mul_assoc

Hint: Omit it from the simp argument list.
  [apply] simp [Nat.mul_add, Nat.mul_left_comm, Nat.mul_comm]

Note: This linter can be disabled with `set_option linter.unusedSimpArgs false`
<stdin>:6:55: error: This simp argument is unused:
  Nat.mul_comm

Hint: Omit it from the simp argument list.
  [apply] simp [Nat.mul_add, Nat.mul_assoc, Nat.mul_left_comm]

Note: This linter can be disabled with `set_option linter.unusedSimpArgs false`
```

## Attempt 2

```lean
obtain ⟨x, rfl⟩ := ha
obtain ⟨y, rfl⟩ := hb
refine ⟨r * x + s * y, ?_⟩
simp [Nat.mul_add, Nat.mul_left_comm]
```

**Accepted.** Lean exited successfully with no diagnostics.

## Proof idea

If a = d x and b = d y, the witness is r x + s y. Distributivity expands d times this witness; permuting factors matches each term.

[Verified Lean source](../Problem03.lean) · [Raw attempts and compiler outputs](runs/03/) · [Study protocol](../REPORT.md)
