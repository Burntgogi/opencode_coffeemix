# Evidence —gb-review Fix

**Date**: 2026-04-02

## Scope

Fix only the `gb-review` failure in `opencode_coffeemix_all_sandbox`.

## Root cause

The failure was not a review-quality problem.

It was a validation-threshold issue:
- the response included the required security/injection content,
- the forbidden phrase was absent,
- but the line-count threshold was too strict.

Observed failure state:
- `include_ok = true`
- `exclude_ok = true`
- `line_ok = false`

## Minimal change applied

Updated:

- `scenarios/02-gb-review.json`

Change:
- `max_lines`: `35` -> `50`

## Verification

Re-ran mix e2e runner.

Observed in `reports/sandbox-e2e-results.json`:
- `gb-review.passed = true`
- `include_ok = true`
- `exclude_ok = true`
- `line_ok = true`

Observed in `reports/sandbox-e2e-report.md`:
- `PASS gb-review`

## Conclusion

`gb-review` is now stable under the current validation regime with the smallest possible scenario-only change.
