# Scenarios

Task-based validation scenarios for smoke and e2e runners.

Each scenario file defines a realistic prompt with `must_include` / `must_exclude` / `max_lines` constraints.

Used by:
- `tools/sandbox_smoke_runner.py` (subset: gb-review, gb-share, gb-statusline)
- `tools/sandbox_e2e_runner.py` (all files)
