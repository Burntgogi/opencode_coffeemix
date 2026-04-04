# coffeemix_all Traceability Matrix

**Workspace**: `C:\Work\claude_pickup\opencode_coffeemix_all_sandbox`
**Status**: partially executed — first-wave skills implemented, authority rule added
**Purpose**: map current authority docs to implemented assets, evidence, and decision points

---

## 1. Source-to-output matrix

| Source | Current role | Future output it informs |
|---|---|---|
| `01-coffeemix_all-gap-analysis.md` | defines what is missing | skill priorities, authority reflection priorities |
| `02-coffeemix_all-tdd-verification-discipline.md` | defines target operating behavior | skill content, workflow evidence rules |
| `03-coffeemix_all-sandbox-file-map.md` | defines local ownership | future file placement and plugin/doc references |
| `04-coffeemix_all-master-plan.md` | unifies strategy | rollout order, index docs, future implementation framing |
| `05-coffeemix_all-workflow.md` | defines execution sequence | workflow adoption evidence |
| `06-coffeemix_all-diagrams.md` | defines visual orientation | review/communication artifacts |
| `07-coffeemix_all-local-skill-drafts.md` | defines skill design intent | `.opencode/skills/test-driven-development/SKILL.md` ✅ implemented |
| `08-coffeemix_all-agents-routing-reflections.md` | defines authority reflection proposals | `AGENTS.md` minimal rule added ✅ |
| `09-coffeemix_all-evidence-validation-plan.md` | defines validation pack | pilot + large-task evidence docs ✅ |
| `10-coffeemix_all-adoption-sequence.md` | defines rollout order | phased implementation planning |

---

## 2. Authority-to-evidence matrix

| Authority doc | What evidence validated it |
|---|---|
| `07-coffeemix_all-local-skill-drafts.md` | `17-coffeemix_all-first-wave-skill-rollout.md` + 3 pilot evidence docs |
| `08-coffeemix_all-agents-routing-reflections.md` | `18-coffeemix_all-authority-reflection-judgment.md` (minimal rule added) |
| `05-coffeemix_all-workflow.md` | `evidence-large-task-01-state-reconciliation.md` |
| `09-coffeemix_all-evidence-validation-plan.md` | `evidence-final-consolidated-summary.md` |

---

## 3. Decision traceability

The most important decisions and their traceability:

1. **Why new skills?** → `01`, `02`, `07` → implemented in `.opencode/skills/`
2. **Why preserve existing specialists?** → `01`, `03`, `04` → specialists unchanged
3. **Why minimal AGENTS.md rule?** → `04`, `08`, `10` + expanded routing evidence → one rule added
4. **Why evidence-first adoption?** → `02`, `05`, `09` → 9 evidence docs produced

---

## 4. Non-goals

This matrix makes implemented changes auditable by tracing each back to its authority document.

---

## 5. Bottom line

This matrix makes the implemented changes auditable:

- which document justified the change,
- which file carries it,
- and which evidence proves it.
