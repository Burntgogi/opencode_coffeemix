# coffeemix_all Authoring Checklists

**Workspace**: `C:\Work\claude_pickup\opencode_coffeemix_all_sandbox`  
**Status**: planning only  
**Purpose**: provide concise checklists for future documentation and implementation-authoring work derived from the coffeemix_all doc set

---

## 1. Future skill-authoring checklist

Before drafting any future `.opencode/skills/*/SKILL.md` file, confirm:

- the skill exists in `07`
- its role is distinct from existing agents/skills
- its “when to use” and “when not to use” sections are explicit
- its evidence expectations are defined
- its boundary against intake, readiness, and status-reporting language is explicit when relevant
- it does not override OMO as control plane

---

## 2. Future authority-reflection checklist

Before proposing real edits to `AGENTS.md` or `oh-my-opencode.json`, confirm:

- the relevant behavior is already stable in the planned skill layer
- the reflection is minimal and justified
- the proposal preserves specialist routing
- the proposal stays workspace-local
- an evidence plan exists to validate the reflection later

---

## 3. Future evidence-doc checklist

Before creating any adoption evidence doc, confirm:

- it validates a specific authority doc
- it distinguishes proposal from actual implementation
- it contains fresh evidence rather than restated intent
- it records pass/partial/block clearly
- it does not treat readiness or status notes as if they were verification proof
- it names open risks or deferred items

---

## 4. Future workflow-check checklist

Before claiming that the new workflow has been adopted, confirm:

- intake was grounded in live local files
- a plan existed before non-trivial work
- a red state or acceptance target was defined
- the smallest useful change was used
- readiness language was kept separate from completion language
- verification happened after the last change
- completion was backed by evidence and boundaries

---

## 5. Future scenario-authoring checklist

Before adding or revising a task-based scenario, confirm:

- the prompt tests one primary behavior shape rather than several blurred together
- intake scenarios reward authority grounding and scope control
- review scenarios reward the right critique lens, not generic approval
- readiness scenarios distinguish go/no-go judgment from post-change proof
- share/status scenarios keep completed, verified, and open fields distinct
- `must_include` and `must_exclude` strings reinforce the intended boundary without overconstraining style

---

## 6. Bottom line

These checklists are the shortest path from the current planning set to future implementation-quality documentation.
