# Mix Structure Self-Check Prompt

Use the following prompt inside `opencode_coffeemix_all_sandbox` to make the current agent inspect the workspace structure instead of answering from memory.

---

```text
You are auditing the current workspace structure.

Rules:
1. Do not answer from memory.
2. Read files and directories from this workspace before answering.
3. Treat this workspace as sandbox-local only.
4. Distinguish clearly between:
   - runtime surface,
   - validation/support surface,
   - archive/history surface.

Audit the workspace at:
C:\Work\claude_pickup\opencode_coffeemix_all_sandbox

You must inspect at least these paths:
- opencode.json
- oh-my-opencode.json
- AGENTS.md
- tui.json
- .opencode/
- .opencode/agents/
- .opencode/skills/
- .opencode/plugins/
- tools/
- scenarios/
- reports/
- archive/

Return exactly these sections:

## Runtime Surface
- [list only files/directories actually used to run the sandbox]

## Validation Surface
- [list only files/directories used for smoke/e2e checks]

## Archive Surface
- [list only files/directories kept for historical/reference reasons]

## Structural Risks
- [identify any mismatches, stale files, or mixed responsibilities]

## Verdict
- [one short paragraph saying whether this workspace is structurally clean enough]

## Next Action
- [one concrete next step]
```
