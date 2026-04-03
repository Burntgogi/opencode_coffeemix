---
name: test-driven-development
description: Define a failing check or explicit red state before non-trivial changes. Use for code, config, docs, skills, and routing work where success must be proven rather than assumed.
compatibility: opencode
---

# test-driven-development

## What this skill does
This skill adapts TDD-style discipline to the `coffeemix_all` sandbox.

Its core rule is simple:

> No non-trivial change should begin until there is a known red state, missing artifact, or explicit acceptance target.

In this workspace, that red state is often not a unit test. It may instead be:

- a missing document,
- a missing skill file,
- a stale path or label,
- a missing routing rule,
- a failed validation check,
- or a known inconsistency between docs and local files.

## When to use
- Creating or changing `.opencode/skills/*`
- Editing `AGENTS.md`, `oh-my-opencode.json`, or local plugin/config files
- Multi-step documentation work
- Routing or policy changes
- Any task where “done” needs explicit proof

## When NOT to use
- Trivial typo fixes with obvious outcomes
- Read-only exploration or inventory tasks
- Tasks where the user asked only for explanation, not change
- Work that already has a stronger task-specific gate in effect

## Core rules / gates

### Rule 1: Define the red state first
Before editing files, write down one of:

- what is missing,
- what is failing,
- what is inconsistent,
- or what exact acceptance target will prove success.

### Rule 2: Match the red state to the artifact type

| Artifact type | Valid red state |
|---|---|
| Documentation | missing file, broken links, stale names, incomplete role definition |
| Skill / agent spec | missing file, unclear boundary, overlap with existing local primitive |
| Config / routing | missing rule, stale path, wrong registration, contradictory mapping |
| Plugin / UI marker | wrong label, wrong local path, inconsistent workspace identity |

### Rule 3: Make the smallest useful change
The first implementation should solve the defined red state directly. Do not expand scope just because related improvements are nearby.

### Rule 4: Green means verified, not guessed
Once the change is made, verify that the red state is no longer true.

## Required workflow

1. **State the red condition**
   - What is wrong or missing right now?
2. **State the green condition**
   - What exact evidence will prove the problem is solved?
3. **Implement the smallest useful change**
   - Change only the needed files.
4. **Verify after the final edit**
   - Confirm the green condition with fresh evidence.
5. **Report the evidence**
   - Separate deliverables from proof.

## Evidence expectations

| Work type | Minimum evidence |
|---|---|
| Markdown docs | file exists, headings make sense, links/reference names align |
| JSON/config | target keys/values exist, local references resolve |
| Skill files | file exists, role is explicit, overlaps are bounded |
| Launcher/helper files | visible labels and local paths match the current workspace |

## Anti-patterns
- Starting with implementation before defining the red state
- Treating “I know what to do” as evidence
- Using vague green states like “should be better now”
- Expanding a small fix into unrelated cleanup
- Replacing workspace-specific evidence with generic testing language

## OMO / CoffeeMix alignment rules
- This skill does not replace OMO orchestration or CoffeeMix specialist routing.
- It defines the **pre-change discipline**, not the execution owner.
- If a `cc-*` specialist owns the work, use this skill to frame red/green states before or alongside that specialist’s workflow.
- This skill is sandbox-local. Do not assume or modify any global OpenCode configuration.
