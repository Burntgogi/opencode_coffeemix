# coffeemix_all

<div align="center">

**Language:** English | [한국어](./README.ko.md)

</div>

---

An OpenCode + OMO workspace with a layered specialist system for workflow, routing, and validation.

## Prerequisites

coffeemix_all requires two programs installed on your system:

| Program | Description | Install |
|---------|-------------|---------|
| [OpenCode](https://github.com/opencode-ai/opencode) | Terminal-based AI coding agent | `npm install -g opencode-ai` |
| [oh-my-openagent](https://github.com/code-yeongyu/oh-my-openagent) | OpenCode plugin — multi-agent orchestration layer | `npm install -g oh-my-opencode` |

After installing both, run `bunx oh-my-opencode install` to configure your model providers.

## Quick Start

```powershell
# Clone or download this package, then:
cd coffeemix_all_0_1
.\install-global.ps1
```

See [`docs/installation-guide.md`](./docs/installation-guide.md) for full installation options.

## What this is

coffeemix_all provides:

- **14 `gb-*` specialists** — narrow-scope agents for review, debugging, planning, diagnostics, status, handoff, and more
- **8 local skills** — reusable workflow gates for planning, debugging, verification, and adoption intake
- **Validation harness** — scenario-based testing for both task behavior and specialist routing
- **Global installer** — PowerShell script with automatic model mapping from your existing OMO config

## Structure

| Path | Purpose |
|------|---------|
| `.opencode/agents/` | 14 `gb-*` specialist prompts |
| `.opencode/skills/` | 8 local workflow skills |
| `.opencode/plugins/` | UI badge plugin |
| `scenarios/` | Task-based behavior scenarios |
| `routing-scenarios/` | Identity-prompt routing validation (28 scenarios × 14 specialists) |
| `tools/` | Validation harness and runners |
| `docs/` | Public-facing guides and architecture reference |
| `archive/` | Internal planning history and evidence docs |

## Skills

| Skill | Purpose |
|-------|---------|
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

## Acknowledgments

This project builds on the work of others in the AI agent ecosystem. We are grateful to:

- **[obra/superpowers](https://github.com/obra/superpowers)** — The 8 local discipline skills (`ask-user-question`, `compact-context`, `enter-plan-mode`, `systematic-debugging`, `test-driven-development`, `tool-search`, `verification-before-completion`, `integration-intake`) were adapted from this project's skill patterns and workflow gate concepts.
- **[garrytan/gstack](https://github.com/garrytan/gstack)** — The multi-agent routing architecture and specialist layering concept (prefer narrow-scope specialists over general agents when tasks match) was inspired by this project's agent orchestration patterns.

## Origin of Components

| Prefix / Source | Origin |
|-----------------|--------|
| `gb-*` specialists | Original to coffeemix_all ("gb" = 가베, old Korean word for coffee) |
| Local discipline skills | Adapted from [obra/superpowers](https://github.com/obra/superpowers) |
| `integration-intake` | Gate for gb-* integration screening |
| Baseline agents (`sisyphus`, `oracle`, `librarian`, etc.) | Provided by [oh-my-openagent](https://github.com/code-yeongyu/oh-my-openagent) |
| Command and workflow inspiration | [Claude Code](https://github.com/anthropics/claude-code) by Anthropic |

All specialist prompts, local skills, validation scripts, and routing scenarios in this repository are independently authored workspace-local artifacts.

## License

This project is licensed under the MIT License — see the [LICENSE](./LICENSE) file for details.

This project includes components from:
- [oh-my-openagent](https://github.com/code-yeongyu/oh-my-openagent) — Sustainable Use License v1.0
- [obra/superpowers](https://github.com/obra/superpowers) — MIT License (Copyright © 2025 Jesse Vincent)
- [garrytan/gstack](https://github.com/garrytan/gstack) — MIT License (Copyright © 2026 Garry Tan)
