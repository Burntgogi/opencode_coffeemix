# Brainstorming Skill Need Evaluation

**Workspace**: `C:\Work\claude_pickup\opencode_coffeemix_all_sandbox`
**Status**: evaluation complete — decision: do not add
**Purpose**: determine whether a `brainstorming` skill is necessary given existing local coverage

---

## 1. What brainstorming would add

From the original superpowers-derived design in `07`, brainstorming was proposed to:

- establish a stronger idea-approval gate before larger design or integration work
- strengthen `enter-plan-mode` for cases where design exploration should happen before implementation planning
- complement `cc-ultraplan` and `metis`

## 2. Existing local coverage

### `enter-plan-mode`
- already forces planning before implementation
- already proposes approach and gets user confirmation
- already handles multi-step and cross-module changes

### `cc-ultraplan`
- already handles phased architecture planning
- already produces ordering, dependencies, and risk analysis

### `metis` (baseline OMO agent)
- already owns "request interpretation and strategic framing"
- already handles ambiguous or complex requests before coding

### AGENTS.md routing
- already routes ambiguous requests to `metis`
- already routes multi-step work to planning
- already routes architecture work to `cc-ultraplan`

## 3. Gap analysis

| Brainstorming intent | Existing local owner | Coverage quality |
|---|---|---|
| Idea generation before planning | `metis` | adequate — metis already frames ambiguous requests |
| Design approval gate | `enter-plan-mode` | adequate — already requires confirmation before file changes |
| Phased architecture exploration | `cc-ultraplan` | strong — dedicated planning specialist |
| Question-first behavior | `enter-plan-mode` + `metis` | adequate — both already ask clarifying questions |

## 4. Overlap risk

Adding brainstorming would create three-way overlap with:

- `metis` (strategic framing)
- `enter-plan-mode` (plan-before-change gate)
- `cc-ultraplan` (phased planning)

This overlap would increase prompt complexity without proven necessity.

## 5. Decision

**Do not add `brainstorming` skill.**

Reasons:

1. The existing local system already covers all brainstorming intents through `metis`, `enter-plan-mode`, and `cc-ultraplan`
2. Adding it would create measurable overlap with three existing primitives
3. No real task during this rollout phase demonstrated a gap that only brainstorming could fill
4. The sandbox's current workload (docs, config, skills, routing) does not require a separate idea-generation gate

## 6. When brainstorming might become necessary

Revisit this decision only if:

- repeated real tasks show that `metis` + `enter-plan-mode` together still miss important design alternatives
- the sandbox workload shifts toward heavy product design or architecture exploration beyond current scope
- users explicitly request structured idea-generation sessions that the current tools cannot provide

## 7. Scope boundary

This evaluation is limited to the local sandbox workspace. It does not authorize or forbid brainstorming in other contexts.

---

## Bottom line

The current local system already has sufficient coverage for idea exploration and design approval. Adding brainstorming would increase complexity without proven benefit.
