# What changed after Lean gave feedback?

Ten elementary statements produced three different reasons to revise an AI-generated proof. One proof was mathematically accepted but emitted warnings. One rewrite acted on the wrong expression. One argument relied on a name absent from the pinned environment. All three passed the strict check on their next submission.

## Results

| Cohort | Problems | Passed first strict check | Passed after at most one repair |
| --- | ---: | ---: | ---: |
| Earlier setup pilot | 1 | 1 | 1 |
| New batch | 9 | 6 | 9 |
| Full collection | 10 | 7 | 10 |

There were 13 submissions in total, including 3 second attempts. Under Lean's normal warning policy, **8 of 10 first submissions compiled**. The stricter **7 of 10** measures warning-free compilation. The difference comes entirely from Problem 03. [Default-policy compiler outputs](experiments/default-first-checks.json)

## Three repairs

| Problem | What Lean reported | What changed |
| --- | --- | --- |
| [03 · Common divisor](experiments/Problem03.md) | Two unused simplification rules | The proof retained the witness and removed the redundant rules. |
| [04 · Consecutive numbers](experiments/Problem04.md) | An equality remained after the last rewrite | The proof named the operands of distributivity so Lean expanded the intended product. |
| [10 · Quadratic inequality](experiments/Problem10.md) | Unknown constant, followed by an unsolved goal | The repair used a sign split and multiplied a nonnegative difference by itself. |

Problem 04 illustrates why a correct paper argument can still yield an incomplete tactic script. Given a witness k for n(n + 1) = 2k, adding n + 1 to k gives a witness for the successor. The first proof found that witness. Its final rewrite expanded a nested term, leaving an equality for Lean to prove. Supplying the arguments to the distributive lemma closed precisely that gap.

Problem 09 provides a small connection to portfolio arithmetic. An allocation of k units to a and w − k units to b has total value between wa and wb when a ≤ b. The formal statement uses natural-number counts and values. It covers w = 0 and makes no claim about signed investment returns.

## Method

- **Generator and scope.** Codex (GPT-6.2 Astra in the new batch) authored both the examples and proof attempts in a shared project conversation. Problem 01 was an earlier Codex setup pilot with a known result. Problems 02–10 were drafted together and their first proof bodies saved before any of those nine were checked. The generator saw the fixed formal declarations and any supplied recursive definitions.
- **What was scored.** Each trial supplied a proof body. The checker inserted it after the same declaration and definitions for every attempt. It used Lean 4.36.0 with default imports. A first pass required an exit code of zero under warnings-as-errors. A repair reused the statement and the observed diagnostic. Each failed case needed one repair.
- **Validity checks.** Each final Lean file matches its fixed declaration, definitions, and accepted response. Replaying the archive checks exit codes and diagnostics for every attempt. The axiom audit found only Lean's standard propext and, in some proofs, Quot.sound. No accepted proof contains a placeholder. Each experiment log also explains how the formal statement corresponds to the English question.
- **Reproduction.** The replay script rechecks the saved submissions with the pinned Lean version. It requires no model API, key, or online model call. A fresh AI run can produce different proofs.

## Limits

The examples were small, author-selected, and generated in one shared context. The results describe these ten statements and this workflow. They cannot estimate a model's general theorem-proving ability, compare AI systems, or isolate the causal benefit of compiler feedback from having a second attempt. The model helped design the problems, and the statement checks are self-review. Independent evaluation would require held-out statements and separate sessions. No Copilot results are included.

[Browse the proofs and replay instructions](README.md)
