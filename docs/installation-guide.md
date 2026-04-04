# coffeemix_all Installation Guide

## Prerequisites

Before installing coffeemix_all, make sure you have:

- [OpenCode](https://github.com/opencode-ai/opencode) installed and working
- [oh-my-openagent](https://github.com/code-yeongyu/oh-my-openagent) installed as an OpenCode plugin
- Your own provider configuration set up in OpenCode (API keys, local models, etc.)

## Quick Install

In your OpenCode + OMO project, ask the Sisyphus agent:

> Apply the coffeemix_all workspace from https://github.com/YOUR-ORG/coffeemix_all to this project.

Sisyphus will:

1. Clone or download the coffeemix_all repository
2. Copy the relevant files into your project root
3. Merge agent and category definitions into your existing `oh-my-opencode.json`
4. Verify the installation with the validation harness

## Manual Install

If you prefer to install manually, copy these files from the coffeemix_all repository into your project:

### Required files

| Source | Destination | Purpose |
|---|---|---|
| `AGENTS.md` | `<your-project>/AGENTS.md` | Workspace routing and rules |
| `.opencode/agents/` | `<your-project>/.opencode/agents/` | 14 `gb-*` specialist prompts |
| `.opencode/skills/` | `<your-project>/.opencode/skills/` | 8 local workflow skills |
| `.opencode/plugins/` | `<your-project>/.opencode/plugins/` | UI badge plugin |
| `scenarios/` | `<your-project>/scenarios/` | Task-based validation scenarios |
| `routing-scenarios/` | `<your-project>/routing-scenarios/` | Routing validation scenarios |
| `tools/` | `<your-project>/tools/` | Validation harness and runners |
| `package.json` | `<your-project>/package.json` (merge) | Plugin dependency |

### Configuration files (merge, do not overwrite)

| Source | Your file | Action |
|---|---|---|
| `oh-my-opencode.json` | `<your-project>/oh-my-opencode.json` | **Merge** the `gb-*` agent entries and categories into your existing file. Do NOT replace your file — your provider/model mappings take priority. |
| `opencode.json` | `<your-project>/opencode.json` | **Merge** the `oh-my-opencode` plugin entry if not already present. Do NOT replace your provider config. |
| `tui.json` | `<your-project>/tui.json` | **Append** the coffeemix_all badge plugin to your existing plugin array. |

### Optional files

| Source | Destination | Purpose |
|---|---|---|
| `docs/` | `<your-project>/docs/coffeemix_all/` | Architecture reference and integration guide |
| `archive/` | (skip) | Internal planning history — not needed for operation |

## Post-Install Verification

After installation, run the validation harness:

```bash
# Smoke checks
python tools/workspace_smoke_runner.py

# Full e2e validation
python tools/workspace_e2e_runner.py

# Routing validation
python tools/routing_validation_runner.py
```

Reports are written to `reports/` (add to `.gitignore` if not already present).

## Updating Your Configuration

### oh-my-opencode.json

Copy the `gb-*` agent entries from the coffeemix_all `oh-my-opencode.json` into your own file. **Keep your own model/provider values** — the coffeemix_all file only shows the agent structure.

Example merge:

```json
{
  "agents": {
    "your-existing-agent": { "...": "..." },
    "gb-review": { "model": "YOUR_PROVIDER/YOUR_MODEL", "variant": "high" },
    "gb-debug": { "model": "YOUR_PROVIDER/YOUR_MODEL", "variant": "high" },
    "... other gb-* agents ..."
  },
  "categories": {
    "your-existing-category": { "...": "..." }
  }
}
```

### opencode.json

Only add the `oh-my-opencode` plugin if you don't have it:

```json
{
  "plugin": ["oh-my-opencode"]
}
```

Do NOT copy the provider section — use your own.

### tui.json

Append the badge plugin:

```json
{
  "plugin": [
    ["./.opencode/plugins/coffeemix_all-badge.tsx", { "label": "With_coffeemix_all_V0.1" }]
  ]
}
```

## What coffeemix_all Adds

After installation, your project gains:

- **14 `gb-*` specialists** — review, debugging, planning, diagnostics, status, handoff, and more
- **8 local skills** — planning gates, verification discipline, debugging workflow, adoption intake
- **Validation harness** — scenario-based testing for behavior and routing
- **Routing rules** — `AGENTS.md` tells OMO to prefer `gb-*` specialists when tasks match

## What coffeemix_all Does NOT Change

- Your provider configuration (API keys, model choices, local models)
- Your existing agents and categories
- Your project's source code
- Your OpenCode runtime settings

## Troubleshooting

### Validation fails after install

1. Check that all `.opencode/agents/` and `.opencode/skills/` files were copied correctly
2. Verify `oh-my-opencode.json` has all `gb-*` agent entries
3. Ensure the `oh-my-opencode` plugin is loaded in `opencode.json`
4. Run `python tools/workspace_smoke_runner.py` to see which specific checks fail

### Sisyphus doesn't route to gb-* specialists

1. Confirm `AGENTS.md` exists in your project root
2. Check that `oh-my-opencode.json` has the `gb-*` agent definitions
3. Restart OpenCode to pick up config changes

## License

See the repository root for license information.
