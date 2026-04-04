# Superpowers-Derived Workflow for the Local OMO/CoffeeMix Sandbox

**Workspace**: `C:\Work\claude_pickup\opencode_coffeemix_all_sandbox`  
**Purpose**: operationalize the master plan into a repeatable workflow for future sandbox work

---

## 1. Authority chain

This workflow is derived from:

1. [`04-coffeemix_all-master-plan.md`](./04-coffeemix_all-master-plan.md)
2. [`02-coffeemix_all-tdd-verification-discipline.md`](./02-coffeemix_all-tdd-verification-discipline.md)
3. [`03-coffeemix_all-sandbox-file-map.md`](./03-coffeemix_all-sandbox-file-map.md)
4. [`01-coffeemix_all-gap-analysis.md`](./01-coffeemix_all-gap-analysis.md)

If those documents conflict, the authority order is:

- strategic direction: `04`
- discipline model: `02`
- file ownership and placement: `03`
- background reasoning and priority evidence: `01`

---

## 2. Workflow goal

The goal of this workflow is to ensure future superpowers-style rollout work in this sandbox follows a stable sequence:

1. identify the local problem,
2. define the plan and target evidence,
3. make the smallest useful change,
4. verify with fresh evidence,
5. capture the result clearly.

---

## 3. Entry conditions

Use this workflow when the task is:

- non-trivial,
- multi-step,
- related to sandbox discipline or integration,
- changing docs, skills, routing, plugins, or specialist behavior.

Do not use this as a heavy process for one-line trivial corrections.

---

## 4. Workflow stages

## Stage A — intake

**Purpose**: understand the request from local evidence before deciding how to act.

### Actions

1. read the relevant local files,
2. identify which existing doc or file already owns the topic,
3. classify the task as trivial or non-trivial,
4. identify whether the work is documentation-only or future implementation,
5. route Claude-derived integration proposals to `integration-intake`.

### Outputs

- clear task framing,
- known source files,
- scope boundary,
- initial status snapshot if needed.

### Evidence

- file paths inspected,
- explicit statement of scope.

### Boundary note

Stage A may produce intake framing and current-state notes, but it does not establish readiness and it does not count as verification.

---

## Stage B — planning gate

**Purpose**: prevent non-trivial work from starting without an explicit plan.

### Actions

1. define the target files,
2. define what success looks like,
3. identify risks and non-goals,
4. identify what verification will be required later.

### Outputs

- exact target files,
- acceptance criteria,
- verification checklist.

### Evidence

- plan artifact or plan summary,
- explicit mention of expected deliverables.

### Boundary note

The planning gate can support a later readiness judgment, but it still does not prove that the requested change succeeded.

---

## Stage C — red state / acceptance target

**Purpose**: define the failing or missing condition before making changes.

### Acceptable red states in this sandbox

- a required doc does not exist,
- a required skill does not exist,
- a routing or ownership rule is missing,
- an evidence artifact is missing,
- a validation check is currently failing.

### Outputs

- one concrete statement of what is missing or failing,
- one concrete statement of what will count as fixed.

### Evidence

- before-state note,
- missing-file or failing-check confirmation.

---

## Stage D — smallest useful change

**Purpose**: solve the defined problem with the smallest scope that satisfies the target.

### Actions

1. touch only the files needed for the current objective,
2. preserve OMO as control plane,
3. preserve CoffeeMix specialists as the primary local execution identities,
4. avoid premature automation if the discipline content is not yet stable.

### Outputs

- requested docs, skills, or policy changes,
- no unrelated edits.

### Evidence

- changed file list,
- explanation of what was intentionally left untouched.

---

## Stage E — verification

**Purpose**: prove the result after the final change.

Verification is intentionally narrower than intake, status reporting, or readiness review.

- intake asks what should be touched and which authority files matter,
- status reporting says what is currently done, verified, or still open,
- readiness asks whether broader work should start or expand,
- verification proves the requested deliverable now matches the target.

### Actions

1. verify the deliverables exist,
2. verify the contents match the requested role,
3. verify cross-links and consistency,
4. run diagnostics/tests/builds if the changed files require them,
5. distinguish new issues from pre-existing ones.

### Outputs

- fresh verification evidence,
- explicit pass/partial/block status.

### Evidence

- `read` output for docs,
- `lsp_diagnostics` for changed code files,
- build/test results where applicable.

---

## Stage F — completion and handoff

**Purpose**: close the task with evidence, boundaries, and next steps.

### Actions

1. summarize what changed,
2. summarize what was verified,
3. note any open risks,
4. identify the next likely file or phase if more rollout is planned.

### Outputs

- completion summary,
- next-step orientation.

The handoff may include a status summary, but that summary should reflect Stage E evidence rather than replace it.

### Evidence

- completion block,
- links to deliverables and validation output.

---

## 5. Loopbacks and escalation points

Loop back to an earlier stage when:

- the requested deliverable is still ambiguous,
- the planned file set is wrong,
- verification reveals a mismatch with the stated goal,
- repeated fixes suggest the root cause was not understood.

Escalate the task to stronger planning/review behavior when:

- it spans multiple modules,
- it changes policy or runtime behavior,
- it introduces a new local skill or plugin,
- it affects how OMO routes work.

---

## 6. Evidence expectations by work type

### Documentation work

- file existence,
- headings and structure,
- internal cross-links,
- consistency with source docs,
- no confusion between intake notes, readiness notes, and completion proof.

### Skill or agent definition work

- file existence,
- content role correctness,
- references to local authority files,
- diagnostics if syntax-bearing files are involved.

### Runtime/plugin/config work

- file correctness,
- configuration validation,
- targeted smoke checks,
- distinction between local and external scope.

---

## 7. Non-goals

This workflow does not:

- replace specialist routing,
- require every task to become heavyweight,
- justify work outside this workspace,
- allow completion claims without fresh evidence.

---

## 8. Companion documents

- For the unified strategy, read [`04-coffeemix_all-master-plan.md`](./04-coffeemix_all-master-plan.md)
- For the discipline model behind this workflow, read [`02-coffeemix_all-tdd-verification-discipline.md`](./02-coffeemix_all-tdd-verification-discipline.md)
- For the file ownership map, read [`03-coffeemix_all-sandbox-file-map.md`](./03-coffeemix_all-sandbox-file-map.md)
- For visual summaries, read [`06-coffeemix_all-diagrams.md`](./06-coffeemix_all-diagrams.md)

---

## 9. Bottom line

This workflow turns the master plan into a repeatable path:

**intake → plan → define red state → make smallest useful change → verify → hand off**

In that sequence, intake frames the work, readiness gates whether it should proceed, status summarizes its state, and verification alone proves completion.

That is the practical form of superpowers-style discipline in this sandbox.
