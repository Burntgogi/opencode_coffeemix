# coffeemix_all Installation Guide

## Prerequisites

Before installing coffeemix_all, make sure you have:

- [OpenCode](https://github.com/opencode-ai/opencode) installed and working
- [oh-my-openagent](https://github.com/code-yeongyu/oh-my-openagent) installed as an OpenCode plugin (`npm install -g oh-my-opencode`)
- Your own provider configuration set up in OpenCode (API keys, local models, etc.)

## Installation Modes

coffeemix_all supports two installation modes. Choose the one that fits your workflow:

| Mode | Scope | Use when |
|------|-------|----------|
| **Global** | System-wide (`%USERPROFILE%\.config\opencode\`) | You want coffeemix_all agents available in every OpenCode session |
| **Project-local** | Single project root | You want coffeemix_all only in specific projects |

---

## A. Global Installation (Recommended)

### Quick Install

Run the included PowerShell installer from the package directory:

```powershell
cd C:\path\to\coffeemix_all_0_1
.\install-global.ps1
```

The installer will:
1. Copy 14 `gb-*` specialist agents to `%USERPROFILE%\.config\opencode\agents\`
2. Copy 8 workflow skills to `%USERPROFILE%\.config\opencode\skills\`
3. Copy the badge plugin to `%USERPROFILE%\.config\opencode\plugins\`
4. Copy `AGENTS.md` and `tui.json` to the global config directory
5. Merge the `oh-my-openagent` plugin entry into your global `opencode.json`
6. Merge all `gb-*` agent definitions into your global `oh-my-opencode.json` with **automatic model mapping**

### Automatic Model Mapping

The installer automatically assigns models to gb-* agents using the same strategy as OMO:

1. **Existing OMO config** — If `oh-my-opencode.json` already has model mappings (from `bunx oh-my-opencode install`), the installer copies those assignments to matching gb-* agents by role:
   - `high` variant → oracle/momus model (e.g., `openai/gpt-5.4`)
   - `medium` variant → prometheus/metis model
   - `fast` variant → librarian/explore model

2. **Provider scan** — If no OMO config exists, reads your `opencode.json` provider section and assigns the first available model to all gb-* agents.

3. **Placeholder** — If neither exists, uses `YOUR_PROVIDER/YOUR_MODEL` for manual configuration.

**Safe to re-run**: The installer skips files that already exist and only merges new entries.

### Preview Mode

To see what would be installed without making changes:

```powershell
.\install-global.ps1 -WhatIf
```

### Placeholder-Only Mode

To install with `YOUR_PROVIDER/YOUR_MODEL` placeholders (skip auto-detection):

```powershell
.\install-global.ps1 -PlaceholderOnly
```

### Manual Global Install

If you prefer to install manually, copy these files to `%USERPROFILE%\.config\opencode\`:

| Source | Destination | Purpose |
|--------|-------------|---------|
| `.opencode/agents/gb-*.md` | `%USERPROFILE%\.config\opencode\agents\` | 14 `gb-*` specialist prompts |
| `.opencode/skills/*/` | `%USERPROFILE%\.config\opencode\skills\` | 8 local workflow skills |
| `.opencode/plugins/*.tsx` | `%USERPROFILE%\.config\opencode\plugins\` | UI badge plugin |
| `AGENTS.md` | `%USERPROFILE%\.config\opencode\AGENTS.md` | Routing rules |
| `tui.json` | `%USERPROFILE%\.config\opencode\tui.json` | Badge config |

Then merge configuration files:

- **`opencode.json`**: Ensure `"oh-my-openagent"` is in the `plugin` array
- **`oh-my-opencode.json`**: Add all `gb-*` agent entries (see package file for reference)

---

## B. Project-local Installation

In your OpenCode + OMO project, ask the Sisyphus agent:

> Apply the coffeemix_all workspace from the package to this project.

Sisyphus will:
1. Copy the relevant files into your project root
2. Merge agent and category definitions into your existing `oh-my-opencode.json`
3. Verify the installation with the validation harness

### Manual Project-local Install

Copy these files from the coffeemix_all package into your project:

#### Required files

| Source | Destination | Purpose |
|--------|-------------|---------|
| `AGENTS.md` | `<your-project>/AGENTS.md` | Workspace routing and rules |
| `.opencode/agents/` | `<your-project>/.opencode/agents/` | 14 `gb-*` specialist prompts |
| `.opencode/skills/` | `<your-project>/.opencode/skills/` | 8 local workflow skills |
| `.opencode/plugins/` | `<your-project>/.opencode/plugins/` | UI badge plugin |
| `scenarios/` | `<your-project>/scenarios/` | Task-based validation scenarios |
| `routing-scenarios/` | `<your-project>/routing-scenarios/` | Routing validation scenarios |
| `tools/` | `<your-project>/tools/` | Validation harness and runners |

#### Configuration files (merge, do not overwrite)

| Source | Your file | Action |
|--------|-----------|--------|
| `oh-my-opencode.json` | `<your-project>/oh-my-opencode.json` | **Merge** the `gb-*` agent entries and categories. Do NOT replace — your provider/model mappings take priority. |
| `opencode.json` | `<your-project>/opencode.json` | **Merge** the `oh-my-openagent` plugin entry if not already present. Do NOT copy the provider section. |
| `tui.json` | `<your-project>/tui.json` | **Append** the coffeemix_all badge plugin to your existing plugin array. |

---

## Post-Install Verification

After installation, verify everything works:

```powershell
# 1. Restart OpenCode, then press Tab to check agent list
# 2. Run the validation harness (project-local only):
python tools/workspace_smoke_runner.py
python tools/workspace_e2e_runner.py
python tools/routing_validation_runner.py
```

Reports are written to `reports/` (gitignored).

---

## What coffeemix_all Adds

After installation, you gain:

- **14 `gb-*` specialists** — review, debugging, planning, diagnostics, status, handoff, and more
- **8 local skills** — planning gates, verification discipline, debugging workflow, adoption intake
- **Validation harness** — scenario-based testing for behavior and routing (project-local)
- **Routing rules** — `AGENTS.md` tells OMO to prefer `gb-*` specialists when tasks match

## What coffeemix_all Does NOT Change

- Your provider configuration (API keys, model choices, local models)
- Your existing agents and categories
- Your project's source code
- Your OpenCode runtime settings

---

## Troubleshooting

### gb-* agents use wrong models

The installer auto-detects models from your existing OMO config. To customize:

1. Edit `%USERPROFILE%\.config\opencode\oh-my-opencode.json`
2. Change the `model` value for each `gb-*` agent
3. Or re-run `bunx oh-my-opencode install` to reset all model mappings

### gb-* agents don't appear in Tab completion

1. Confirm `AGENTS.md` exists in your project root (project-local) or `%USERPROFILE%\.config\opencode\` (global)
2. Check that `oh-my-opencode.json` has all 14 `gb-*` agent entries
3. Ensure the `oh-my-openagent` plugin is loaded in `opencode.json`
4. Restart OpenCode to pick up config changes

### Warning: "legacy package name oh-my-opencode"

Update your `opencode.json` plugin array: change `"oh-my-opencode"` to `"oh-my-openagent"`.

### Validation fails after install (project-local)

1. Check that all `.opencode/agents/` and `.opencode/skills/` files were copied correctly
2. Verify `oh-my-opencode.json` has all `gb-*` agent entries
3. Run `python tools/workspace_smoke_runner.py` to see which specific checks fail

---

## License

See the repository root for license information.
