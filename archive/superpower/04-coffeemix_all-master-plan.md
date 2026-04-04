# Superpowers Integration Master Plan for the Local OMO/CoffeeMix Sandbox

**Workspace**: `C:\Work\claude_pickup\opencode_coffeemix_all_sandbox`  
**Scope**: documentation-only master plan inside this workspace  
**Purpose**: unify the findings of `01`, `02`, and `03` into one planning document that defines the rollout direction, derived workflow, and diagram set

---

## 1. Why this document exists

The existing superpower docs already answer three different questions:

- `01-coffeemix_all-gap-analysis.md` explains **what is missing**.
- `02-coffeemix_all-tdd-verification-discipline.md` explains **how disciplined execution should work**.
- `03-coffeemix_all-sandbox-file-map.md` explains **where those behaviors belong in the local sandbox**.

This document exists to combine those three perspectives into one master plan so future work can start from a single source of intent.

---

## 2. Source documents and their roles

### Upstream analysis set

1. [`01-coffeemix_all-gap-analysis.md`](./01-coffeemix_all-gap-analysis.md)
   - identifies the behavioral gap between superpowers and the local sandbox
   - concludes that the main missing layer is **discipline**, not more specialists

2. [`02-coffeemix_all-tdd-verification-discipline.md`](./02-coffeemix_all-tdd-verification-discipline.md)
   - defines the target local operating model
   - frames planning, red-state definition, verification, debugging, and completion as explicit gates

3. [`03-coffeemix_all-sandbox-file-map.md`](./03-coffeemix_all-sandbox-file-map.md)
   - maps desired capabilities to local files to keep, refine, or add later
   - makes future rollout local to this workspace

### Derived documentation set

4. [`05-coffeemix_all-workflow.md`](./05-coffeemix_all-workflow.md)
   - translates this master plan into an operational sequence

5. [`06-coffeemix_all-diagrams.md`](./06-coffeemix_all-diagrams.md)
   - provides fast visual orientation for the document set and rollout model

---

## 3. Consolidated target model

The target model is:

> Keep OMO as the control plane, keep CoffeeMix specialists as the execution topology, and layer superpowers-style discipline on top through local skills, rules, evidence requirements, and optional bootstrap reminders.

This means the local sandbox should evolve toward:

1. **harder planning gates** for non-trivial work,
2. **TDD-like acceptance discipline** before changes,
3. **fresh verification evidence** before completion claims,
4. **root-cause debugging discipline** before non-obvious fixes,
5. **structured review and handoff** during longer work,
6. **workspace-local implementation only**.

---

## 4. Strategic decisions

### Decision 1: preserve the current control plane

The sandbox should continue to follow:

- `AGENTS.md` for orchestration preference,
- `oh-my-opencode.json` for agent/category model routing,
- local `.opencode/agents/*` and `.opencode/skills/*` for behavior.

Superpowers should be treated as a source of discipline patterns, not a replacement runtime.

### Decision 2: add discipline before adding automation

The rollout should not begin with a plugin or startup hook.

Instead, the first real additions should be local discipline assets such as:

- TDD guidance,
- verification-before-completion guidance,
- systematic debugging guidance,
- optional stronger planning/brainstorming guidance.

Only after those exist should the sandbox consider reminder or bootstrap automation.

### Decision 3: keep all rollout work local to this repo

Every future asset should live under one of these local surfaces:

- root config/policy files,
- `.opencode/agents/`,
- `.opencode/skills/`,
- `.opencode/plugins/`,
- `docs/superpower/`.

No part of the plan requires work outside `C:\Work\claude_pickup\opencode_coffeemix_all_sandbox`.

---

## 5. Rollout phases

### Phase 1 — establish documentation authority

Use the existing `01`-`03` docs plus this master plan as the authoritative design set.

**Outcome**:
- one shared understanding of why the integration is needed,
- one shared definition of the local discipline model,
- one shared file map for later implementation.

### Phase 2 — define the operational workflow

Use [`05-coffeemix_all-workflow.md`](./05-coffeemix_all-workflow.md) to convert strategy into repeatable stages:

- intake,
- planning,
- red-state definition,
- smallest useful change,
- verification,
- completion and handoff.

**Outcome**:
- future implementation work can be executed consistently instead of ad hoc.

### Phase 3 — define the visual reference set

Use [`06-coffeemix_all-diagrams.md`](./06-coffeemix_all-diagrams.md) to create diagram-level orientation for:

- document relationships,
- workflow stages,
- capability-to-file mapping.

**Outcome**:
- the plan becomes easier to communicate, validate, and maintain.

### Phase 4 — implementation of first-wave local discipline assets

This phase has now started inside the sandbox.

Implemented in the first wave:

- `.opencode/skills/test-driven-development/SKILL.md`
- `.opencode/skills/verification-before-completion/SKILL.md`
- `.opencode/skills/systematic-debugging/SKILL.md`

Still later-facing:

- optional `.opencode/skills/brainstorming/SKILL.md`
- optional local bootstrap plugin under `.opencode/plugins/`

---

## 6. Priority order

From the earlier gap analysis and file map, the best priority order is:

1. **discipline skills**
2. **stronger planning/approval language**
3. **review sequencing and evidence expectations**
4. **optional plugin/bootstrap reinforcement**

This ordering preserves the existing local specialist model while adding rigor where it is currently weakest.

---

## 7. Guardrails

The rollout must not:

- replace OMO as the control plane,
- collapse CoffeeMix specialists into a generic workflow layer,
- depend on global or external configuration,
- copy superpowers 1:1 without adapting it to local routing,
- claim completion without file-level and evidence-level verification.

---

## 8. How to read this document set

Recommended reading order:

1. `01-coffeemix_all-gap-analysis.md` — understand the gap
2. `02-coffeemix_all-tdd-verification-discipline.md` — understand the desired behavior
3. `03-coffeemix_all-sandbox-file-map.md` — understand local ownership
4. `04-coffeemix_all-master-plan.md` — understand the unified rollout strategy
5. `05-coffeemix_all-workflow.md` — understand execution order
6. `06-coffeemix_all-diagrams.md` — understand the model visually

---

## 9. Maintenance notes

When this doc set evolves:

- update `01` if the gap assessment changes,
- update `02` if the discipline model changes,
- update `03` if future assets or ownership changes,
- update this master plan if rollout order or strategic decisions change,
- update `05` and `06` if the execution workflow or diagrams drift from the authority set.

---

## 10. Bottom line

The master plan is simple:

1. keep the current OMO/CoffeeMix foundation,
2. import superpowers-style discipline as local behavior,
3. document the rollout clearly before implementation,
4. keep all work local, evidence-based, and easy to verify.

That is the common thread tying together `01`, `02`, and `03`.
