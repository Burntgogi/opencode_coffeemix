# Local Design for Superpowers-Style TDD and Verification Discipline

**Workspace**: `C:\Work\claude_pickup\opencode_coffeemix_all_sandbox`  
**Intent**: define a local operating model that brings superpowers-style discipline into this sandbox without changing the control-plane model

---

## 1. Design target

The target is:

> Keep OMO + CoffeeMix orchestration intact, but make execution more disciplined through explicit local gates for planning, testing, debugging, verification, and completion.

This design is based on the current local surfaces:

- `AGENTS.md`
- `oh-my-opencode.json`
- `opencode.json`
- `docs/omo-claudecode-integration-guide.md`
- `.opencode/skills/enter-plan-mode/SKILL.md`
- `.opencode/skills/ask-user-question/SKILL.md`
- `.opencode/skills/compact-context/SKILL.md`
- `.opencode/agents/gb-review.md`
- `.opencode/agents/gb-debug.md`
- `.opencode/agents/gb-doctor.md`
- `.opencode/agents/gb-resume.md`
- `.opencode/agents/gb-memory.md`
- `.opencode/agents/gb-share.md`
- `.opencode/agents/gb-compact.md`
- `.opencode/agents/gb-statusline.md`

---

## 2. Proposed local discipline model

### Rule 1: No non-trivial implementation without an approved plan

Existing base:

- `.opencode/skills/enter-plan-mode/SKILL.md`

Recommended strengthening:

- treat plan mode as mandatory for multi-file, refactor, or ambiguous implementation work,
- require the plan to include exact target files,
- require explicit verification steps before implementation starts,
- require the user to confirm if the task changes system behavior materially.

### Rule 2: No code/config change without a failing check or explicit acceptance target

Local adaptation of superpowers TDD:

- for code changes: write or identify the failing test/check first,
- for config/docs/routing changes: define the failure condition first,
- for sandbox-only work: define acceptance evidence first.

Examples of acceptable ?�red—states in this sandbox:

- a missing routing rule,
- a missing validation document,
- a failed smoke/e2e check,
- a documented gap with no local owner,
- an LSP/build/test failure when applicable.

### Context-specific red-state guide

Because this workspace is primarily docs, config, agent, skill, and plugin metadata rather than a traditional application codebase, ?�red state—must be interpreted by artifact type.

| Artifact type | Red state before change | Expected green state |
|---|---|---|
| Documentation | required doc missing, incomplete, or internally inconsistent | requested doc exists, links resolve, and role is unambiguous |
| Config / routing | required rule or mapping missing, stale, or contradictory | target rule exists and matches the intended local authority |
| Skill spec | required skill file absent or underspecified | skill contract is explicit enough to guide later implementation |
| Plugin / UI marker | visible label/path/registration inconsistent with workspace identity | label/path/registration align with `coffeemix_all` and remain verifiable |

This keeps TDD-like discipline usable even when traditional unit tests are not the primary feedback mechanism.

### Rule 3: No completion claim without fresh verification evidence

Existing local support:

- `docs/omo-claudecode-integration-guide.md` already emphasizes validation and evidence
- `gb-doctor` already frames quick environment/project/config checks
- `gb-review` already provides structured review output

Recommended strengthening:

- every task should end with a short evidence block,
- evidence must be produced after the last change,
- ?�should work—is never enough,
- docs-only tasks must still verify file presence, correctness, and consistency.

### Evidence by workspace artifact type

| Artifact type | Minimum realistic evidence in this sandbox |
|---|---|
| Markdown docs | file exists, headings are coherent, links/filenames match, no stale references remain |
| JSON/config files | file reads cleanly, target keys/values are present, references point to valid local paths |
| Skill/agent specs | role is explicit, overlap is bounded, linked authority docs are correct |
| Launcher/runtime helper files | local path and visible labels point to the correct workspace identity |

### Rule 4: No bug fix without root-cause framing

Existing local support:

- `.opencode/agents/gb-debug.md`

Recommended strengthening:

- use bughunter-style reasoning before the first non-obvious fix,
- after repeated failed attempts, require explicit root-cause notes,
- separate symptom, evidence, root cause, and fix in written outputs.

### Rule 5: No long session without compaction/resume discipline

Existing local support:

- `gb-compact`
- `gb-resume`
- `gb-memory`
- `gb-share`
- `compact-context`

Recommended strengthening:

- long work should preserve intent, plan, completed work, open risks, and restore context,
- ?�done—summaries should identify where evidence lives,
- resumed work should verify current state before continuing old assumptions.

---

## 3. Implemented local assets

The following skills were implemented based on this design:

- `.opencode/skills/test-driven-development/SKILL.md` —- `.opencode/skills/verification-before-completion/SKILL.md` —- `.opencode/skills/systematic-debugging/SKILL.md` —
Deferred after evaluation:

- `.opencode/skills/brainstorming/SKILL.md` —see `19-coffeemix_all-brainstorming-evaluation.md`

### Optional plugin/rule reinforcement

- a local plugin under `.opencode/plugins/` to register or surface these skills,
- or a lighter reminder strategy documented in `AGENTS.md` / docs if plugin enforcement is unnecessary.

No external path is required for this design.

---

## 4. Recommended workflow in this sandbox

### Phase A —intake

1. Read local files, not memory.
2. Decide whether the task is trivial or non-trivial.
3. If non-trivial, enter plan mode.
4. Identify evidence that will prove the task is done.

### Phase B —red state / acceptance target

Before editing files, write down one of:

- failing test,
- failing diagnostic,
- missing document,
- missing routing/ownership rule,
- explicit acceptance checklist.

### Phase C —implementation

1. Make the smallest change that can satisfy the target.
2. Keep OMO as orchestrator and CoffeeMix specialists as execution identities.
3. Use the appropriate specialist when the task clearly matches one.

### Phase D —verification

Verify with the narrowest useful evidence set:

- `read` for file existence/content checks,
- `lsp_diagnostics` for changed code files,
- build/test/smoke commands where applicable,
- structured review where applicable,
- cross-doc consistency checks for documentation work.

### Phase E —completion

Only declare done when all of these are true:

1. requested deliverables exist,
2. evidence has been collected after the final change,
3. open risks are named,
4. unrelated issues are clearly separated from task-specific issues,
5. next-step files are identified if further rollout is needed.

---

## 5. Evidence template for local work

Recommended completion block for future tasks:

```md
## Evidence

- Deliverables: [files created/updated]
- Validation: [checks run]
- Result: [pass / partial / blocked]
- Open risks: [if any]
- Out of scope: [anything intentionally not changed]
```

This matches the spirit of superpowers verification without changing the local control-plane architecture.

---

## 6. Mapping to current local specialists

| Need | Best current local primitive | Why |
|---|---|---|
| Plan-first gate | `enter-plan-mode` | already establishes confirm-before-change behavior |
| Dangerous action confirmation | `ask-user-question` | already covers irreversible operations |
| Root-cause debugging | `gb-debug` | strongest current debugging primitive |
| Review before signoff | `gb-review` | structured code-quality and correctness review |
| Quick system verification | `gb-doctor` | already frames project/config/environment checks |
| Session continuity | `gb-resume`, `gb-memory`, `gb-share`, `gb-compact` | stronger than superpowers in ongoing-session handling |

---

## 7. Main design decision

Do **not** import superpowers as the new operating center.

Instead:

- keep the current local specialist topology,
- add superpowers-style discipline as reusable local skills and rules,
- and optionally add plugin/bootstrap reinforcement only after the discipline files exist.

That sequence minimizes disruption and keeps all work inside this sandbox.
