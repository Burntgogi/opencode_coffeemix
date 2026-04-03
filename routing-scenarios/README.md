# Routing Scenarios

Identity-prompt routing validation scenarios.

Each scenario asks "which specialist should handle X?" and verifies the response matches the expected `cc-*` agent (positive) or avoids the wrong one (negative).

Used by:
- `tools/routing_validation_runner.py` (all files)

Coverage: 14 specialists × 2 (positive/negative) = 28 scenarios, all PASS.
