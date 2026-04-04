# Session Handoff: sandbox baseline to public packaging

**Workspace:** `C:\Work\claude_pickup\opencode_coffeemix_all_sandbox`  
**Purpose:** hand off the current sandbox state to a new session that will stage, commit a baseline snapshot, and then prepare a public-facing packaging workspace.

---

## 1. What this session confirmed

This session checked whether the `coffeemix_all` sandbox is functioning as the intended blend of:

- OpenCode runtime shell
- OMO control plane / orchestration
- CoffeeMix `gb-*` specialist layer
- superpower-derived discipline skills
- Claude Code-derived ideas treated as reference-only patterns

### Working conclusion

The sandbox appears to be functioning correctly as a local working environment.

Evidence used in this session:

- session history showed OMO orchestration markers, background task handling, and todo-driven flow
- `oh-my-opencode.json` showed active `gb-*` specialist definitions
- docs and evidence files showed superpower-derived skills and CoffeeMix routing/validation structure
- local validation reports showed passing smoke/e2e/routing results after stale smoke output was refreshed

---

## 2. Concrete work completed in this session

### A. Refreshed stale smoke validation output

Problem found:

- `reports/sandbox-smoke-report.md` and `reports/sandbox-smoke-results.json` still reflected older `cc-*` naming
- current config, scenarios, and runners already used `gb-*`

Action taken:

- ran `python tools/sandbox_smoke_runner.py`

Result:

- smoke report now shows:
  - `gb-review`
  - `gb-share`
  - `gb-statusline`
- smoke JSON inventory now reflects the `gb-*` specialist surface

Implication:

- the older `cc-*` smoke artifacts were stale generated outputs, not a live runtime mismatch

### B. Added a current-state workflow and structure document

Created:

- `docs/coffeemix_all-current-workflow-and-structure.md`

Updated:

- `docs/README.md`

What the new doc contains:

- current-state summary
- Mermaid workflow diagram
- Mermaid structure/layering diagram
- current `gb-*` specialist surface
- current skill and discipline-skill surface
- current doc/evidence shape
- maintenance notes

Verification done in this session:

- file exists
- `docs/README.md` links to it
- document has 2 Mermaid blocks
- document contains no `cc-*` naming

---

## 3. Current repo state relevant to the next session

### Files changed or added in this session

- modified: `docs/README.md`
- added: `docs/coffeemix_all-current-workflow-and-structure.md`

### Generated outputs refreshed in this session

- `reports/sandbox-smoke-report.md`
- `reports/sandbox-smoke-results.json`

### Current cleanup note

One obvious untracked scratch candidate was observed during this session:

- `test_temp/`

Current judgment:

- `test_temp/` looks like a safe ignore/remove candidate
- `docs/**` should **not** be broadly treated as disposable, because in this repository many planning/evidence docs are currently part of the tracked source/history surface

---

## 4. Product / PD judgment from this session

### Important decision

This sandbox should be treated as:

- a **baseline internal workspace**, not
- a ready-to-publish GitHub open source package

Reason:

- it still contains a dense mix of planning docs, evidence docs, self-audit style docs, and internal operating context
- this is useful for production/history, but too heavy as a first public surface

### Recommended packaging model

- `opencode_coffeemix_all_sandbox` = baseline/original working source
- `opencode_coffeemix_all_0_1` = public-facing packaging workspace derived from the baseline

### Meaning of the planned snapshot commit

The snapshot commit is **not** a public release commit.

It is an internal anchor commit meaning:

> this is the preserved baseline state of the sandbox before public packaging work begins elsewhere

---

## 5. Agreed next-phase direction

The user clarified the intended flow:

1. keep the current sandbox as a baseline reference point
2. make a snapshot commit in this sandbox
3. close this workspace as the baseline for future comparison
4. create and work in `opencode_coffeemix_all_0_1`
5. reduce or relocate material that is not appropriate for external publication

---

## 6. Work intentionally not yet done

The following were discussed but **not yet executed** in this session:

1. create a detailed public-packaging plan that classifies files/docs as:
   - public-ready
   - archive-move candidates
   - remove/not-for-public candidates
2. create the baseline snapshot git commit
3. create `C:\Work\claude_pickup\opencode_coffeemix_all_0_1`
4. perform the public-facing packaging edits in that new folder

---

## 7. Recommended starting checklist for the next session

### Step 1: inspect current git state

Focus on:

- `docs/README.md`
- `docs/coffeemix_all-current-workflow-and-structure.md`
- whether `test_temp/` should be deleted or ignored before snapshot

### Step 2: write the packaging classification plan

Produce one Markdown plan that classifies the current repository surface into:

- keep public
- move to archive/internal-history
- exclude from public package

### Step 3: create the baseline snapshot commit

Suggested commit intent:

- snapshot sandbox before public packaging

This should capture the current sandbox as the baseline source state.

### Step 4: create the public-packaging workspace

Target path:

- `C:\Work\claude_pickup\opencode_coffeemix_all_0_1`

Expected use:

- derive from the baseline sandbox
- simplify public-facing docs
- reduce internal-only material
- preserve core agents, skills, configs, tools, and validation assets as appropriate

---

## 8. Important files for the next session to read first

Recommended reading order:

1. `README.md`
2. `AGENTS.md`
3. `docs/README.md`
4. `docs/coffeemix_all-current-workflow-and-structure.md`
5. `docs/omo-claudecode-integration-guide.md`
6. `docs/evidence-coffeemix_all-runtime-validation.md`
7. `docs/evidence-routing-validation.md`
8. `docs/superpower/evidence-final-consolidated-summary.md`

---

## 9. Bottom line for the next session

Use `opencode_coffeemix_all_sandbox` as the preserved working baseline.

Do **not** treat it as already public-ready.

The next session should:

- classify the repository surface for public packaging
- commit the sandbox baseline snapshot
- create `opencode_coffeemix_all_0_1`
- perform public-oriented packaging there
