# Evidence —opencode_coffeemix_all_sandbox Scaffold

**Date**: 2026-04-02

## What was created

Created a cleaner upstream-style sandbox scaffold at:

`C:\Work\claude_pickup\opencode_coffeemix_all_sandbox`

## Runtime surface now present

### Root
- `AGENTS.md`
- `opencode.json`
- `tui.json`
- `oh-my-opencode.json`

### `.opencode/`
- `agents/`
- `commands/`
- `plugins/`
- `skills/`
- `package.json`

### Support surfaces
- `docs/`
- `tools/`
- `scenarios/`
- `reports/`
- `archive/`

## Active runtime content moved

Moved/copied into runtime surface:
- 14 CoffeeMix `gb-*` agents into `.opencode/agents/`
- active skills into `.opencode/skills/`
- CoffeeMix startup badge plugin into `.opencode/plugins/`
- TUI plugin path updated to `.opencode/plugins/coffeemix_all-badge.tsx`

## Validation performed

### Structure validation
Confirmed root contains:
- `.opencode/`
- `AGENTS.md`
- `opencode.json`
- `tui.json`
- `oh-my-opencode.json`

Confirmed `.opencode/` contains:
- `agents/`
- `commands/`
- `plugins/`
- `skills/`
- `package.json`

### Runtime file consistency check
Executed a file-based inventory check under:

`OPENCODE_CONFIG_DIR=C:\Work\claude_pickup\opencode_coffeemix_all_sandbox`

Observed result:
- 14 `gb-*` agents found in `oh-my-opencode.json`
- the same 14 `gb-*` agents found in `.opencode/agents/`
- counts are consistent across config and file layout

## Conclusion

`opencode_coffeemix_all_sandbox` now exists as the `coffeemix_all` upstream-style scaffold.

It is not yet the fully validated replacement sandbox, but it has:
- a separated runtime surface,
- a separated support surface,
- aligned CoffeeMix agent/config placement,
- and enough structure for the next round of runtime validation.
