# coffeemix_all Workspace

This workspace is the `coffeemix_all` sandbox clone for continued OMO/CoffeeMix work without disturbing the original `opencodeCC_sandbox_mix` folder.

## Start here

- Workspace rules: [`AGENTS.md`](./AGENTS.md)
- Main documentation index: [`docs/README.md`](./docs/README.md)
- coffeemix_all planning set: [`docs/superpower/README.md`](./docs/superpower/README.md)

## Scope

- workspace-local experimentation
- documentation-first planning
- first-wave implementation of discipline skills
- routing validation for all 14 CoffeeMix specialists

## Current doc groups

- general sandbox docs under `docs/`
- ordered coffeemix_all plan docs under `docs/superpower/` (`01~19` + 8 evidence docs)

Current state:

- `01~15` capture planning, readiness, and pre-implementation framing
- `16~18` capture first-wave implementation, rollout evidence framing, and authority judgment
- `19` captures the brainstorming skill evaluation (evaluated and deferred)
- `docs/superpower/evidence-pilot-01~03` capture real local pilot usage and proof
- `docs/superpower/evidence-large-task-01~02` capture multi-file task evidence
- `docs/superpower/evidence-routing-expansion` captures routing expansion to 14 specialists
- `docs/superpower/evidence-brainstorming-evaluation` captures the brainstorming decision
- `docs/superpower/evidence-final-consolidated-summary` is the consolidated evidence summary

## Non-goal

This workspace does not imply global runtime adoption; implementation and evidence here are sandbox-local only.

## Dependencies

This workspace is designed to run with [oh-my-openagent](https://github.com/code-yeongyu/oh-my-openagent),
which is licensed under the Sustainable Use License v1.0.

## Origin of Components

| Prefix / Source | Origin |
|---|---|
| `gb-*` specialists | Original to coffeemix_all ("gb" = 가베, old Korean word for coffee) |
| Discipline skills (TDD, verification, debugging) | Adapted from [obra/superpowers](https://github.com/obra/superpowers) |
| Baseline agents (sisyphus, oracle, librarian, etc.) | Provided by [oh-my-openagent](https://github.com/code-yeongyu/oh-my-openagent) |
| Command concept inspiration | [Claude Code](https://github.com/anthropics/claude-code) by Anthropic |

All specialist prompts, validation scripts, and routing scenarios in this repository
are independently authored works.
