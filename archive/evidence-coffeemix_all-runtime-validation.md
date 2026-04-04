# Evidence —Mix Runtime Validation

**Date**: 2026-04-02

## Scope completed

This validation covered:
1. mix entry scripts,
2. smoke/e2e runner migration,
3. actual runtime validation from the mix workspace,
4. report generation inside the mix workspace.

## Added runtime entry files

- `open-sandbox-opencode.cmd`
- `enter-sandbox.ps1`
- `exit-sandbox.ps1`

These target:

`C:\Work\claude_pickup\opencode_coffeemix_all_sandbox`

and force:

`OPENCODE_CONFIG_DIR=C:\Work\claude_pickup\opencode_coffeemix_all_sandbox`

## Added validation assets

### Planning
- `docs/coffeemix_all-runtime-validation-plan.md`

### Tools
- `tools/sandbox_smoke_runner.py`
- `tools/sandbox_e2e_runner.py`

### Scenarios
- 10 scenario files under `scenarios/`

## Mix validation results

### Smoke
Report:
- `reports/sandbox-smoke-report.md`

Observed result:
- PASS `gb-review`
- PASS `gb-share`
- PASS `gb-statusline`

### Stricter E2E
Report:
- `reports/sandbox-e2e-report.md`

Observed result:
- PASS agents visible
- PASS skills visible
- PASS `gb-commit`
- PASS `gb-review`
- PASS `gb-debug`
- PASS `gb-ultraplan`
- PASS `gb-teleport`
- PASS `gb-plugin`
- PASS `gb-memory`
- PASS `gb-config`
- PASS `gb-share`
- PASS `gb-statusline`

## Conclusion

`opencode_coffeemix_all_sandbox` is now not only scaffolded, but also runnable and validated as `coffeemix_all`.

It has:
- a cleaner upstream-style runtime layout,
- local entry scripts,
- migrated validation tooling,
- passing smoke checks,
- passing stricter e2e checks.

This makes it the stronger candidate for future sandbox-first work compared to the original mixed root sandbox.
