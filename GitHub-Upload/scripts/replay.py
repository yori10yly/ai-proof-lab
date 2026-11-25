"""Replay the human-readable, version-controlled trial records with local Lean."""
import json
import re
import subprocess
import sys
from pathlib import Path
from textwrap import indent

ROOT = Path(__file__).resolve().parents[1]
DATA = ROOT / "experiments"
CASES = json.loads((DATA / "cases.json").read_text())
STANDARD_AXIOMS = {"propext", "Classical.choice", "Quot.sound"}


def source(case, body):
    sections = [case["definitions"], case["statement"] + "\n" + indent(body.rstrip(), "  ")]
    return "\n\n".join(filter(None, sections)) + "\n"


def check(text):
    run = subprocess.run(
        ["lake", "env", "lean", "-DwarningAsError=true", "--stdin"],
        cwd=ROOT, input=text, capture_output=True, text=True, check=False, timeout=120,
    )
    return {"exit_code": run.returncode, "stdout": run.stdout, "stderr": run.stderr}


def trials(case):
    return sorted((DATA / "runs" / case["id"]).glob("*.txt"))


def audit(case, proof):
    name = "problem" + case["id"]
    result = check(proof + "\n#print axioms " + name + "\n")
    if result["exit_code"]:
        raise ValueError(result)
    output = result["stdout"].strip()
    if output == f"'{name}' does not depend on any axioms":
        return []
    match = re.fullmatch(rf"'{name}' depends on axioms: \[([^\]]*)\]", output)
    if not match:
        raise ValueError("Unrecognized axiom report: " + output)
    names = [x.strip() for x in match[1].split(",") if x.strip()]
    if set(names) - STANDARD_AXIOMS:
        raise ValueError("Unexpected axioms: " + output)
    return names


def verify(case):
    attempts = trials(case)
    if not attempts:
        raise ValueError("No attempts found")
    for path in attempts:
        recorded = json.loads(path.with_suffix(".json").read_text())
        actual = check(source(case, path.read_text()))
        if actual != recorded:
            raise ValueError(f"{path.name}: diagnostics differ from archived output")
    body = attempts[-1].read_text()
    if actual["exit_code"] or re.search(r"\b(sorry|admit)\b", body):
        raise ValueError("Final attempt has errors or a placeholder")
    final = (ROOT / f"Problem{case['id']}.lean").read_text()
    # Final files may have an introductory line comment before the fixed declaration.
    content = re.sub(r"\A(?:--[^\n]*\n|\n)*", "", final)
    if content != source(case, body):
        raise ValueError("Final file differs from the fixed theorem and accepted attempt")
    names = audit(case, final)
    print(f"Problem {case['id']}: verified {len(attempts)} attempt(s); axioms: {', '.join(names) or 'none'}")


if __name__ == "__main__":
    try:
        for item in CASES:
            verify(item)
    except (OSError, ValueError, subprocess.SubprocessError) as error:
        sys.exit(f"Replay failed: {error}")
