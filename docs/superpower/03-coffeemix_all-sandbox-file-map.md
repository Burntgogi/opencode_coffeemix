# Superpowers-to-Sandbox File Map

**Workspace root**: `C:\Work\claude_pickup\opencode_coffeemix_all_sandbox`  
**Purpose**: map superpowers-style capabilities to exact local files to keep, reference, or extend later

---

## 1. File-state legend

- **Keep**: already fits the target model
- **Reference**: not changed now, but should inform future rollout
- **Later add**: likely future local file to create inside this workspace
- **Later refine**: existing local file that may need stronger wording later

---

## 2. Root config and policy map

| Local file | State | Role in rollout |
|---|---|---|
| `AGENTS.md` | Reference / later refine | Keeps OMO as control plane and prefers `cc-*` specialists; future place to reinforce discipline-routing expectations |
| `oh-my-opencode.json` | Keep | Agent and category model bindings; should remain the central routing/model matrix |
| `opencode.json` | Keep | Runtime plugin/provider config; current proof that local plugin loading is workspace-scoped |
| `tui.json` | Keep | UI/plugin surface; shows where lightweight presentation or reminder plugins can be wired |

---

## 3. Existing local agents mapped to superpowers-style needs

| Local file | State | Capability covered |
|---|---|---|
| `.opencode/agents/cc-review.md` | Keep | review loop / correctness / security / maintainability |
| `.opencode/agents/cc-bughunter.md` | Keep | root-cause debugging behavior |
| `.opencode/agents/cc-ultraplan.md` | Keep | multi-phase planning |
| `.opencode/agents/cc-worktree.md` | Reference / later refine | worktree operations, but not yet superpowers-level safety choreography |
| `.opencode/agents/cc-commit.md` | Keep | atomic docs/code commit guidance |
| `.opencode/agents/cc-doctor.md` | Keep | health checks and readiness verification |
| `.opencode/agents/cc-config.md` | Keep | config review / effective settings inspection |
| `.opencode/agents/cc-plugin.md` | Keep | plugin evaluation and compatibility work |
| `.opencode/agents/cc-compact.md` | Keep | context compaction discipline |
| `.opencode/agents/cc-resume.md` | Keep | resume-from-interrupted-work discipline |
| `.opencode/agents/cc-memory.md` | Keep | durable context extraction |
| `.opencode/agents/cc-share.md` | Keep | handoff/share summary generation |
| `.opencode/agents/cc-statusline.md` | Keep | active-context/status summarization |
| `.opencode/agents/cc-teleport.md` | Keep | context switching between work areas |

---

## 4. Existing local skills mapped to superpowers-style needs

| Local file | State | Capability covered |
|---|---|---|
| `.opencode/skills/enter-plan-mode/SKILL.md` | Keep / later refine | strongest current analogue to brainstorming + plan-before-change |
| `.opencode/skills/ask-user-question/SKILL.md` | Keep | explicit confirmation gate for irreversible actions |
| `.opencode/skills/compact-context/SKILL.md` | Keep | long-session continuity discipline |
| `.opencode/skills/tool-search/SKILL.md` | Keep | tool-choice discipline |

Current state: all three discipline skills are now implemented under `.opencode/skills/`.

---

## 5. Local plugin and docs surfaces

| Local file | State | Role in rollout |
|---|---|---|
| `.opencode/plugins/coffeemix_all-badge.tsx` | Keep | proof that workspace-local plugin/UI customization already exists |
| `docs/omo-claudecode-integration-guide.md` | Reference | current authority on how Claude-derived behavior should be adapted locally |
| `docs/routing-validation-plan.md` | Reference | useful model for future discipline-routing validation |
| `docs/evidence-routing-validation.md` | Reference | evidence pattern for proving routing actually works |
| `docs/evidence-*.md` | Reference | existing evidence-first documentation style already present in the sandbox |

---

## 6. Capability crosswalk

| Desired capability | Superpowers source concept | Best current local owner | Future local asset |
|---|---|---|---|
| Design approval gate | `brainstorming` | `enter-plan-mode` | stronger wording in plan skill or new brainstorming skill |
| Tiny-task planning | `writing-plans` | `cc-ultraplan` + `enter-plan-mode` | planning rubric update |
| TDD enforcement | `test-driven-development` | `.opencode/skills/test-driven-development/SKILL.md` | refine based on real sandbox use |
| Verification-before-completion | `verification-before-completion` | `.opencode/skills/verification-before-completion/SKILL.md` | refine evidence language after real task usage |
| Root-cause debugging gate | `systematic-debugging` | `.opencode/skills/systematic-debugging/SKILL.md` + `cc-bughunter` | tune boundary between reusable skill and specialist workflow |
| Review sequencing | `requesting-code-review` / `code-reviewer` | `cc-review` | routing/policy update in `AGENTS.md` or docs |
| Worktree safety choreography | `using-git-worktrees` | `cc-worktree` | refinement of worktree rules |
| Startup/bootstrap reminder | hook + plugin | none direct | optional local plugin under `.opencode/plugins/` |

---

## 7. Proposed future additions inside this workspace

These are the most likely local files in the rollout lifecycle:

### Skills

- `.opencode/skills/test-driven-development/SKILL.md` ✅ implemented
- `.opencode/skills/verification-before-completion/SKILL.md` ✅ implemented
- `.opencode/skills/systematic-debugging/SKILL.md` ✅ implemented
- optional later addition: `.opencode/skills/brainstorming/SKILL.md`

### Documentation

- `docs/superpower/04-coffeemix_all-master-plan.md`
- `docs/superpower/05-coffeemix_all-workflow.md`
- `docs/superpower/06-coffeemix_all-diagrams.md`
- `docs/superpower/evidence-*.md` for later proof of adoption

### Optional plugin surface

- `.opencode/plugins/superpower-bootstrap.*`

Only create that plugin after the skill set exists and the reminder behavior is clearly defined.

---

## 8. Current implementation boundary

The sandbox is no longer in documentation-only mode.

Current implemented additions:

- `.opencode/skills/test-driven-development/SKILL.md`
- `.opencode/skills/verification-before-completion/SKILL.md`
- `.opencode/skills/systematic-debugging/SKILL.md`

Files that should still remain unchanged unless later evidence justifies updates:

- `AGENTS.md`
- `oh-my-opencode.json`
- `opencode.json`
- `tui.json`
- existing `.opencode/agents/*`
- existing `.opencode/plugins/*`

This keeps the current implementation wave fully inside the sandbox while deferring authority/config reflection.

---

## 9. Bottom line

The most useful rollout pattern is:

1. keep existing local routing and specialist topology,
2. add missing discipline skills locally,
3. optionally reinforce them with routing/plugin reminders,
4. validate with the same evidence-first style already used in this sandbox.

That gives this workspace superpowers-like rigor without discarding CoffeeMix’s stronger specialist structure.
