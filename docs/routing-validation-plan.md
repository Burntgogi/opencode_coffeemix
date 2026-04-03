# Routing Validation Plan

Validate whether OMO/Sisyphus prefers the right CoffeeMix specialist when the task clearly matches, and does not over-route for broader neighboring tasks.

Targets:
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

Each target gets:
- one positive routing prompt
- one negative routing prompt

Pass rule:
- positive prompt returns the expected `cc-*` agent name
- negative prompt does not return the disallowed specialist
