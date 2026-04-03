---
name: enter-plan-mode
description: Switch to planning mode before coding. Analyze requirements, propose architecture, and get user confirmation before any file changes. Use when tasks involve new features, refactoring, or multi-file changes.
compatibility: opencode
---

# enter-plan-mode

## What this skill does
Before writing or modifying any code, this skill forces a planning phase. It prevents premature implementation by requiring the agent to:
1. Understand the requirement fully
2. Propose an approach with file-level detail
3. Identify risks and alternatives
4. Get explicit user confirmation before touching files

This pattern is derived from Claude Code's `EnterPlanMode` tool concept.

## When to use
- New feature implementation (2+ steps)
- Refactoring existing code
- Multi-file or cross-module changes
- Architecture decisions
- Any task where the approach is not obvious

## When NOT to use
- Single-line fixes (typos, obvious syntax errors)
- Trivial config changes with clear instructions
- Tasks where the user explicitly said "just do it"
- Tasks already covered by an active OMO delegation chain

## Planning phase rules

### Step 1: Understand
- Restate the requirement in your own words
- Identify implicit assumptions
- Note missing context and ask ONE clarifying question if needed

### Step 2: Propose
- List concrete steps (atomic actions)
- Specify which files will be created/modified/deleted
- Note existing patterns to follow (reference specific files)
- Identify risks and alternatives

### Step 3: Confirm
- Present the plan concisely
- Ask: "Should I proceed with this plan, or would you prefer differently?"
- **Do NOT start implementation until user confirms**

## Plan format
```
**Plan**: [one-line summary]

**Steps**:
1. [action] → [file(s)]
2. [action] → [file(s)]
3. [action] → [file(s)]

**Risks**: [potential issues]
**Alternatives**: [other approaches considered]

Proceed?
```

## After confirmation
- Follow the plan exactly
- Mark each step complete as you go
- Report any deviation from the plan immediately

## OMO alignment rules
- This skill does NOT replace OMO's delegation policy. If a task is already delegated to a specialist agent, follow that agent's workflow.
- When OMO's todo discipline is active, use the existing todo system to track plan steps rather than creating a separate tracking mechanism.
- If the user's request is already covered by an existing cc-* agent (cc-commit, cc-review, etc.), defer to that agent's workflow instead of re-planning.
- This skill yields to direct execution when: the task is trivial, the user has explicitly confirmed the approach in a previous turn, or the plan was already approved in the current session.
