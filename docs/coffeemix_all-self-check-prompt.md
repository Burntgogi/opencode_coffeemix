# coffeemix_all Self-Check Prompt

?�드박스 진입 —?�는 ?�업 ?�작 — ?�음 ?�롬?�트�—�행?�여 ?�재 ?�태�—��—�니—

---

## ?��——�롬?�트

```
You are the coffeemix_all sandbox self-check agent.

Perform a complete health check of this workspace by reading actual files —do not answer from memory.

### 1. Workspace Identity
- Read `AGENTS.md` line 1-3: confirm workspace name is `coffeemix_all`
- Read `tui.json`: confirm badge label is `With_coffeemix_all_V0.1`
- Read `open-sandbox-opencode.cmd`: confirm SANDBOX_DIR points to `opencode_coffeemix_all_sandbox`

### 2. Core Configuration
- Read `opencode.json`: confirm `oh-my-opencode` plugin is loaded
- Read `oh-my-opencode.json`: confirm agents and categories are defined
- Read `.opencode/package.json`: confirm runtime dependencies

### 3. Specialist Inventory
- List all files in `.opencode/agents/` —should be 14 gb-* specialists
- List all files in `.opencode/skills/` —should be 7 skills:
  - ask-user-question, compact-context, enter-plan-mode, tool-search (existing)
  - systematic-debugging, test-driven-development, verification-before-completion (discipline)

### 4. Routing Rules
- Read `AGENTS.md` lines 32-53: confirm 6 routing rules + validation harness section exist
- Confirm rule 6 mentions all 3 discipline skills

### 5. Validation Harness
- Confirm `tools/harness.py` exists
- Confirm `tools/sandbox_smoke_runner.py`, `tools/sandbox_e2e_runner.py`, `tools/routing_validation_runner.py` exist
- Confirm `scenarios/` has README.md + scenario files
- Confirm `routing-scenarios/` has README.md + 28 scenario files

### 6. Documentation Set
- List `docs/superpower/` —should contain 01~19 numbered docs + README + evidence docs
- Confirm `docs/superpower/README.md` lists all 19 docs + 8 evidence docs

### 7. Discipline Skills
- Read `.opencode/skills/test-driven-development/SKILL.md`: confirm red/green state rules exist
- Read `.opencode/skills/verification-before-completion/SKILL.md`: confirm evidence requirements exist
- Read `.opencode/skills/systematic-debugging/SKILL.md`: confirm root-cause-first workflow exists

### 8. Git State
- Run `git log --oneline -1`: confirm V0.1 snapshot commit exists
- Run `git status --short`: confirm working tree is clean

### Output Format

Return a concise report:

```
## coffeemix_all V0.1 Health Check

| Check | Status | Detail |
|---|---|---|
| Workspace Identity | ——| [detail] |
| Core Config | ——| [detail] |
| Specialists (14) | ——| [count] |
| Skills (7) | ——| [list] |
| Routing Rules (6) | ——| [detail] |
| Validation Harness | ——| [detail] |
| Documentation Set | ——| [count] |
| Discipline Skills | ——| [detail] |
| Git State | ——| [detail] |

Overall: ?�� Healthy / ?�� Warnings / ?�� Issues
```

If any check fails, list the specific issue and recommend a fix.
```

---

## ?�용 방법

1. **?�드박스 진입 —*: `open-sandbox-opencode.cmd` ?�행 —OpenCode TUI ?�작 ——?�롬?�트 붙여?�기
2. **PowerShell 진입 —*: `.\enter-sandbox.ps1` ?�행 —`opencode run`?�로 —?�롬?�트 ?�달
3. **?�동—*: ?�후 `tools/self_check_runner.py`�—�동—가—
## ?��? 주기

- ?�드박스 최초 진입 —- 주요 변�—�업 —- ?�션 ?�개 —(`gb-resume`?� ?�계)
