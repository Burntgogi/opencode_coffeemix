# coffeemix_all 0.2

<div align="center">

<img src="./assets/coffeemix-all-title.png" alt="coffeemix_all — a sweet cup of coffee for agents" width="920" />

**A sweet cup of coffee for agents.**

**Language:** English | [한국어](./README.ko.md)

</div>

---

An installable CoffeeMix extension pack for OpenCode + OMO, bundling specialist agents, local skills, validation tooling, and setup guidance.

## Prerequisites

coffeemix_all requires two programs installed on your system:

| Program | Description | Install |
|---------|-------------|---------|
| [OpenCode](https://github.com/opencode-ai/opencode) | Terminal-based AI coding agent | `npm install -g opencode-ai` |
| [oh-my-openagent](https://github.com/code-yeongyu/oh-my-openagent) | OpenCode plugin — multi-agent orchestration layer | `npm install -g oh-my-opencode` |

After installing both, run `bunx oh-my-opencode install` to configure your model providers.

## Quick Start

Choose the path that matches your current setup:

- **Fresh install:** use the default installer path below. It is additive and skip-only for existing files.
- **CoffeeMix 0.1 to 0.2 update:** do not rely on the default installer. Use the explicit CoffeeMix-owned update mode described in [`docs/UPDATE.md`](./docs/UPDATE.md).

The default installer path keeps OMO / oh-my-openagent as the control plane and does not replace existing OMO routing, model, skill, or provider configuration.

Always preview first:

```powershell
# Clone or download this package, then:
cd opencode_coffeemix_all_0_2
.\install-global.ps1 -WhatIf
```

For safe mock validation, use `-ConfigDir`:

```powershell
$mock = "C:\temp\coffeemix-0-2-opencode-config"
.\install-global.ps1 -WhatIf -ConfigDir $mock
```

Only run the installer without `-WhatIf` after reviewing the output and backing up your global OpenCode config.

See [`docs/installation-guide.md`](./docs/installation-guide.md) for full installation options and [`docs/UPDATE.md`](./docs/UPDATE.md) for the 0.1 to 0.2 update path.

### Updating from CoffeeMix 0.1

CoffeeMix 0.2 installer work is designed around explicit update flags:

```powershell
$backup = "$env:USERPROFILE\.config\opencode-backups\coffeemix-0-1-before-0-2"
.\install-global.ps1 -WhatIf -UpdateCoffeeMix -BackupDir $backup
.\install-global.ps1 -UpdateCoffeeMix -BackupDir $backup
```

If your local `install-global.ps1` does not list `-UpdateCoffeeMix` and `-BackupDir`, stop and use the default path only for fresh additive installs. A normal install skips existing CoffeeMix files, so it may leave old 0.1 agents, skills, or plugin files in place.

For update rehearsals, use `-WhatIf -ConfigDir <mock OpenCode config>` with a mock directory that contains OMO config, such as `oh-my-opencode.json` or `oh-my-openagent.json`. The update guide includes backup, rollback, and post-update validation commands.

## What this is

coffeemix_all provides:

- **14 `gb-*` specialists** — narrow-scope agents for review, debugging, planning, diagnostics, status, handoff, config, plugins, worktrees, and more
- **8 local skills** — reusable workflow gates for planning, debugging, verification, adoption intake, and completion checks
- **Validation harness** — scenario-based testing for both task behavior and specialist routing
- **Global installer** — PowerShell merge installer with OMO/OpenAgent config detection, `-WhatIf`, `-ConfigDir`, plugin skip behavior, and JSON write protection during preview mode. Fresh installs are additive and skip existing files. 0.1 users need explicit CoffeeMix-owned update mode.
- **UI badge plugin** — a CoffeeMix marker for OpenCode TUI environments
- **Focused release docs** — installation guide and release notes only

## What changed in 0.2

- Stable CoffeeMix-first `gb-*` overlay while keeping OMO / oh-my-openagent as the control plane
- Safer global installer guidance with mock-config validation support via `-ConfigDir` and a documented explicit 0.1 to 0.2 update path
- Documented local skills with `SKILL.md` files
- CoffeeMix UI badge plugin included by default
- Release docs pruned to deployment essentials
- Explicit non-goals: no OMO replacement, no copied router/model/loader, no default GBrain/browser/checkpoint/design runtime, and no `gb-*` deletion

## Structure

| Path | Purpose |
|------|---------|
| `.opencode/agents/` | 14 `gb-*` specialist prompts |
| `.opencode/skills/` | 8 local workflow skills with `SKILL.md` docs |
| `.opencode/plugins/` | UI badge plugin |
| `assets/` | Logo and visual assets |
| `docs/` | Installation guide, [update guide](./docs/UPDATE.md), and [release notes](./docs/RELEASE_NOTES.md) |
| `scenarios/` | Task-based behavior scenarios |
| `routing-scenarios/` | Identity-prompt routing validation scenarios |
| `tools/` | Validation harness and runners |

## Skills

| Skill | Purpose |
|-------|---------|
| `ask-user-question` | Gate dangerous or irreversible operations behind explicit confirmation |
| `compact-context` | Summarize long-running sessions while preserving critical information |
| `enter-plan-mode` | Switch to planning mode before non-trivial implementation |
| `integration-intake` | Screen external workflow/tool adoption before integration |
| `systematic-debugging` | Root-cause-first investigation discipline |
| `test-driven-development` | Define red states or acceptance targets before changes |
| `tool-search` | Discover and select tools based on current task context |
| `verification-before-completion` | Require fresh evidence before declaring work complete |

## Validation

Run the validation harness to verify specialist routing and scenario behavior:

```bash
# Smoke checks (file existence, inventory, subset scenarios)
python tools/workspace_smoke_runner.py

# Full e2e validation (all scenarios, strict checks)
python tools/workspace_e2e_runner.py

# Routing validation (identity-prompt scenarios across specialists)
python tools/routing_validation_runner.py
```

Also verify JSON files parse:

```powershell
Get-Content package.json -Raw | ConvertFrom-Json | Out-Null
Get-Content opencode.json -Raw | ConvertFrom-Json | Out-Null
Get-Content oh-my-opencode.json -Raw | ConvertFrom-Json | Out-Null
Get-Content tui.json -Raw | ConvertFrom-Json | Out-Null
```

Reports are written to `reports/` and should not be committed as release artifacts.

## Acknowledgments

This project builds on the work of others in the AI agent ecosystem. We are grateful to:

- **[OpenCode](https://github.com/opencode-ai/opencode)** — The terminal-based AI coding agent runtime that powers this extension pack.
- **[oh-my-openagent](https://github.com/code-yeongyu/oh-my-openagent)** — The multi-agent orchestration plugin that provides the OMO control plane.
- **[obra/superpowers](https://github.com/obra/superpowers)** — Workflow discipline and skill-authoring influence.
- **[garrytan/gstack](https://github.com/garrytan/gstack)** — Specialist layering and optional adapter inspiration.

## Origin of Components

| Prefix / Source | Origin |
|-----------------|--------|
| `gb-*` specialists | Original to coffeemix_all ("gb" = 가베, old Korean word for coffee) |
| Local discipline skills | Adapted from [obra/superpowers](https://github.com/obra/superpowers) workflow gate concepts |
| `integration-intake` | Gate for CoffeeMix integration screening |
| Baseline agents (`sisyphus`, `oracle`, `librarian`, etc.) | Provided by [oh-my-openagent](https://github.com/code-yeongyu/oh-my-openagent) |

All specialist prompts, local skills, validation scripts, and routing scenarios in this repository are independently authored workspace-local artifacts.

## License

This project is licensed under the MIT License — see the [LICENSE](./LICENSE) file for details.
