# OMO + Claude Code Integration Guide

**Workspace basis**: `C:\Work\claude_pickup\opencode_coffeemix_all_sandbox`
**Purpose**: Give an agent a concrete, repeatable way to integrate the useful core of Claude Code into OpenCode + OMO without breaking OMO's role as the control plane.

---

## 1. What we already did

We did **not** embed Claude Code as the primary runtime.

Instead, we built a layered integration model:

1. **OpenCode** remains the runtime shell.
2. **OMO** remains the orchestration/control plane.
3. **Claude Code** is treated as a **source of patterns, command ideas, workflow ideas, and prompt behavior**.
4. Those Claude Code ideas are re-expressed as **CoffeeMix agents, skills, rules, and UI markers**.

This approach is already validated in the mix sandbox.

---

## 2. What ?�integration—means here

Integration does **not** mean:
- calling `claw.exe` as the new runtime center,
- replacing OMO with Claude Code,
- chasing 1:1 parity with every Claude Code command/tool.

Integration **does** mean:
- extracting high-value Claude Code workflows,
- re-implementing them as OMO-native `gb-*` specialists,
- letting OMO orchestrate them,
- validating the result in a sandbox before any wider adoption.

---

## 3. The operating model

```text
User request
  -> OMO routing (agents + categories + model selection)
  -> CoffeeMix specialist selection when exact match exists
  -> OpenCode execution path
  -> sandbox validation

Claude Code source is reference-only.
```

### Rule of thumb
- **OMO decides who should act.**
- **CoffeeMix specialists do narrow Claude-derived work.**
- **Claude Code source informs behavior, but does not become the active runtime.**

---

## 4. Current integrated Claude-derived surface

### CoffeeMix agents
- `gb-commit`
- `gb-review`
- `gb-compact`
- `gb-worktree`
- `gb-resume`
- `gb-doctor`
- `gb-memory`
- `gb-config`
- `gb-share`
- `gb-statusline`
- `gb-debug`
- `gb-ultraplan`
- `gb-teleport`
- `gb-plugin`

### CoffeeMix skills
- `enter-plan-mode`
- `ask-user-question`
- `compact-context`
- `tool-search`

### CoffeeMix control rule
`AGENTS.md` in the mix root explicitly tells OMO/Sisyphus to prefer `gb-*` specialists when the task clearly matches them.

---

## 5. How to integrate more Claude Code features

When adding a new Claude-derived capability, follow this sequence exactly.

### 5A. Feature intake record (mandatory before implementation)

Before adding anything, create a short intake record containing:

1. **Claude source behavior** —what exact behavior/pattern is being extracted
2. **User value** —why this is worth having in OMO/OpenCode
3. **OMO-native target** —agent, skill, rule, plugin, or validation asset
4. **Files to touch** —exact runtime/validation files expected
5. **Non-goals** —what this integration will not do
6. **Why existing surface is insufficient** —why current `gb-*`, skills, or rules are not enough

If this record cannot be written clearly, the integration is not ready.

### Step 1 —Identify a real Claude Code pattern
Use source evidence, not branding.

Look for:
- command behavior,
- tool behavior,
- session/state behavior,
- hook/lifecycle behavior,
- UX behavior worth preserving.

Do **not** add a new CoffeeMix agent just because a Claude command name exists.

### Step 2 —Classify the pattern
Pick one:

| Pattern type | Target in OMO/CoffeeMix |
|---|---|
| narrow specialist behavior | `gb-*` agent |
| repeated behavioral rule | skill |
| orchestration preference | `AGENTS.md` rule |
| startup/UI marker | `.opencode/plugins/*` + `tui.json` |
| validation-only behavior | `tools/` + `scenarios/` |

### 5B. Decision rubric (mandatory)

Use this rubric instead of intuition.

| If the Claude pattern is... | Put it in... | Example | Anti-example |
|---|---|---|---|
| a narrow specialist workflow with a stable task boundary | `gb-*` agent | focused code review —`gb-review` | broad orchestration policy |
| a reusable behavioral constraint or response habit | skill | compacting long context —`compact-context` | one-off git operation |
| a routing preference about who should act | `AGENTS.md` | prefer `gb-debug` for root-cause debugging | implementing the debug workflow itself |
| a subtle UI/startup marker | `.opencode/plugins/*` + `tui.json` | CoffeeMix badge on startup | command routing logic |
| test-only verification logic | `tools/` + `scenarios/` | e2e scenario for `gb-share` | production runtime behavior |

Quick yes/no checks:
- **Agent?** Does it own a named specialist job end-to-end?
- **Skill?** Is it mostly guidance rather than identity?
- **Rule?** Is it about orchestration preference, not execution logic?
- **Plugin?** Does it affect UI/presentation rather than control flow?
- **Validation asset?** Is it only for proving behavior?

### Step 3 —Keep OMO as control plane
Before implementing, ask:

> Does this make OMO stronger, or does it make OMO depend on another runtime?

If it makes OMO depend on another runtime, stop.

### Step 4 —Implement in sandbox only
Put runtime-facing files in:
- root: `AGENTS.md`, `opencode.json`, `tui.json`, `oh-my-opencode.json`
- `.opencode/agents/`
- `.opencode/skills/`
- `.opencode/plugins/`

Put support files in:
- `tools/`
- `scenarios/`
- `reports/`

Put retired/failed experiments in:
- `archive/`

