# Routing Validation Plan

Validate whether OMO/Sisyphus prefers the right CoffeeMix specialist when the task clearly matches, and does not over-route for broader neighboring tasks.

Targets:
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

Each target gets:
- one positive routing prompt
- one negative routing prompt

Pass rule:
- positive prompt returns the expected `gb-*` agent name
- negative prompt does not return the disallowed specialist
