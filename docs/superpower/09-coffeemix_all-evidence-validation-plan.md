# Proposed Evidence and Validation Plan for Future Superpower Adoption

**Workspace**: `C:\Work\claude_pickup\opencode_coffeemix_all_sandbox`  
**Status**: partially activated plan  
**Scope**: define the evidence and validation document set needed to prove broader adoption, while acknowledging that the first-wave skills now exist locally

---

## 1. Purpose

This document defines the future evidence model for superpower-style adoption in this sandbox.

It answers:

- what would need to be proven,
- which evidence docs should exist,
- what each evidence doc should contain,
- how those docs relate to the current workflow and master plan.

---

## 2. Authority chain

This proposal is based on:

- [`02-coffeemix_all-tdd-verification-discipline.md`](./02-coffeemix_all-tdd-verification-discipline.md)
- [`04-coffeemix_all-master-plan.md`](./04-coffeemix_all-master-plan.md)
- [`05-coffeemix_all-workflow.md`](./05-coffeemix_all-workflow.md)
- [`06-coffeemix_all-diagrams.md`](./06-coffeemix_all-diagrams.md)
- [`07-coffeemix_all-local-skill-drafts.md`](./07-coffeemix_all-local-skill-drafts.md)
- [`08-coffeemix_all-agents-routing-reflections.md`](./08-coffeemix_all-agents-routing-reflections.md)

---

## 3. What future adoption must prove

Now that the first-wave skills exist locally, the remaining evidence set should prove at least five things:

1. the new local skills exist and are internally coherent,
2. the new skill layer fits the current OMO/CoffeeMix topology,
3. routing/policy reflections did not break the control-plane model,
4. the workflow can be followed in real tasks,
5. completion claims are backed by fresh evidence rather than assumption.

---

## 4. Proposed future evidence docs

These files remain future evidence artifacts for broader adoption, not current deliverables.

### A. `docs/superpower/evidence-skill-drafts-review.md`

**What it would prove**:
- the implemented skill files match the design intent from `07`

**Should contain**:
- reviewed skill file list,
- role-by-role summary,
- overlap/gap findings,
- pass/partial/block conclusion.

### B. `docs/superpower/evidence-routing-reflection-review.md`

**What it would prove**:
- any later changes to `AGENTS.md` or `oh-my-opencode.json` match the proposal intent from `08`

**Should contain**:
- changed authority files,
- reflection goals,
- unintended side effects check,
- conclusion on whether control-plane integrity was preserved.

### C. `docs/superpower/evidence-workflow-adoption.md`

**What it would prove**:
- the future workflow from `05` can be followed in realistic sandbox tasks

**Should contain**:
- sample task set,
- stage-by-stage walkthrough,
- where evidence was produced,
- blockers or drift from the planned workflow.

### D. `docs/superpower/evidence-validation-checklist.md`

**What it would prove**:
- all minimum adoption checks were run consistently

**Should contain**:
- checklist of required checks,
- per-check pass/fail state,
- evidence links,
- open risks and deferred items.

### E. `docs/superpower/evidence-adoption-summary.md`

**What it would prove**:
- the full adoption state can be summarized clearly for later review

**Should contain**:
- what was adopted,
- what remains proposed only,
- final evidence links,
- recommended next steps.

---

## 5. Minimum validation sequence

For broader adoption beyond the first implemented skills, the minimum evidence sequence should look like this:

1. verify the skill layer against `07`,
2. verify the policy/config reflection layer against `08`,
3. verify a workflow execution sample against `05`,
4. collect a consolidated validation checklist,
5. publish one adoption summary.

This creates a progression from **implemented assets** to **behavior proof** to **roll-up summary**.

---

## 6. Relationship to the existing workflow model

The future evidence pack should map directly onto the workflow from `05`:

| Workflow stage | Evidence expectation |
|---|---|
| Intake | authority files and scope are identified |
| Planning gate | plan and target evidence are recorded |
| Red state | missing or failing condition is recorded |
| Smallest useful change | touched files and boundaries are recorded |
| Verification | fresh proof is collected |
| Completion / handoff | summary and open risks are recorded |

---

## 7. Maintenance rules for future evidence docs

Future evidence docs should:

- cite the authority docs they validate,
- distinguish proposal vs actual implementation state,
- avoid mixing evidence with planning rationale,
- stay workspace-local,
- be updated when adoption scope changes.

---

## 7A. Adoption readiness checklist

This checklist exists to prevent the evidence plan from remaining purely self-referential.

- [ ] `test-driven-development` skill spec is finalized enough for implementation
- [ ] `verification-before-completion` skill spec is finalized enough for implementation
- [ ] `systematic-debugging` skill spec is finalized enough for implementation
- [ ] at least one realistic task is mapped against workflow stages A~F
- [ ] expected evidence outputs for that task are explicitly named
- [ ] `AGENTS.md` reflection decision is documented
- [ ] `oh-my-opencode.json` reflection decision is documented
- [ ] future implementation package boundaries are documented
- [ ] proposal docs and evidence docs are clearly separated

---

## 8. Non-goals

This document does not:

- claim that any evidence already exists,
- fabricate future validation results,
- approve implementation,
- replace the authority docs that define behavior.

---

## 9. Bottom line

If the sandbox later adopts superpower-style discipline, it should not be considered real until a matching evidence pack proves it.

That evidence pack should be:

- local,
- staged,
- easy to audit,
- and clearly tied back to `05`, `07`, and `08`.
