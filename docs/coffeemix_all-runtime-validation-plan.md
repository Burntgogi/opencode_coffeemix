# coffeemix_all Runtime Validation Plan

**Date**: 2026-04-02

## Goal

Make `opencode_coffeemix_all_sandbox` runnable and testable as the `coffeemix_all` sandbox candidate.

## Scope

1. add coffeemix_all-specific entry scripts,
2. port smoke/e2e validation tooling,
3. run validation against the coffeemix_all workspace,
4. record evidence.

## Validation target

The coffeemix_all sandbox should prove:
- root config is usable,
- `.opencode/` runtime surface is visible,
- CoffeeMix agents can still be discovered through config/file inspection,
- smoke/e2e tooling can run from the coffeemix_all workspace alone.

## Success criteria

- coffeemix_all entry scripts exist,
- smoke runner succeeds,
- stricter e2e runner succeeds,
- reports are written under coffeemix_all `reports/`.
