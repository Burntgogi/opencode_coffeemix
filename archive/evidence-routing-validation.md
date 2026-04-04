# Evidence —Routing Validation

**Date**: 2026-04-02
**Updated**: 2026-04-03

## Scope

Added explicit positive/negative routing tests for all fourteen CoffeeMix specialists:
- `gb-review`
- `gb-debug`
- `gb-ultraplan`
- `gb-config`
- `gb-share`
- `gb-statusline`
- `gb-memory`
- `gb-commit`
- `gb-worktree`
- `gb-resume`
- `gb-doctor`
- `gb-teleport`
- `gb-plugin`
- `gb-compact`

## Added artifacts

### Plan
- `docs/routing-validation-plan.md`

### Scenarios
- `routing-scenarios/01-gb-review-positive.json`
- `routing-scenarios/02-gb-review-negative.json`
- `routing-scenarios/03-gb-debug-positive.json`
- `routing-scenarios/04-gb-debug-negative.json`
- `routing-scenarios/05-gb-ultraplan-positive.json`
- `routing-scenarios/06-gb-ultraplan-negative.json`
- `routing-scenarios/07-gb-config-positive.json`
- `routing-scenarios/08-gb-config-negative.json`
- `routing-scenarios/09-gb-share-positive.json`
- `routing-scenarios/10-gb-share-negative.json`
- `routing-scenarios/11-gb-statusline-positive.json`
- `routing-scenarios/12-gb-statusline-negative.json`
- `routing-scenarios/13-gb-memory-positive.json`
- `routing-scenarios/14-gb-memory-negative.json`
- `routing-scenarios/15-gb-commit-positive.json`
- `routing-scenarios/16-gb-commit-negative.json`
- `routing-scenarios/17-gb-worktree-positive.json`
- `routing-scenarios/18-gb-worktree-negative.json`
- `routing-scenarios/19-gb-resume-positive.json`
- `routing-scenarios/20-gb-resume-negative.json`
- `routing-scenarios/21-gb-doctor-positive.json`
- `routing-scenarios/22-gb-doctor-negative.json`
- `routing-scenarios/23-gb-teleport-positive.json`
- `routing-scenarios/24-gb-teleport-negative.json`
- `routing-scenarios/25-gb-plugin-positive.json`
- `routing-scenarios/26-gb-plugin-negative.json`
- `routing-scenarios/27-gb-compact-positive.json`
- `routing-scenarios/28-gb-compact-negative.json`

### Runner
- `tools/routing_validation_runner.py` (refactored to use `tools/harness.py`)

### Reports
- `reports/routing-validation-report.md`
- `reports/routing-validation-results.json`

## Results

All twenty-eight routing scenarios passed.

### Positive routing
- focused code review -> `gb-review`
- bug root-cause investigation -> `gb-debug`
- phased architecture planning -> `gb-ultraplan`
- effective config review -> `gb-config`
- concise session export -> `gb-share`
- concise runtime/config snapshot -> `gb-statusline`
- durable memory extraction -> `gb-memory`
- conventional commit messages -> `gb-commit`
- git worktree management -> `gb-worktree`
- session resume and continuation -> `gb-resume`
- system diagnostics and health checks -> `gb-doctor`
- context switching with state preservation -> `gb-teleport`
- plugin discovery and management -> `gb-plugin`
- session compaction and summarization -> `gb-compact`

### Negative routing
- broad migration strategy discussion -> not `gb-review` (returned `gb-ultraplan`)
- high-level architecture tradeoff discussion -> not `gb-debug` (returned `oracle`)
- focused code review snippet -> not `gb-ultraplan` (returned `gb-review`)
- session export request -> not `gb-config` (returned `gb-share`)
- config review request -> not `gb-share` (returned `gb-config`)
- memory extraction request -> not `gb-statusline` (returned `gb-memory`)
- runtime/config snapshot request -> not `gb-memory` (returned `gb-statusline`)
- architecture migration plan -> not `gb-commit` (returned `gb-ultraplan`)
- focused code review -> not `gb-worktree` (returned `gb-review`)
- runtime/config status snapshot -> not `gb-resume` (returned `gb-statusline`)
- durable memory extraction -> not `gb-doctor` (returned `gb-memory`)
- conventional commit messages -> not `gb-teleport` (returned `gb-commit`)
- bug root-cause investigation -> not `gb-plugin` (returned `gb-debug`)
- effective config review -> not `gb-compact` (returned `gb-config`)

## Meaning

Routing validation now covers all fourteen `gb-*` specialists through identity-prompt scenarios.

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
