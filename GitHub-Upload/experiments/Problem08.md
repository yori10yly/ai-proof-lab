# Experiment 08 — Distance from a target

If integer balances x and y each lie within e of the same target t, their difference x − y lies between −2e and 2e.

## Statement check

The variables are integers. The four inclusive bounds compare both observations to the same target. Together they imply e ≥ 0 whenever the hypotheses are satisfiable.

## Fixed Lean input

```lean
theorem problem08 (x y t e : Int) (hx₁ : t - e ≤ x) (hx₂ : x ≤ t + e)
    (hy₁ : t - e ≤ y) (hy₂ : y ≤ t + e) :
    -(2 * e) ≤ x - y ∧ x - y ≤ 2 * e := by
  sorry
```

## Attempt 1

```lean
constructor <;> omega
```

**Accepted.** Lean exited successfully with no diagnostics.

## Proof idea

Subtract the extreme allowed values. The common target cancels and leaves endpoints −2e and 2e. The omega tactic closes each linear goal.

[Verified Lean source](../Problem08.lean) · [Raw attempts and compiler outputs](runs/08/) · [Study protocol](../REPORT.md)
