# coffeemix_all 0.2 Workspace Rules

This workspace is `opencode_coffeemix_all_0_2`, the OpenCode + OMO workspace for coffeemix_all 0.2.

## Core rule

OMO / oh-my-openagent remains the baseline control plane. Do not replace OMO orchestration, category routing, model routing, skill loading, MCP loading, baseline built-in skill stack, or global installation behavior from this package.

## Install and update documentation rule

Document fresh installs and CoffeeMix 0.1 to 0.2 updates as separate paths.

- Fresh install uses the default installer path. It is additive and skip-only for existing files.
- Existing CoffeeMix 0.1 users must use the explicit CoffeeMix-owned update mode with `-UpdateCoffeeMix` and `-BackupDir` once those installer flags are present.
- Always document `-WhatIf` preview before a real install or update.
- For mock validation, `-ConfigDir` must point at a mock OpenCode config directory that contains OMO config, not at the package root.
- Update docs must include backup, rollback, post-update verification, and a warning that a plain install may leave old CoffeeMix 0.1 content in place.
- Do not claim automatic CoffeeMix update behavior unless `install-global.ps1` supports it.
- Documentation work must not touch global config, agents, skills, plugins, package payload files, or generated reports unless the user explicitly asks for that scope.

## CoffeeMix-first precedence

When a task exactly matches a CoffeeMix `gb-*` specialist, prefer that protected first-class `gb-*` agent before a broader baseline OMO agent. Broad orchestration still belongs to OMO baseline agents such as `sisyphus`, `oracle`, `metis`, `prometheus`, `momus`, `librarian`, and `explore`.

## Protected gb-* specialists

Keep all 14 `gb-*` specialists:

- `gb-review`, `gb-debug`, `gb-ultraplan`, `gb-commit`, `gb-worktree`, `gb-resume`, `gb-doctor`, `gb-memory`, `gb-config`, `gb-share`, `gb-statusline`, `gb-teleport`, `gb-plugin`, `gb-compact`.

Doc 21 refines boundaries but deletes none. Modification candidates are `gb-review`, `gb-debug`, `gb-ultraplan`, `gb-resume`, `gb-memory`, `gb-share`, `gb-config`, `gb-plugin`, and `gb-compact`. Keep-as-is candidates are `gb-commit`, `gb-worktree`, `gb-doctor`, `gb-statusline`, and `gb-teleport`.

## Local skills and validation discipline

Keep all 8 local skills and use them as workflow discipline, not duplicate agents:

- `ask-user-question`, `compact-context`, `enter-plan-mode`, `integration-intake`, `systematic-debugging`, `test-driven-development`, `tool-search`, `verification-before-completion`.

For non-trivial local changes, define a red state, make the smallest useful change, and collect fresh proof with targeted reads/searches or the local harness when safe.

## superpowers / gstack attachment rule

superpowers and gstack are upstream references, not replacement control planes. Attach only selective guidance/adapters that strengthen existing CoffeeMix workflows:

- superpowers: workflow discipline, skill authoring habits, bootstrap documentation.
- gstack: optional future adapter ideas for GBrain, browser, design, tool substrate, and checkpoint mode.

Do not claim actual implementation of GBrain, shared browser/daemon, checkpoint mode, or design runtime in this package.

## Explicit rejections

Reject OMO replacement, copied router/model/loader logic, deprecated command shims, duplicate default agents, default checkpoint commits, `gb-*` deletion, and full superpowers/gstack parity claims.

## Validation boundary

Verify files inside this package only. Do not modify `opencode_coffeemix_all_0_1`, `opencode_coffeemix_all_0_2_SuperGstack`, `opencode_coffeemix_all_sandbox`, or global OMO config.
