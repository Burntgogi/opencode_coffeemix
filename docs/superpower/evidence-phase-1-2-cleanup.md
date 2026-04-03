# Evidence — Phase 1-2 Documentation Cleanup

**Workspace**: `C:\Work\claude_pickup\opencode_coffeemix_all_sandbox`
**Date**: 2026-04-03
**Purpose**: record all documentation consistency fixes applied after the full rollout

---

## 1. Phase 1 fixes (Critical — stale/contradictory docs)

| # | File | Issue | Fix applied |
|---|---|---|---|
| 1 | `docs/superpower/README.md` | Missing doc 19 + 5 evidence docs, status at 01~18 | Added 19 + 8 evidence docs, updated status |
| 2 | `03-coffeemix_all-sandbox-file-map.md` | "skills do not exist" vs "implemented" contradiction | Changed to "all three discipline skills now implemented" |
| 3 | `06-coffeemix_all-diagrams.md` | 3 implemented skills labeled "future" | Changed to "implemented", updated Phase 6 diagram |
| 4 | `11-coffeemix_all-traceability-matrix.md` | `07`/`09` described as future-only | Updated to show implemented assets and evidence |
| 5 | `13-coffeemix_all-review-integration-delta.md` | "current set is 01~15" | Changed to "01~19" with evidence docs |
| 6 | `docs/evidence-routing-validation.md` | "still not complete for all cc-* agents" | Clarified: identity-prompt routing complete, ambiguous-task routing remains |
| 7 | `docs/evidence-integration-guide-self-audit.md` | "Many cc-* agents do not yet have routing tests" | Updated: all 14 covered, ambiguous-task routing remains |

## 2. Phase 2 fixes (Medium — status booleans)

| # | File | Issue | Fix applied |
|---|---|---|---|
| 8 | `07-coffeemix_all-local-skill-drafts.md` | brainstorming "still deferred" | Changed to "evaluated and rejected" with link to doc 19 |
| 9 | `02-coffeemix_all-tdd-verification-discipline.md` | Skills listed as "proposed future" | Changed to "implemented" with checkmarks |
| 10 | `14-coffeemix_all-pre-implementation-change-package.md` | "planning only" status | Changed to "partially executed", updated all packages |
| 11 | `15-coffeemix_all-adoption-readiness-gate.md` | Checklist all unchecked | Updated to checked + added broader rollout section |
| 12 | `evidence-large-task-02-authority-reflection-decision.md` | `18` reference outdated | Added clarification that `18` was later updated |
| 13 | `README.md` | Doc tree behind actual state | Updated to 01~19 + 8 evidence docs |
| 14 | `docs/README.md` | Doc tree behind actual state | Updated to 01~19 + 8 evidence docs |

## 3. Phase 2-7: Smoke/e2e reports regenerated

- `reports/sandbox-smoke-report.md` — regenerated with correct workspace path
- `reports/sandbox-e2e-report.md` — regenerated with correct workspace path
- `reports/sandbox-smoke-results.json` — inventory now shows 24 agents, 7 skills
- `reports/sandbox-e2e-results.json` — inventory now shows 24 agents, 7 skills

## 4. Result

- pass

## 5. Open risks

- Routing scenarios are still identity-prompt only, not ambiguous-task
- Some lower-priority docs may still contain older narrative framing
- `archive/` and `commands/` references in older docs point to non-existent surfaces

## 6. Out of scope

- Global OpenCode configuration
- `oh-my-opencode.json` edits
- Plugin/bootstrap automation
