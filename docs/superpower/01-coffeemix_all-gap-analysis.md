# Superpowers Gap Analysis for Local OMO/CoffeeMix Sandbox

**Workspace**: `C:\Work\claude_pickup\opencode_coffeemix_all_sandbox`  
**Scope**: documentation and local design only  
**Out of scope**: changing runtime/config/plugins/agents/skills outside this workspace

---

## 1. Goal

Compare the superpowers discipline model against the current sandbox so future implementation work can be targeted at the real gaps rather than re-documenting capabilities that already exist.

This analysis is grounded in these local files:

- `AGENTS.md`
- `oh-my-opencode.json`
- `opencode.json`
- `tui.json`
- `.opencode/agents/cc-*.md`
- `.opencode/skills/*/SKILL.md`
- `.opencode/plugins/coffeemix_all-badge.tsx`
- `docs/omo-claudecode-integration-guide.md`

And these superpowers source areas gathered during comparison:

- `.opencode/plugins/superpowers.js`
- `skills/test-driven-development/SKILL.md`
- `skills/verification-before-completion/SKILL.md`
- `skills/systematic-debugging/SKILL.md`
- `skills/brainstorming/SKILL.md`
- `skills/writing-plans/SKILL.md`
- `skills/subagent-driven-development/SKILL.md`
- `skills/using-git-worktrees/SKILL.md`
- `skills/requesting-code-review/SKILL.md`
- `hooks/hooks.json`
- `hooks/session-start`

---

## 2. Current local baseline

The sandbox already has a strong orchestration layer:

- `AGENTS.md` keeps **OMO as control plane** and prefers exact-match CoffeeMix specialists.
- `oh-my-opencode.json` defines a broad set of **agents** and **model-routed categories**.
- `opencode.json` loads the `oh-my-opencode` plugin and defines provider/model routing.
- `tui.json` wires a local CoffeeMix badge plugin.
- `.opencode/agents/` contains specialist roles such as review, bug hunting, planning, config inspection, memory, resume, worktree, and plugin management.
- `.opencode/skills/enter-plan-mode/SKILL.md` already introduces a plan-before-change gate for multi-step work.
- `docs/omo-claudecode-integration-guide.md` already states that Claude-derived behavior should be re-expressed as OMO-native agents, skills, rules, and UI markers.

So the local system is **not missing orchestration**. It is mostly missing **enforced discipline primitives**.

---

## 3. What superpowers adds conceptually

Superpowers is strongest in four areas:

1. **Hard-gated workflow discipline**
   - TDD first
   - verification before completion
   - debugging by root-cause process
   - design approval before implementation

2. **Automatic bootstrap behavior**
   - plugin-level skill registration
   - startup/session injection via hook or message transform

3. **Plan granularity and review loops**
   - very small tasks
   - explicit success criteria
   - staged review before declaring completion

4. **Codified "Iron Laws"**
   - rules phrased as stop conditions, not soft suggestions

---

## 4. Gap matrix

| Capability | Superpowers state | Local sandbox state | Gap level | Notes |
|---|---|---|---|---|
| Orchestrated specialist routing | Present | Present | Low | `AGENTS.md` + `oh-my-opencode.json` already strong here |
| Plan-before-change gate | Hard-gated via brainstorming/writing-plans | Present but lighter | Medium | `enter-plan-mode` exists, but does not equal full brainstorming + tiny-task planning system |
| TDD enforcement | Explicit Iron Law | Missing as dedicated local skill | High | No local TDD skill or equivalent hard rule file |
| Verification-before-completion | Explicit Iron Law | Partial | High | Evidence culture exists in docs, but no dedicated completion-verification skill |
| Systematic debugging | Explicit root-cause skill | Partial | Medium | `cc-bughunter` is strong, but there is no reusable local debugging skill/gate |
| Automatic bootstrap injection | Plugin + hook implementation | Missing | High | Local sandbox loads `oh-my-opencode` only; no local superpowers-like bootstrap plugin |
| Review loop after task completion | Present via review-oriented skills/agents | Partial | Medium | `cc-review` exists, but not wired as a mandatory stage after each task |
| Worktree discipline | Present as skill | Partial | Medium | `cc-worktree` exists, but lacks superpowers-style safety choreography |
| Session compaction / resume / handoff | Present | Present | Low | Local CoffeeMix is stronger here via `cc-compact`, `cc-resume`, `cc-memory`, `cc-share` |
| Config/plugin inspection | Limited | Present | Low | Local CoffeeMix has richer operational specialists like `cc-config`, `cc-plugin`, `cc-doctor` |

---

## 5. What should be imported vs. preserved

### Import from superpowers

These are the highest-value concepts to port into this sandbox:

1. **TDD discipline as a local skill**
2. **Verification-before-completion as a local skill**
3. **Systematic debugging as a local skill or stricter bughunter policy**
4. **Brainstorm/design approval hard gate for non-trivial changes**
5. **Finer-grained planning language for task decomposition**
6. **Optional bootstrap/plugin mechanism to load and remind these rules early**

### Preserve from current OMO/CoffeeMix

These local strengths should remain primary:

1. **OMO as the control plane** from `AGENTS.md`
2. **CoffeeMix specialist routing** instead of forcing a superpowers-native runtime model
3. **Existing operational specialists** (`cc-doctor`, `cc-config`, `cc-memory`, `cc-resume`, `cc-share`, `cc-compact`)
4. **Model/category routing** from `oh-my-opencode.json`
5. **Local sandbox-first validation pattern** already documented in `docs/omo-claudecode-integration-guide.md`

---

## 6. Recommended priority order

### Priority 1: discipline files

Add local equivalents for:

- TDD
- verification-before-completion
- systematic-debugging

These close the largest behavioral gaps with the least architectural change.

### Priority 2: stronger planning gate

Extend the current `enter-plan-mode` concept so non-trivial work must explicitly pass through:

- design clarification
- file-level plan
- objective verification plan

### Priority 3: lifecycle/bootstrap integration

Only after the discipline content exists locally, decide whether to add:

- a local plugin that registers new skills,
- a startup bootstrap reminder,
- or a lighter docs-only reminder pattern.

### Priority 4: mandatory review sequencing

Define when `cc-review`, `cc-bughunter`, and `cc-worktree` should be mandatory stages rather than optional specialists.

---

## 7. Non-goals

This sandbox should **not**:

- replace OMO with superpowers,
- depend on files outside this workspace,
- chase 1:1 parity with every superpowers artifact,
- copy external hooks/plugins blindly without adapting to local routing rules,
- weaken CoffeeMix specialist identity in favor of a generic workflow-only layer.

---

## 8. Bottom line

The local sandbox is already ahead of superpowers in **specialist breadth and operational orchestration**.

The missing piece is not more agents; it is **harder discipline**:

- test-first behavior,
- evidence-first completion,
- root-cause-first debugging,
- and earlier workflow gating.

That makes the next implementation step clear: add superpowers-style discipline **on top of** OMO/CoffeeMix, not **instead of** it.
