# coffeemix_all Final Implementation Proposal

**Workspace**: `C:\Work\claude_pickup\opencode_coffeemix_all_sandbox`  
**Status**: implementation-phase proposal  
**Purpose**: convert the planning set into the concrete first-wave implementation proposal now that execution has begun inside this sandbox

---

## 1. What changed

The documentation set has now moved beyond pure planning:

- the first-wave skill targets were defined in `14`
- the readiness gate was defined in `15`
- the first-wave skills have now been created locally under `.opencode/skills/`
- three sandbox-local pilot evidence docs now show that the skills have been exercised on real local tasks

---

## 2. First-wave implementation contents

Implemented local skills:

- `.opencode/skills/test-driven-development/SKILL.md`
- `.opencode/skills/verification-before-completion/SKILL.md`
- `.opencode/skills/systematic-debugging/SKILL.md`

Still intentionally deferred:

- `.opencode/skills/brainstorming/SKILL.md`
- `AGENTS.md` policy reflection edits
- `oh-my-opencode.json` reflection edits
- plugin/bootstrap automation

---

## 3. Why this is the right first wave

This wave matches the earlier authority chain:

- `01` identified missing discipline rather than missing specialists
- `07` defined the target skill set
- `14` bounded the first implementation wave
- `15` defined the pre-implementation gate

The chosen three skills are the smallest practical discipline layer that can be added without restructuring the workspace.

---

## 4. Immediate next review questions

Before any second wave begins, review:

1. Are the three new skills clearly role-separated?
2. Are their rules realistic for this sandbox?
3. Do they complement existing local assets instead of duplicating them?
4. Is a `brainstorming` skill still necessary after using the three new skills in practice?

---

## 4A. Pilot evidence now available

Follow-up evidence generated after first-wave implementation:

- `evidence-pilot-01-tdd-index-alignment.md`
- `evidence-pilot-02-verification-rollout-proof.md`
- `evidence-pilot-03-debugging-state-alignment.md`

These pilots prove local usefulness, but they do not yet prove that authority files should change.

---

## 5. Scope boundary

This proposal applies only to:

- `C:\Work\claude_pickup\opencode_coffeemix_all_sandbox`

It does not authorize:

- any global OpenCode configuration changes,
- any edits outside this workspace,
- or automatic authority/config reflection.

---

## 6. Bottom line

The planning set is no longer purely speculative. The first-wave discipline layer now exists locally, while authority and automation changes remain intentionally gated.
