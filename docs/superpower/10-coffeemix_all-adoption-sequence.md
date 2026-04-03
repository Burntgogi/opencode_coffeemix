# coffeemix_all Adoption Sequence

**Workspace**: `C:\Work\claude_pickup\opencode_coffeemix_all_sandbox`  
**Status**: active rollout sequence  
**Purpose**: define the rollout order for the coffeemix_all discipline set now that first-wave skill implementation has begun

---

## 1. Authority chain

This sequence is derived from:

- [`04-coffeemix_all-master-plan.md`](./04-coffeemix_all-master-plan.md)
- [`05-coffeemix_all-workflow.md`](./05-coffeemix_all-workflow.md)
- [`07-coffeemix_all-local-skill-drafts.md`](./07-coffeemix_all-local-skill-drafts.md)
- [`08-coffeemix_all-agents-routing-reflections.md`](./08-coffeemix_all-agents-routing-reflections.md)
- [`09-coffeemix_all-evidence-validation-plan.md`](./09-coffeemix_all-evidence-validation-plan.md)

---

## 2. Rollout principle

Adoption should progress from **definition** to **policy alignment** to **evidence proof**.

That means future implementation should not begin with automation or plugin behavior. It should begin with the smallest stable behavior layer that can later be verified.

---

## 3. Proposed future sequence

### Phase 1 —deliver the first-wave local skill set

Implemented in this workspace:

- test-driven-development
- verification-before-completion
- systematic-debugging

Still deferred:

- optional brainstorming

### Phase 2 —validate skill boundaries

Confirm the implemented skills do not conflict with:

- `enter-plan-mode`
- `gb-debug`
- `gb-review`
- `gb-doctor`
- other existing OMO/CoffeeMix primitives

### Phase 3 —reflect stable behavior in authority docs

Only after the implemented skills are stable in real use, consider the proposal areas documented in `08` for:

- `AGENTS.md`
- `oh-my-opencode.json`

### Phase 4 —validate workflow behavior in practice

Use the workflow in `05` and the evidence plan in `09` to confirm the new behavior works on realistic tasks.

### Phase 5 —decide on optional bootstrap reinforcement

Only after the previous phases are proven should the workspace consider:

- bootstrap reminders,
- plugin-level reinforcement,
- stronger routing cues.

---

## 4. Sequence guardrails

Future rollout should not:

- skip from planning directly to automation,
- treat proposal docs as implementation approval,
- change routing authority before skill behavior is stable,
- claim adoption without evidence docs.

---

## 5. Exit criteria by phase

| Phase | Exit criteria |
|---|---|
| 1 | first-wave skills exist and are role-separated |
| 2 | overlap and ambiguity are resolved |
| 3 | authority reflections are justified and minimal |
| 4 | workflow evidence exists for representative tasks |
| 5 | optional automation is proven necessary rather than assumed |

---

## 6. Bottom line

The safest future sequence is:

**skills —boundaries —authority reflection —workflow proof —optional automation**

That keeps coffeemix_all disciplined without destabilizing the existing sandbox foundation.
