# coffeemix_all Pre-Implementation Change Package

**Workspace**: `C:\Work\claude_pickup\opencode_coffeemix_all_sandbox`  
**Status**: partially executed —first-wave skills implemented, authority rule added
**Purpose**: record the implementation package boundaries and what was actually delivered

---

## 1. Package goal

This package existed to answer one question:

> If actual implementation starts next, what exactly is in scope for the first controlled rollout?

That question has now been answered and the first wave executed.

---

## 2. Proposed package contents

### Package A —skill layer

Implemented files:

- `.opencode/skills/test-driven-development/SKILL.md`
- `.opencode/skills/verification-before-completion/SKILL.md`
- `.opencode/skills/systematic-debugging/SKILL.md`

Optional later addition:

- `.opencode/skills/brainstorming/SKILL.md`

### Package B —authority reflection layer

Evaluation results:

- `AGENTS.md` —minimal discipline rule added —- `oh-my-opencode.json` —no change justified, remains unchanged

### Package C —validation/evidence layer

Evidence docs produced:

- `evidence-pilot-01-tdd-index-alignment.md` —- `evidence-pilot-02-verification-rollout-proof.md` —- `evidence-pilot-03-debugging-state-alignment.md` —- `evidence-large-task-01-state-reconciliation.md` —- `evidence-large-task-02-authority-reflection-decision.md` —- `evidence-routing-expansion.md` —- `evidence-brainstorming-evaluation.md` —- `evidence-final-consolidated-summary.md` —
---

## 3. Explicit first-wave scope

The safest first implementation wave would include only:

1. verification-before-completion
2. test-driven-development
3. systematic-debugging

This follows the review guidance while preserving the current policy/config layer until the skill layer is real.

---

## 4. Out of scope for the first wave

Not in the first wave:

- plugin/bootstrap automation,
- broad routing rewrites,
- new `gb-*` agents,
- final documentation collapse/restructure,
- any work outside this workspace.

---

## 5. Required prerequisites

Before broader implementation continues, confirm:

- the authority docs `01~13` are accepted as the current source of truth,
- the future skill boundaries are stable,
- the evidence model is ready,
- the rollout order in `10` is accepted,
- the readiness gate in `15` passes.

---

## 6. Bottom line

This package defined the smallest implementation surface that could add real discipline without destabilizing coffeemix_all.

That surface has now been delivered:

- 3 discipline skills implemented
- 1 minimal AGENTS.md rule added
- 8 evidence documents produced
- oh-my-opencode.json remains unchanged
