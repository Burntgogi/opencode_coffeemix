---
name: integration-intake
description: Screen proposed Claude-derived integrations before implementation. Use when deciding whether a new pattern belongs in CoffeeMix as an agent, skill, rule, plugin, or validation asset.
compatibility: opencode
---

# integration-intake

## What this skill does
This skill adds a mandatory intake gate before implementing a new Claude-derived capability in the `coffeemix_all` sandbox.

Its rule is:

> If the integration target, value, file surface, and non-goals cannot be stated clearly, the integration is not ready.

This skill is for **selective adoption**, not expansion by default. It helps extract high-value Claude Code patterns into OMO-native CoffeeMix surfaces without replacing OMO as the control plane.

## When to use
- Before creating a new Claude-derived agent, skill, rule, plugin, or validation asset
- When a request proposes “integrating” another Claude Code feature or workflow
- When existing `gb-*` specialists, skills, or routing rules may be insufficient
- Before planning or implementation of non-trivial integration work

## When NOT to use
- Trivial edits to an already-approved local integration artifact
- Work that is already clearly covered by an existing `gb-*` specialist, skill, or rule
- General brainstorming about future ideas with no implementation decision
- Replacing `enter-plan-mode` for file-level implementation planning

## Intake questions
Before implementation, answer all of these clearly:

1. **Claude source behavior** — what exact behavior or pattern is being extracted?
2. **User value** — why is this worth having in OMO/OpenCode?
3. **OMO-native target** — should this become an agent, skill, rule, plugin, or validation asset?
4. **Files to touch** — which exact runtime or validation files are expected to change?
5. **Non-goals** — what will this integration explicitly not do?
6. **Why existing surface is insufficient** — why are current `gb-*`, skills, or rules not enough already?

If any answer is vague, contradictory, or branding-driven, stop and tighten the intake first.

## Required workflow

1. **Identify a real Claude pattern**
   - Use source behavior, not product branding.
   - Prefer concrete command, tool, session, hook, lifecycle, or UX behavior worth preserving.

2. **Write the intake record**
   - Capture all six intake questions.
   - Keep the record short, specific, and sandbox-local.

3. **Classify the target correctly**
   - narrow specialist workflow -> `gb-*` agent
   - reusable behavioral constraint -> skill
   - orchestration preference -> `AGENTS.md` rule
   - startup or UI marker -> plugin / UI surface
   - validation-only behavior -> `tools/` + `scenarios/`

4. **Check control-plane fit**
   - Ask whether the change strengthens OMO or makes OMO depend on another runtime.
   - If it makes OMO depend on another runtime, stop.

5. **Hand off to planning or implementation only after intake is green**
   - Use `enter-plan-mode` if file-level execution planning is still needed.
   - Keep this skill as the adoption gate, not the implementation workflow.

## Anti-patterns
- Starting implementation before the intake record exists
- Treating a Claude command name as sufficient justification for a new CoffeeMix surface
- Using this skill as open-ended brainstorming instead of a decision gate
- Letting the intake drift into file-level planning that belongs in `enter-plan-mode`
- Proposing integrations that replace OMO orchestration instead of strengthening it
- Adding a new surface when an existing `gb-*` specialist, skill, or rule already fits

## OMO / CoffeeMix alignment rules
- OMO remains the control plane; this skill only decides whether a Claude-derived idea is ready for local adoption.
- This skill does not replace planning, implementation, routing, or validation workflows.
- Use it before non-trivial integration work, then hand off to the correct local workflow for planning and execution.
- Keep all decisions sandbox-local; do not assume or modify global OpenCode state.
- Prefer selective adoption of proven patterns over broad feature parity with Claude Code.
