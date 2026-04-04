---
name: verification-before-completion
description: Require fresh evidence before declaring work complete. Use when changes must be proven through files, diagnostics, checks, or documented validation.
compatibility: opencode
---

# verification-before-completion

## What this skill does
This skill formalizes the difference between **implemented** and **verified**.

Its rule is:

> No task is complete until there is fresh, post-change evidence that the requested outcome was achieved.

This applies especially to the `coffeemix_all` sandbox, where much of the work involves:

- markdown documents,
- skill specs,
- config files,
- plugin references,
- path and naming consistency.

## When to use
- After any file creation or file edit
- Before reporting completion to the user
- After changing docs, skills, config, plugin references, or routing artifacts
- When the work includes “should now be correct” claims

## When NOT to use
- Purely hypothetical discussion
- Early planning before any change was made
- Read-only comparison tasks with no deliverables

## Core rules / gates

### Rule 1: Evidence must be fresh
Validation must happen after the final change, not before it.

### Rule 2: Match evidence to the artifact

| Artifact type | Required evidence |
|---|---|
| Markdown docs | file existence, headings/sections, link/name consistency |
| Skill / agent specs | file existence, correct local path, explicit role boundaries |
| JSON/config | target key/value presence, path correctness, no stale references |
| Runtime helper files | correct local workspace path and visible labels |

### Rule 3: Separate output from proof
Always distinguish:

- what changed,
- what was checked,
- what passed,
- what remains unresolved.

### Rule 4: Do not hide pre-existing issues
If unrelated issues are discovered, name them separately instead of blending them into the success claim.

### Rule 5: Keep intake, status, and readiness separate from verification
- intake identifies the request, authority files, and scope boundary
- status summaries describe current state, open risks, or next steps
- readiness gates decide whether work is mature enough to begin or expand
- verification proves that a specific requested outcome was achieved after the final change

Only the last item counts as completion evidence.

## Required workflow

1. List the deliverables.
2. Separate intake notes, status notes, and readiness notes from completion proof.
3. Run the narrowest useful verification for each deliverable.
4. Record pass / partial / blocked explicitly.
5. Note open risks or intentional non-goals.
6. Only then declare completion.

## Evidence expectations

### Recommended completion block
```md
## Evidence

- Deliverables: [files created/updated]
- Validation: [checks run]
- Result: [pass / partial / blocked]
- Open risks: [if any]
- Out of scope: [anything intentionally not changed]
```

### Example checks in this sandbox
- `read` for file content and path verification
- targeted config reads for expected values
- `grep` for stale names or references
- `lsp_diagnostics` only when syntax-bearing code files are changed

### Boundary reminders for this sandbox
- An intake summary can say which files or authority sources matter, but it is not evidence that the task succeeded.
- A readiness statement can say work is safe to begin or broaden, but it is not proof that the requested change is complete.
- A status or handoff summary can report completed work, verified work, and open risks, but it must not blur those fields together.

## Anti-patterns
- “Looks right” with no check
- Claiming completion before reading the final file state
- Reusing stale evidence collected before the last edit
- Mixing planning intent with validation output
- Treating intake or readiness language as if it were completion proof
- Treating a status summary as if it were a verification artifact
- Hiding unrelated warnings or broken references

## OMO / CoffeeMix alignment rules
- This skill does not decide who performs the task; it decides when the task can be declared done.
- It complements `gb-review`, `gb-doctor`, `gb-share`, and evidence documents rather than replacing them.
- Use this skill for sandbox-local validation only. Do not validate or modify global OpenCode state.
