# Evidence — Phase A-D Refactoring

**Workspace**: `C:\Work\claude_pickup\opencode_coffeemix_all_sandbox`
**Date**: 2026-04-03
**Purpose**: record all refactoring across cleanup, harness extraction, docs consolidation, and AGENTS.md update

---

## Phase A — Cleanup

| # | Action | Result |
|---|---|---|
| A-1 | `.gitignore` updated | `node_modules/`, `__pycache__/`, `*.pyc`, `reports/` excluded |
| A-2 | `archive/` removed | Empty folder deleted |
| A-3 | `reports/` gitignored | Generated artifacts no longer tracked |

## Phase B — Harness engineering

| # | Action | Result |
|---|---|---|
| B-1 | `tools/harness.py` extracted | Shared module: `run_command`, `evaluate_scenario`, `check_files`, report writers |
| B-2 | Type hints added | All functions typed with `from __future__ import annotations` |
| B-3 | `OPENCODE_BIN` env var | Fallback search across common paths, env override supported |
| B-4 | 3 runners refactored | `sandbox_smoke_runner.py`, `sandbox_e2e_runner.py`, `routing_validation_runner.py` all use harness |

## Phase C — Docs consolidation

| # | Action | Result |
|---|---|---|
| C-1 | Routing evidence merged | `evidence-routing-validation.md` canonical, `evidence-routing-expansion.md` deleted |
| C-2 | README deduplicated | `docs/README.md` lightweight pointer, `docs/superpower/README.md` detailed index |
| C-3 | Scenario roles documented | `scenarios/README.md` and `routing-scenarios/README.md` explain purpose |

## Phase D — AGENTS.md update

| # | Action | Result |
|---|---|---|
| D-1 | Harness section added | Agents now know about `tools/` runners, scenario folders, and `OPENCODE_BIN` |

## Validation

- All 3 runners pass after refactoring
- No stale references remain
- `archive/` folder removed
- `reports/` no longer tracked by git

## Result

- pass

## Out of scope

- Global OpenCode configuration
- `oh-my-opencode.json` edits
- Plugin/bootstrap automation
