# AI Proof Lab

**Evaluating Mathematical Proofs with Lean 4**

Can a coding assistant complete a fixed mathematical statement on its first attempt? When Lean rejects the answer, does the compiler message help repair it? This case study follows ten problems through both checks.

**Results.** The setup pilot passed. Of the nine new problems, six passed on the first attempt. All three remaining proofs passed after one revision using Lean's feedback. Across the full collection, that is **7/10 on the first check and 10/10 after feedback**.

Read [Experiment 04](experiments/Problem04.md) for a worked example of an incorrect rewrite, Lean's remaining goal, and the one-line repair. The [research report](REPORT.md) explains how each attempt was scored and what the sample can tell us.

## Browse the experiments

The number opens the experiment log. The title opens the checked Lean file.

| Log | Theorem | Topic | First check | Revisions |
| --- | --- | --- | --- | ---: |
| [01](experiments/Problem01.md) | [Divisibility is transitive](Problem01.lean) | Number theory | Passed | 0 |
| [02](experiments/Problem02.md) | [Divisibility of a sum](Problem02.lean) | Number theory | Passed | 0 |
| [03](experiments/Problem03.md) | [Constructing a divisibility witness](Problem03.lean) | Number theory | Unused simplification rules | 1 |
| [04](experiments/Problem04.md) | [A product of consecutive numbers](Problem04.lean) | Number theory | Unsolved goal after rewriting | 1 |
| [05](experiments/Problem05.md) | [The triangular sum](Problem05.lean) | Induction | Passed | 0 |
| [06](experiments/Problem06.md) | [A finite geometric sum](Problem06.lean) | Induction | Passed | 0 |
| [07](experiments/Problem07.md) | [Reversing a concatenation](Problem07.lean) | Induction | Passed | 0 |
| [08](experiments/Problem08.md) | [Distance from a target](Problem08.lean) | Inequalities | Passed | 0 |
| [09](experiments/Problem09.md) | [Bounds for a weighted sum](Problem09.lean) | Inequalities | Passed | 0 |
| [10](experiments/Problem10.md) | [A quadratic inequality](Problem10.lean) | Inequalities | Unknown lemma name | 1 |

## Reproduce the results

Open this project folder in VS Code to browse the proofs. With the pinned Lean toolchain (via Elan) and Python 3.8 or later available, run these commands from the project root:

```sh
lake build
python3 scripts/replay.py
```

The first command builds the library of ten theorems. The second replays all thirteen submitted proofs, checks their diagnostics against the archived results, and audits the dependencies of the ten final theorems. The project uses Lean's default imports and the Python standard library.

To check just the first proof:

```sh
lake env lean -DwarningAsError=true Problem01.lean
```

Each [fixed problem statement](experiments/cases.json) is paired with [numbered attempts and raw outputs](experiments/runs/). The names and comments are in English throughout.
