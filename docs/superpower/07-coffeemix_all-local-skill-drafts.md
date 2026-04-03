# Proposed Local Superpower Skill Drafts

**Workspace**: `C:\Work\claude_pickup\opencode_coffeemix_all_sandbox`  
**Status**: implemented first-wave specs  
**Scope**: define the local skill set and preserve the design intent behind the implemented first-wave files

---

## 1. Purpose

This document defines the proposed local skill set needed to bring superpowers-style discipline into this sandbox.

It is derived from:

- [`01-coffeemix_all-gap-analysis.md`](./01-coffeemix_all-gap-analysis.md)
- [`02-coffeemix_all-tdd-verification-discipline.md`](./02-coffeemix_all-tdd-verification-discipline.md)
- [`03-coffeemix_all-sandbox-file-map.md`](./03-coffeemix_all-sandbox-file-map.md)
- [`04-coffeemix_all-master-plan.md`](./04-coffeemix_all-master-plan.md)
- [`05-coffeemix_all-workflow.md`](./05-coffeemix_all-workflow.md)
- [`06-coffeemix_all-diagrams.md`](./06-coffeemix_all-diagrams.md)

---

## 2. Why new local skills are needed

The current sandbox already has strong specialist coverage through:

- `cc-review`
- `cc-bughunter`
- `cc-ultraplan`
- `cc-doctor`
- `cc-compact`
- `cc-resume`
- related CoffeeMix agents

The missing layer is reusable discipline that applies across tasks regardless of specialist identity.

The highest-priority missing skills are:

1. **test-driven-development**
2. **verification-before-completion**
3. **systematic-debugging**
4. optional **brainstorming**

---

## 3. Local skill files

### 3.1 Implemented required skill set

#### A. `.opencode/skills/test-driven-development/SKILL.md`

**Role**:
- make test-first or acceptance-first behavior explicit before implementation

**Primary purpose**:
- define a local equivalent of “no production change without a failing check or explicit acceptance target first”

**Best local complements**:
- `enter-plan-mode`
- `cc-ultraplan`
- `cc-review`
- `cc-doctor`

#### B. `.opencode/skills/verification-before-completion/SKILL.md`

**Role**:
- prevent completion claims without fresh evidence

**Primary purpose**:
- formalize the difference between “implemented” and “verified”

**Best local complements**:
- `cc-review`
- `cc-doctor`
- `compact-context`
- evidence docs under `docs/`

#### C. `.opencode/skills/systematic-debugging/SKILL.md`

**Role**:
- make root-cause investigation explicit before non-obvious fixes

**Primary purpose**:
- reinforce and generalize the strengths already present in `cc-bughunter`

**Best local complements**:
- `cc-bughunter`
- `cc-review`
- `cc-doctor`

### 3.2 Optional later skill set

#### D. `.opencode/skills/brainstorming/SKILL.md`

**Role**:
- establish a stronger idea-approval gate before larger design or integration work

**Primary purpose**:
- strengthen `enter-plan-mode` for cases where design exploration should happen before implementation planning

**Best local complements**:
- `enter-plan-mode`
- `cc-ultraplan`
- `metis`

---

## 4. Proposed shared structure for each future skill file

Each `SKILL.md` should follow a common structure to stay consistent with the current sandbox style.

### Recommended template

```md
---
name: <skill-name>
description: <one-line purpose>
compatibility: opencode
---

# <skill-name>

## What this skill does
## When to use
## When NOT to use
## Core rules / gates
## Required workflow
## Evidence expectations
## Anti-patterns
## OMO / CoffeeMix alignment rules
```

### Reason for this structure

- it matches the existing local skill style,
- it separates purpose from enforcement,
- it makes cross-skill overlap easier to control,
- it keeps future rollout readable and reviewable.

---

## 5. Draft content outline per proposed skill

### 5.1 test-driven-development

Should include:

- definition of a red state before change,
- rule that code/config/doc changes need a failing check or explicit acceptance target first,
- examples for code work and docs/config/routing work,
- rule that minimal change should follow the defined target,
- verification reminder after the change.

Must not include:

- project-specific test commands presented as universal,
- promises that every task needs heavyweight testing,
- rules that override OMO specialist routing.

### 5.2 verification-before-completion

Should include:

- rule that evidence must be fresh,
- requirement to separate deliverables from validation,
- docs-only verification expectations,
- code/config verification expectations,
- guidance for reporting unrelated pre-existing issues.

Must not include:

- fake evidence examples represented as real proof,
- assumptions that builds/tests are always available,
- broad debugging guidance better owned by the debugging skill.

### 5.3 systematic-debugging

Should include:

- symptom vs root-cause separation,
- evidence collection before fix proposals,
- escalation after repeated failed attempts,
- relationship to `cc-bughunter`,
- requirement to avoid guess-based fixes.

Must not include:

- code review guidance better owned by `cc-review`,
- completion criteria better owned by the verification skill,
- design planning behavior better owned by plan/brainstorming skills.

### 5.4 brainstorming

Should include:

- when idea-shaping is required before planning,
- question-first behavior,
- explicit approval gates for non-trivial design changes,
- relationship to `enter-plan-mode`.

Must not include:

- implementation workflow details better owned by TDD/verification docs,
- code review procedures,
- final routing policy decisions.

---

## 6. Cross-skill boundaries

To avoid overlap, the future skill set should divide responsibilities like this:

| Skill | Owns | Should not own |
|---|---|---|
| `test-driven-development` | red state before change | final signoff evidence policy |
| `verification-before-completion` | completion evidence gate | root-cause debugging |
| `systematic-debugging` | root-cause-first troubleshooting | general plan approval |
| `brainstorming` | design exploration and approval gate | implementation-phase checks |

---

## 7. Relationship to existing local assets

These future skills should **augment**, not replace, the existing local system.

Examples:

- `systematic-debugging` should strengthen `cc-bughunter`, not replace it.
- `brainstorming` should sit before `enter-plan-mode` or refine its use, not erase it.
- `verification-before-completion` should reinforce `cc-review` and `cc-doctor`, not merge them.
- `test-driven-development` should work with `cc-ultraplan` and existing evidence docs, not become a generic orchestrator.

---

## 8. Current state

Implemented from this design:

- `.opencode/skills/test-driven-development/SKILL.md`
- `.opencode/skills/verification-before-completion/SKILL.md`
- `.opencode/skills/systematic-debugging/SKILL.md`

Still deferred (evaluated and rejected):

- `.opencode/skills/brainstorming/SKILL.md` — see `19-coffeemix_all-brainstorming-evaluation.md`

---

## 9. Non-goals

This document does not:

- claim that the implemented files are already perfect or final,
- approve any routing or config changes,
- or claim that the optional brainstorming skill is required.

---

## 10. Suggested next document

After the implemented skill set is understood, the next planning layer is to document how those skills would eventually be reflected in:

- `AGENTS.md`
- `oh-my-opencode.json`

That proposal is captured in [`08-coffeemix_all-agents-routing-reflections.md`](./08-coffeemix_all-agents-routing-reflections.md).
