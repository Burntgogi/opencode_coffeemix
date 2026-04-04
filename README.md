# coffeemix_all Workspace

This workspace is the sandbox-local `coffeemix_all` OpenCode + OMO environment, with CoffeeMix layered on top for local workflow, routing, and validation work.

## Start here

- Workspace rules and routing priorities: [`AGENTS.md`](./AGENTS.md)
- Main documentation index: [`docs/README.md`](./docs/README.md)
- Ordered planning and evidence set: [`docs/superpower/README.md`](./docs/superpower/README.md)

## Purpose and scope

- sandbox-local OMO/CoffeeMix workflow work
- documentation-first planning and evidence capture
- local skill and routing discipline for non-trivial sandbox changes
- validation of task scenarios and specialist routing behavior

## Current structure

- `docs/` holds the main workspace docs and evidence docs
- `docs/superpower/` holds the ordered `01` to `19` plan set plus 9 evidence docs
- `.opencode/skills/` currently holds 8 local skills:
  - `ask-user-question`
  - `compact-context`
  - `enter-plan-mode`
  - `integration-intake`
  - `systematic-debugging`
  - `test-driven-development`
  - `tool-search`
  - `verification-before-completion`

Current doc grouping stays lightweight:

- `01` to `15` are planning, workflow, readiness, and pre-implementation docs
- `16` to `18` record first-wave implementation and authority judgment
- `19` records the brainstorming skill evaluation, evaluated and deferred
- the evidence docs capture pilot usage, larger task evidence, cleanup/refactoring evidence, brainstorming evaluation, and the consolidated summary

## Validation surface

- `tools/harness.py` is the shared validation runner
- `tools/sandbox_smoke_runner.py` covers smoke checks and subset scenarios
- `tools/sandbox_e2e_runner.py` covers full scenario validation
- `tools/routing_validation_runner.py` covers routing validation for 28 identity-prompt scenarios across 14 `gb-*` specialists
- `scenarios/` holds task-based scenarios
- `routing-scenarios/` holds routing scenarios
- `reports/` holds generated validation output

## Current capabilities

- 14 `gb-*` specialists are the preferred narrow specialists when a task matches exactly
- OMO remains the control plane for broad or mixed work
- `integration-intake` gates new Claude-derived integration proposals before planning or implementation
- the local workflow keeps intake, readiness, status, and verification as separate concerns
- only verification counts as completion proof after the final change

## Non-goal

This workspace does not imply global runtime adoption or broad feature parity work. All workflow, evidence, and validation claims here are sandbox-local only.

## Dependencies

This workspace is designed to run with [oh-my-openagent](https://github.com/code-yeongyu/oh-my-openagent), which is licensed under the Sustainable Use License v1.0.

## Origin of Components

| Prefix / Source | Origin |
|---|---|
| `gb-*` specialists | Original to coffeemix_all ("gb" = 가베, old Korean word for coffee) |
| Local discipline skills | Adapted locally from [obra/superpowers](https://github.com/obra/superpowers) |
| `integration-intake` | coffeemix_all local adoption gate for Claude-derived integrations |
| Baseline agents (`sisyphus`, `oracle`, `librarian`, etc.) | Provided by [oh-my-openagent](https://github.com/code-yeongyu/oh-my-openagent) |
| Command and workflow inspiration | [Claude Code](https://github.com/anthropics/claude-code) by Anthropic |

All specialist prompts, local skills, validation scripts, and routing scenarios in this repository are independently authored workspace-local artifacts.
