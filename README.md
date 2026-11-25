# AI Proof Lab

Can an AI turn a mathematical argument into a proof that Lean accepts? This case study follows ten problems in number theory, induction, and inequalities, preserving all thirteen submissions and their compiler feedback.

| Check | Result |
| --- | ---: |
| First attempt, Lean's default warning policy | 8/10 |
| First attempt, zero warnings required | 7/10 |
| After at most one revision, zero warnings required | 10/10 |

The collection includes one setup pilot and nine new problems. All proofs were generated with Codex in a shared project context. These results describe this small collection.

**Explore the project:** [All ten theorems](GitHub-Upload/README.md) · [Research report](GitHub-Upload/REPORT.md) · [Raw submissions and compiler output](GitHub-Upload/experiments/runs/)

[Experiment 04](GitHub-Upload/experiments/Problem04.md) shows how Lean's remaining goal exposed a misplaced rewrite in an induction proof. The repair changed one line.

## Reproduce locally

From the repository root, with Lean installed via Elan and Python 3 available:

```sh
cd GitHub-Upload
lake build
python3 scripts/replay.py
```