### Step 5 —Add routing awareness if needed
If the new specialist exists but OMO/Sisyphus does not prefer it naturally, update `AGENTS.md`.

That rule layer is what closes the gap between:
- config loaded,
- feature exists,
- orchestrator actually choosing it.

### 5C. Authority / precedence rules

When files disagree, use this precedence order:

1. **Live runtime config**
   - `opencode.json`
   - `oh-my-opencode.json`
   - `tui.json`
   - `.opencode/agents/*`
   - `.opencode/skills/*`
   - `.opencode/plugins/*`
2. **Routing instructions**
   - `AGENTS.md`
3. **Validation evidence**
   - `reports/*`
   - `docs/evidence-*.md`
4. **Planning docs / historical docs**
   - roadmap and plan documents

If a plan doc conflicts with live config, the live config wins.

### Step 6 —Validate with both smoke and stricter e2e
Every new capability should be tested in two layers:

1. **Smoke** —lightweight sanity check
2. **Stricter E2E** —explicit scenario validation

Do not claim integration is complete without both.

### 5D. Routing validation rules

Smoke/e2e must not only prove that a specialist can answer.
They should also prove that OMO can prefer the right specialist.

Use both:

#### Positive routing test
A task description that should naturally map to the specialist.

Example:
- ?�Which specialist should handle focused code review—?-> `gb-review`

#### Negative routing test
A nearby but broader task that should stay with baseline orchestration.

Example:
- ?�How should we reorganize the whole migration strategy—?should not blindly force `gb-review`

If only direct identity prompts (`You are gb-review`) are tested, routing is not actually proven.

---

## 6. Directory responsibility map

### Runtime surface
These files define what actually runs:
- `AGENTS.md`
- `opencode.json`
- `oh-my-opencode.json`
- `tui.json`
- `.opencode/agents/`
- `.opencode/skills/`
- `.opencode/plugins/`
- `.opencode/package.json`

### Validation surface
These files prove behavior:
- `tools/`
- `scenarios/`
- `reports/`

### Archive/history surface
These preserve past experiments only:
- `archive/`

Never mix these responsibilities casually.

---

## 7. What to avoid

Do not:
- make Claude Code runtime the center,
- rely on memory instead of reading sandbox files,
- put validation artifacts into runtime directories,
- copy every historical file into the new sandbox,
- treat stale docs as source of truth over live config,
- solve orchestration gaps by adding more specialists before fixing routing rules.

---

## 8. Acceptance criteria for future integration work

A Claude-derived feature is integrated only if:

1. its purpose is clear,
2. it is implemented in the correct surface,
3. OMO can choose it appropriately,
4. smoke validation passes,
5. stricter e2e validation passes,
6. evidence is written under `docs/`.

These must be measurable:

- **Purpose clear** = the intake record is complete
- **Correct surface** = file placement matches the decision rubric
- **OMO chooses it appropriately** = at least one positive routing test passes
- **Smoke passes** = basic runtime scenario passes
- **Stricter e2e passes** = scenario validation passes with explicit criteria
- **Evidence written** = at least one new `docs/evidence-*.md` entry exists

---

## 9. Practical checklist for an agent

When asked to integrate another Claude Code core feature, follow this checklist:

1. Read the live mix runtime files.
2. Identify the Claude pattern to extract.
3. Decide: agent, skill, rule, plugin, or validation asset.
4. Implement only in the sandbox.
5. Update `AGENTS.md` if orchestration preference must change.
6. Add or update a scenario.
7. Run smoke/e2e validation.
8. Write evidence.

If any of those steps is missing, the work is not complete.

### 9A. Coverage matrix (keep updated)

Track integrated surfaces explicitly.

| Capability | Type | Implemented | Smoke | E2E | Routing-aware | Evidence |
|---|---|---:|---:|---:|---:|---:|
| gb-commit | agent | yes | yes | yes | partial | yes |
| gb-review | agent | yes | yes | yes | partial | yes |
| gb-compact | agent | yes | prior | prior | no | yes |
| gb-worktree | agent | yes | prior | prior | no | yes |
| gb-resume | agent | yes | prior | prior | no | yes |
| gb-doctor | agent | yes | prior | prior | no | yes |
| gb-memory | agent | yes | no | yes | no | yes |
| gb-config | agent | yes | no | yes | no | yes |
| gb-share | agent | yes | yes | yes | no | yes |
| gb-statusline | agent | yes | yes | yes | no | yes |
| gb-debug | agent | yes | no | yes | partial | yes |
| gb-ultraplan | agent | yes | no | yes | partial | yes |
| gb-teleport | agent | yes | no | yes | no | yes |
| gb-plugin | agent | yes | no | yes | no | yes |
| enter-plan-mode | skill | yes | n/a | indirect | n/a | yes |
| ask-user-question | skill | yes | n/a | indirect | n/a | yes |
| compact-context | skill | yes | n/a | indirect | n/a | yes |
| tool-search | skill | yes | n/a | indirect | n/a | yes |

`partial` means routing preference is evidenced in some prompts/rules but not yet fully covered by dedicated routing tests.

---

## 10. Current status

The mix sandbox has already proven:
- CoffeeMix specialists can exist inside an upstream-style local layout,
- OMO can be taught to prefer them,
- startup customization can remain subtle,
- smoke and stricter e2e can validate the integrated surface.

That means the integration model is no longer hypothetical. It is operational.
