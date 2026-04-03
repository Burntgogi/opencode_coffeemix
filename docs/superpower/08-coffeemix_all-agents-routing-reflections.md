# Proposed AGENTS and Routing Reflections for Superpower Adoption

**Workspace**: `C:\Work\claude_pickup\opencode_coffeemix_all_sandbox`  
**Status**: proposal only  
**Scope**: document what future reflections may be needed in `AGENTS.md` and `oh-my-opencode.json`, without editing either file

---

## 1. Purpose

This document captures how the future superpower-style discipline layer might need to be reflected in the current routing and configuration authorities.

It is grounded in:

- `AGENTS.md`
- `oh-my-opencode.json`
- [`04-coffeemix_all-master-plan.md`](./04-coffeemix_all-master-plan.md)
- [`05-coffeemix_all-workflow.md`](./05-coffeemix_all-workflow.md)
- [`07-coffeemix_all-local-skill-drafts.md`](./07-coffeemix_all-local-skill-drafts.md)

---

## 2. Current authority summary

### 2.1 `AGENTS.md`

Current role:

- keeps OMO as the control plane,
- prefers `gb-*` specialists for exact-match work,
- treats this workspace as sandbox-only,
- tells the agent to read live sandbox files instead of relying on memory.

### 2.2 `oh-my-opencode.json`

Current role:

- defines local agent availability,
- defines category model routing,
- provides the current local execution matrix for OMO/CoffeeMix.

Neither file currently expresses the missing discipline layer directly.

---

## 3. Proposed reflection areas for `AGENTS.md`

If the future skills from `07` are adopted, `AGENTS.md` may eventually need to reflect that in policy language.

### Reflection area A —stronger discipline-first wording

Potential future reflection:

- planning and discipline skills should be treated as first-class behavioral gates for non-trivial work,
- not merely optional helpers.

Why:

- current local policy is strong on specialist routing,
- weaker on mandatory cross-task discipline.

### Reflection area B —explicit relationship between specialists and discipline skills

Potential future reflection:

- specialists continue to own narrow jobs,
- discipline skills apply across jobs,
- skill gates should not collapse specialist identity.

Why:

- this keeps the CoffeeMix structure intact while improving rigor.

### Reflection area C —stronger evidence-before-completion expectation

Potential future reflection:

- completion language should explicitly require fresh evidence,
- docs/config/runtime work should all produce evidence appropriate to their type.

Why:

- current docs already imply this pattern,
- but the routing policy does not yet foreground it as a system-wide expectation.

### Reflection area D —debugging escalation language

Potential future reflection:

- non-obvious bugs should trigger root-cause-first behavior,
- repeated failed fixes should escalate to stronger diagnosis before more edits.

Why:

- aligns with the intended systematic-debugging layer.

---

## 4. Proposed reflection areas for `oh-my-opencode.json`

This file is the current local model-routing authority, so any future reflection here must remain conservative.

### Reflection area A —ensure future skill-bearing workflows align with current categories

Potential future question:

- are the current categories already sufficient for the proposed discipline layer,
- or should some workflow expectations be documented against categories such as `writing`, `deep`, or `ultrabrain`?

Current answer:

- likely yes for now; the current category matrix already looks sufficient.

### Reflection area B —consider whether any new named agents are actually necessary

Potential future question:

- does adoption require new `gb-*` agents,
- or do the new local skills sit on top of the current agents?

Current answer:

- the current docs suggest **skills first**, not new agents first.

### Reflection area C —consider whether agent descriptions need future alignment

Potential future question:

- if the discipline layer becomes formalized, should some existing agent descriptions later reference that expectation indirectly?

Current answer:

- possibly, but not before the skills and evidence model are stable.

### Reflection area D —optional plugin/bootstrap relationship

Potential future question:

- if a bootstrap plugin is later added, does `oh-my-opencode.json` need a plugin-level reflection or load-path note?

Current answer:

- maybe, but only after the discipline assets are real and validated.

---

## 5. What this document deliberately does not do

This document does **not** provide:

- a literal patch for `AGENTS.md`,
- a literal patch for `oh-my-opencode.json`,
- approved final wording,
- approved model changes,
- approval to implement any reflection yet.

It is a proposal map, not a change set.

---

## 6. Decision boundaries

Before any future real edits are considered, these questions should be answered:

1. Are the proposed discipline skills stable enough to reference as authority?
2. Should the new behavior be enforced primarily by policy text, by skill files, or by later plugin/bootstrap reminders?
3. Does the existing category matrix already support the workflow, or is extra routing guidance needed?
4. Can the evidence model prove that the reflections improved behavior rather than just increasing prompt complexity?

---

## 6A. ADR-style decision record framing

To make later policy changes more traceable, each future reflection should be captured in a lightweight ADR-style record.

### Recommended fields

- **Decision**: what is being reflected
- **Status**: proposed / accepted / rejected / deferred
- **Context**: what problem in the current workspace triggered the reflection
- **Options considered**: what alternatives were evaluated
- **Chosen direction**: what future reflection is preferred
- **Consequences**: what this changes or intentionally does not change

### Why this matters

- it turns `Potential future question` into auditable decision history,
- it reduces ambiguity when multiple later documents reference the same policy choice,
- it keeps authority reflections distinct from implementation work.

---

## 7. Recommended order of future reflection work

If implementation is later approved, the safest sequence would be:

1. stabilize the proposed skill set,
2. stabilize the evidence/validation model,
3. then decide whether `AGENTS.md` needs routing-policy reinforcement,
4. then decide whether `oh-my-opencode.json` needs any reflected alignment,
5. only then consider plugin/bootstrap reinforcement.

---

## 8. Relationship to the rest of the doc set

- `07` defines the proposed future skill layer.
- this document (`08`) defines how that future skill layer might later be reflected in policy/config authorities.
- `09` defines how adoption would later be proven with evidence.

---

## 9. Non-goals

This document is not:

- an implementation approval,
- a routing rewrite,
- a model-change request,
- or a replacement for the current authorities.

---

## 10. Suggested next document

Once the proposed skills and proposed policy/config reflections are clear, the next planning step is to define the evidence package that would prove future adoption actually worked.

That proposal is captured in [`09-coffeemix_all-evidence-validation-plan.md`](./09-coffeemix_all-evidence-validation-plan.md).
