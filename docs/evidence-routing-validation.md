# Evidence — Routing Validation

**Date**: 2026-04-02
**Updated**: 2026-04-03

## Scope

Added explicit positive/negative routing tests for all fourteen CoffeeMix specialists:
- `cc-review`
- `cc-bughunter`
- `cc-ultraplan`
- `cc-config`
- `cc-share`
- `cc-statusline`
- `cc-memory`
- `cc-commit`
- `cc-worktree`
- `cc-resume`
- `cc-doctor`
- `cc-teleport`
- `cc-plugin`
- `cc-compact`

## Added artifacts

### Plan
- `docs/routing-validation-plan.md`

### Scenarios
- `routing-scenarios/01-cc-review-positive.json`
- `routing-scenarios/02-cc-review-negative.json`
- `routing-scenarios/03-cc-bughunter-positive.json`
- `routing-scenarios/04-cc-bughunter-negative.json`
- `routing-scenarios/05-cc-ultraplan-positive.json`
- `routing-scenarios/06-cc-ultraplan-negative.json`
- `routing-scenarios/07-cc-config-positive.json`
- `routing-scenarios/08-cc-config-negative.json`
- `routing-scenarios/09-cc-share-positive.json`
- `routing-scenarios/10-cc-share-negative.json`
- `routing-scenarios/11-cc-statusline-positive.json`
- `routing-scenarios/12-cc-statusline-negative.json`
- `routing-scenarios/13-cc-memory-positive.json`
- `routing-scenarios/14-cc-memory-negative.json`
- `routing-scenarios/15-cc-commit-positive.json`
- `routing-scenarios/16-cc-commit-negative.json`
- `routing-scenarios/17-cc-worktree-positive.json`
- `routing-scenarios/18-cc-worktree-negative.json`
- `routing-scenarios/19-cc-resume-positive.json`
- `routing-scenarios/20-cc-resume-negative.json`
- `routing-scenarios/21-cc-doctor-positive.json`
- `routing-scenarios/22-cc-doctor-negative.json`
- `routing-scenarios/23-cc-teleport-positive.json`
- `routing-scenarios/24-cc-teleport-negative.json`
- `routing-scenarios/25-cc-plugin-positive.json`
- `routing-scenarios/26-cc-plugin-negative.json`
- `routing-scenarios/27-cc-compact-positive.json`
- `routing-scenarios/28-cc-compact-negative.json`

### Runner
- `tools/routing_validation_runner.py` (refactored to use `tools/harness.py`)

### Reports
- `reports/routing-validation-report.md`
- `reports/routing-validation-results.json`

## Results

All twenty-eight routing scenarios passed.

### Positive routing
- focused code review -> `cc-review`
- bug root-cause investigation -> `cc-bughunter`
- phased architecture planning -> `cc-ultraplan`
- effective config review -> `cc-config`
- concise session export -> `cc-share`
- concise runtime/config snapshot -> `cc-statusline`
- durable memory extraction -> `cc-memory`
- conventional commit messages -> `cc-commit`
- git worktree management -> `cc-worktree`
- session resume and continuation -> `cc-resume`
- system diagnostics and health checks -> `cc-doctor`
- context switching with state preservation -> `cc-teleport`
- plugin discovery and management -> `cc-plugin`
- session compaction and summarization -> `cc-compact`

### Negative routing
- broad migration strategy discussion -> not `cc-review` (returned `cc-ultraplan`)
- high-level architecture tradeoff discussion -> not `cc-bughunter` (returned `oracle`)
- focused code review snippet -> not `cc-ultraplan` (returned `cc-review`)
- session export request -> not `cc-config` (returned `cc-share`)
- config review request -> not `cc-share` (returned `cc-config`)
- memory extraction request -> not `cc-statusline` (returned `cc-memory`)
- runtime/config snapshot request -> not `cc-memory` (returned `cc-statusline`)
- architecture migration plan -> not `cc-commit` (returned `cc-ultraplan`)
- focused code review -> not `cc-worktree` (returned `cc-review`)
- runtime/config status snapshot -> not `cc-resume` (returned `cc-statusline`)
- durable memory extraction -> not `cc-doctor` (returned `cc-memory`)
- conventional commit messages -> not `cc-teleport` (returned `cc-commit`)
- bug root-cause investigation -> not `cc-plugin` (returned `cc-bughunter`)
- effective config review -> not `cc-compact` (returned `cc-config`)

## Meaning

Routing validation now covers all fourteen `cc-*` specialists through identity-prompt scenarios.

The remaining gap is that these scenarios prove identity-level routing, not ambiguous or multi-step task routing.

But the specialist-routing pattern has now been proven for all fourteen CoffeeMix specialists:
- review
- bug investigation
- phased planning
- config inspection
- session export
- concise status display
- durable memory extraction
- conventional commit messages
- git worktree management
- session resume and continuation
- system diagnostics and health checks
- context switching with state preservation
- plugin discovery and management
- session compaction and summarization
