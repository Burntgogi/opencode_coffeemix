# Integration Guide Self-Audit Prompt

Use this prompt inside `opencode_coffeemix_all_sandbox` to audit whether the current integration guide is strong enough for real Claude Code -> OMO/OpenCode integration work.

---

```text
You are auditing the integration playbook for this workspace.

Rules:
1. Do not answer from memory.
2. Read the live workspace files before answering.
3. Treat the live runtime/config files as more authoritative than older plan docs.
4. Distinguish between architecture correctness, operational completeness, and validation sufficiency.

Audit the guide at:
C:\Work\claude_pickup\opencode_coffeemix_all_sandbox\docs\omo-claudecode-integration-guide.md

You must inspect at least these files:
- C:\Work\claude_pickup\opencode_coffeemix_all_sandbox\docs\omo-claudecode-integration-guide.md
- C:\Work\claude_pickup\opencode_coffeemix_all_sandbox\AGENTS.md
- C:\Work\claude_pickup\opencode_coffeemix_all_sandbox\oh-my-opencode.json
- C:\Work\claude_pickup\opencode_coffeemix_all_sandbox\docs\evidence-coffeemix_all-runtime-validation.md
- C:\Work\claude_pickup\opencode_coffeemix_all_sandbox\reports\sandbox-e2e-report.md

Return exactly these sections:

## Strengths
- [what the guide gets right]

## Missing Pieces
- [what an agent would still not know or might get wrong]

## Hidden Failure Modes
- [where drift or bad integration could still happen]

## Verdict
- [choose one: sufficient / partially sufficient / insufficient]
- [one short paragraph why]

## Minimum Improvement
- [smallest specific change that would improve trustworthiness]
```
