---
name: compact-context
description: Automatically summarize session context when conversations grow long. Preserves original intent, current plan, completed work, open risks, and active delegations. Use when session context exceeds effective reasoning capacity.
compatibility: opencode
---

# compact-context

## What this skill does
This skill provides session context compaction for long-running sessions. When conversations grow too large for effective reasoning, it summarizes the session while preserving critical information. This pattern is derived from Claude Code's context compaction mechanism.

## When compaction triggers
- Session exceeds ~200k tokens (approximate)
- User explicitly requests `/compact`
- Agent detects reasoning degradation (repetitive analysis, lost context)
- Before delegating to a new subagent in a long session

## What MUST be preserved during compaction

### Critical (never drop)
1. **Original user intent** — what the user actually asked for
2. **Current plan** — the active work breakdown
3. **Completed work** — what's been done and verified
4. **Open risks** — known issues, blocked decisions
5. **Active delegations** — background tasks still running

### Important (summarize, don't drop)
6. Key architectural decisions made during the session
7. File paths and patterns referenced
8. Error messages and their resolutions
9. User preferences expressed during the session

### Droppable (safe to summarize heavily)
10. Verbose tool outputs
11. Intermediate reasoning steps
12. Explored but rejected approaches

## Compaction format
```
## Session Summary

**Original intent**: [what the user asked for]

**Current plan**:
- [ ] Step 1: ...
- [x] Step 2: ... (verified)
- [ ] Step 3: ...

**Completed work**:
- [file] was [action] — [verification result]

**Open risks**:
- [risk description] — [status]

**Active delegations**:
- [task_id]: [description] — [status]

**Key decisions**:
- [decision] because [reason]

**Context to restore**: [specific files/patterns the agent should re-read]
```

## Rules
1. **Never** compact without preserving the 5 critical items
2. **Always** note what was dropped and why
3. **Always** provide "context to restore" — specific files the agent should re-read after compaction
4. If the user says "don't compact", respect it and note the token concern
5. After compaction, the agent should re-read any files mentioned in "context to restore" before continuing

## Integration with other skills
- `enter-plan-mode`: The "Current plan" section maps directly to the plan format
- `ask-user-question`: Any pending confirmations must be noted in "Open risks"

## Compaction modes

### Documentation-only compaction
Use when:
- The session is long but the agent is still reasoning well
- The user wants a record but not an active context reset

Produces:
- A session summary for reference
- Does NOT change the active conversation context

### Active workflow compaction
Use when:
- The agent is losing context or repeating analysis
- The session has exceeded effective reasoning capacity

Produces:
- A session summary
- Explicit "context to restore" instructions
- The agent re-reads referenced files before continuing

## Connection to cc-* agents
- `cc-resume`: Uses the same session summary format when resuming interrupted work
- `cc-share`: Can export a compacted summary for handoff
- `cc-memory`: Extracts durable context from compaction summaries for long-term persistence
