# coffeemix_all

An OpenCode + OMO workspace with a layered specialist system for workflow, routing, and validation.

## Start here

- Workspace rules and routing priorities: [`AGENTS.md`](./AGENTS.md)
- Documentation index: [`docs/README.md`](./docs/README.md)

## What this is

coffeemix_all provides:

- **14 `gb-*` specialists** — narrow-scope agents for review, debugging, planning, diagnostics, status, handoff, and more
- **8 local skills** — reusable workflow gates for planning, debugging, verification, and adoption intake
- **Validation harness** — scenario-based testing for both task behavior and specialist routing

## Structure

| Path | Purpose |
|---|---|
| `.opencode/agents/` | 14 `gb-*` specialist prompts |
| `.opencode/skills/` | 8 local workflow skills |
| `scenarios/` | Task-based behavior scenarios |
| `routing-scenarios/` | Identity-prompt routing validation (28 scenarios × 14 specialists) |
| `tools/` | Validation harness and runners |
| `docs/` | Public-facing guides and architecture reference |
| `archive/` | Internal planning history and evidence docs |

## Skills

| Skill | Purpose |
|---|---|
| `ask-user-question` | Gate dangerous or irreversible operations behind explicit confirmation |
| `compact-context` | Summarize long-running sessions while preserving critical information |
| `enter-plan-mode` | Switch to planning mode before non-trivial implementation |
| `integration-intake` | Gate external workflow/tool adoption behind explicit intake questions |
| `systematic-debugging` | Root-cause-first investigation discipline |
| `test-driven-development` | Define failing checks or acceptance targets before changes |
| `tool-search` | Discover and select tools based on current task context |
| `verification-before-completion` | Require fresh evidence before declaring work complete |

## Validation

Run the validation harness to verify specialist routing and scenario behavior:

```bash
# Smoke checks (file existence, inventory, subset scenarios)
python tools/workspace_smoke_runner.py

# Full e2e validation (all scenarios, strict checks)
python tools/workspace_e2e_runner.py

# Routing validation (28 identity-prompt scenarios across 14 specialists)
python tools/routing_validation_runner.py
```

Reports are written to `reports/` (gitignored).

## Non-goal

This workspace does not imply global runtime adoption. It is a self-contained, reproducible configuration set for OpenCode + OMO environments.

## Dependencies

This workspace is designed to run with [oh-my-openagent](https://github.com/code-yeongyu/oh-my-openagent), which is licensed under the Sustainable Use License v1.0.

## Origin of Components

| Prefix / Source | Origin |
|---|---|
| `gb-*` specialists | Original to coffeemix_all ("gb" = 가베, old Korean word for coffee) |
| Local discipline skills | Adapted locally from [obra/superpowers](https://github.com/obra/superpowers) |
| `integration-intake` | coffeemix_all local adoption gate for Claude-derived integrations |
| Baseline agents (`sisyphus`, `oracle`, `librarian`, etc.) | Provided by [oh-my-openagent](https://github.com/code-yeongyu/oh-my-openagent) |
| Command and workflow inspiration | [Claude Code](https://github.com/anthropics/claude-code) by Anthropic |

All specialist prompts, local skills, validation scripts, and routing scenarios in this repository are independently authored workspace-local artifacts.
