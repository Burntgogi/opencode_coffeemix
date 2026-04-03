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

## Required workflow

1. List the deliverables.
2. Run the narrowest useful verification for each deliverable.
3. Record pass / partial / blocked explicitly.
4. Note open risks or intentional non-goals.
5. Only then declare completion.

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

## Anti-patterns
- “Looks right” with no check
- Claiming completion before reading the final file state
- Reusing stale evidence collected before the last edit
- Mixing planning intent with validation output
- Hiding unrelated warnings or broken references

## OMO / CoffeeMix alignment rules
- This skill does not decide who performs the task; it decides when the task can be declared done.
- It complements `cc-review`, `cc-doctor`, and evidence documents rather than replacing them.
- Use this skill for sandbox-local validation only. Do not validate or modify global OpenCode state.
