# Experiment 02 — Divisibility of a sum

If d divides both a and b, then d divides their sum.

## Statement check

All three variables are natural numbers. The hypotheses concern the same divisor; the conclusion concerns the sum of the dividends.

## Fixed Lean input

```lean
theorem problem02 (d a b : Nat) (ha : d ∣ a) (hb : d ∣ b) : d ∣ a + b := by
  sorry
```

## Attempt 1

```lean
exact Nat.dvd_add ha hb
```

**Accepted.** Lean exited successfully with no diagnostics.

## Proof idea

The library lemma Nat.dvd_add applies directly to both hypotheses.

[Verified Lean source](../Problem02.lean) · [Raw attempts and compiler outputs](runs/02/) · [Study protocol](../REPORT.md)
