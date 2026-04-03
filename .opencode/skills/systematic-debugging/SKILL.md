---
name: systematic-debugging
description: Investigate root causes before non-obvious fixes. Use when a bug, inconsistency, or repeated failure requires evidence-driven debugging rather than guesswork.
compatibility: opencode
---

# systematic-debugging

## What this skill does
This skill enforces root-cause-first debugging.

Its rule is:

> Do not guess at fixes when the cause is unclear. Collect evidence, isolate the failure, identify the cause, then apply the smallest fix that matches the cause.

In the `coffeemix_all` sandbox, the “bug” may be:

- a stale path,
- a wrong workspace label,
- a broken link,
- a mismatch between docs and files,
- or a routing/config inconsistency.

## When to use
- A failure is not obvious from first inspection
- Two or more fix attempts have already failed
- The issue spans multiple docs/config files
- There is disagreement between claimed behavior and actual local files
- A routing or identity problem appears across several artifacts

## When NOT to use
- Single-line obvious mistakes with direct evidence
- Tasks that are purely additive and not fixing a failure
- Cases where `enter-plan-mode` is sufficient and no actual failure exists

## Core rules / gates

### Rule 1: Separate symptom from cause
- **Symptom**: what is observed
- **Cause**: why it is happening

Do not treat them as the same thing.

### Rule 2: Collect evidence before proposing fixes
Use local files and checks to prove the failure pattern.

### Rule 3: Prefer one focused fix over many speculative edits
If the cause is unclear, continue investigating instead of changing multiple files at once.

### Rule 4: Escalate after repeated failure
If two fix attempts fail, document what was tried and re-evaluate the cause explicitly.

## Required workflow

1. **State the symptom**
   - What is wrong right now?
2. **Collect local evidence**
   - Which files or outputs prove the issue?
3. **Form a cause hypothesis**
   - What is the smallest explanation consistent with the evidence?
4. **Apply one targeted fix**
   - Change only what the hypothesis requires.
5. **Re-check the symptom**
   - Confirm whether the fix removed the failure.

## Evidence expectations

Helpful evidence in this sandbox includes:

- `read` output proving stale paths or stale links
- `grep` results proving spread or duplication of the issue
- config/plugin path checks
- before/after comparison of the specific failing artifact

## Anti-patterns
- Shotgun debugging
- “Maybe this file too” edits without evidence
- Fixing symptoms in three places before understanding the source
- Calling something a root cause with no local proof
- Turning debugging into general refactoring

## OMO / CoffeeMix alignment rules
- This skill complements `cc-bughunter`; it does not replace that specialist.
- Use it to structure the debugging method even when another specialist owns the domain.
- Keep debugging local to this workspace unless the user explicitly broadens scope.
- Never use this skill as justification to touch global OpenCode configuration.
