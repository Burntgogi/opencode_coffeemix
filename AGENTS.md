# coffeemix_all Workspace Rules

This workspace is the `coffeemix_all` OpenCode + OMO sandbox with CoffeeMix layered on top.

## Core rule
OMO remains the control plane, but when a task matches a CoffeeMix specialist exactly, prefer the `gb-*` specialist over a broader baseline agent.

## Prefer these CoffeeMix specialists first
- `gb-review` for focused code review
- `gb-debug` for bug/root-cause investigation
- `gb-ultraplan` for phased architecture or migration planning
- `gb-commit` for commit-message and staging guidance
- `gb-worktree` for git worktree workflows
- `gb-resume` for restoring interrupted work
- `gb-doctor` for quick project diagnostics
- `gb-memory` for durable session memory extraction
- `gb-config` for config/effective-settings review
- `gb-share` for concise handoff/export summaries
- `gb-statusline` for quick sandbox/project status summaries
- `gb-teleport` for context switching between branches/worktrees/tasks
- `gb-plugin` for plugin evaluation/management
- `gb-compact` for compacting long context into a resumable summary

## Baseline OMO agents still own broad work
- `sisyphus`: orchestration and overall task steering
- `oracle`: high-level reasoning when the problem exceeds a specialist task
- `metis`: request interpretation and strategic framing
- `prometheus` / `momus`: broad evaluation and critique
- `librarian`: external docs and references
- `explore`: codebase exploration

## Routing rules
1. If a task clearly matches a `gb-*` specialist, choose that specialist first.
2. If a task is broad or mixed, Sisyphus may orchestrate multiple specialists.
3. Do not answer inventory questions from memory if sandbox files can be read.
4. For sandbox checks, prefer reading `oh-my-opencode.json`, `.opencode/agents/`, and `.opencode/skills/` directly.
5. Treat this workspace as sandbox-only; do not assume global config is authoritative here.
6. For non-trivial sandbox-local changes, apply the local discipline skills before declaring completion: define a red state with `test-driven-development`, collect fresh proof with `verification-before-completion`, and use `systematic-debugging` when the cause of a failure is unclear.

## Specialist context

All `gb-*` specialists share these workspace-level constraints:
- Routing is governed by the rules in this file
- Validation uses `tools/harness.py` + `scenarios/` + `routing-scenarios/`
- When in doubt, prefer the smallest possible change

## Validation harness

This workspace includes a self-validation harness under `tools/`:

- `tools/harness.py` — shared runner module (subprocess execution, scenario evaluation, report writing)
- `tools/sandbox_smoke_runner.py` — smoke checks (file existence, inventory, subset scenarios)
- `tools/sandbox_e2e_runner.py` — full e2e validation (all scenarios, strict include/exclude/line checks)
- `tools/routing_validation_runner.py` — routing validation (28 identity-prompt scenarios, 14 specialists)

When verifying sandbox health or validating changes:
- Run the appropriate runner instead of manual checks
- Reports are written to `reports/` (gitignored)
- Scenarios live in `scenarios/` (task-based) and `routing-scenarios/` (identity-prompt routing)
- `OPENCODE_BIN` env var overrides the default path; fallback searches common locations
