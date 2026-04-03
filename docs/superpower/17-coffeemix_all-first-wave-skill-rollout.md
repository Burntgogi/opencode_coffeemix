# coffeemix_all First-Wave Skill Rollout

**Workspace**: `C:\Work\claude_pickup\opencode_coffeemix_all_sandbox`  
**Status**: implementation record  
**Purpose**: record what was actually delivered in the first local skill rollout wave

---

## 1. Delivered files

- `.opencode/skills/test-driven-development/SKILL.md`
- `.opencode/skills/verification-before-completion/SKILL.md`
- `.opencode/skills/systematic-debugging/SKILL.md`

---

## 2. Delivered capabilities

### test-driven-development
- introduces sandbox-specific red/green framing
- supports docs, config, skill, and plugin work

### verification-before-completion
- requires fresh evidence before completion claims
- separates deliverables from proof

### systematic-debugging
- enforces symptom/cause separation
- formalizes evidence-first debugging before non-obvious fixes

---

## 3. Deferred capability

Not delivered in this wave:

- `brainstorming`

Reason:

- the first wave prioritized the most reusable discipline primitives with the clearest immediate value.

---

## 4. Relationship to existing local assets

The new skills are designed to work with, not replace:

- `enter-plan-mode`
- `ask-user-question`
- `cc-bughunter`
- `cc-review`
- `cc-doctor`

---

## 5. Evidence

### Deliverables

- `.opencode/skills/test-driven-development/SKILL.md`
- `.opencode/skills/verification-before-completion/SKILL.md`
- `.opencode/skills/systematic-debugging/SKILL.md`

### Validation

- file existence confirmed for all three local skill files
- frontmatter and section structure checked against existing local skill patterns
- pilot usage now exercised through:
  - `README.md` and `docs/README.md` index alignment task
  - planning-state consistency repair in `03-coffeemix_all-sandbox-file-map.md`
  - authority re-judgment update in `18-coffeemix_all-authority-reflection-judgment.md`

### Result

- pass

### Open risks

- the new skills have now been used on small sandbox-local documentation tasks, but not yet on a broader code/config rollout beyond this workspace’s documentation and local skill set

### Out of scope

- global OpenCode configuration
- plugin/bootstrap automation
- direct edits to `AGENTS.md`
- direct edits to `oh-my-opencode.json`

---

## 6. Bottom line

The first real discipline layer for `coffeemix_all` now exists locally in the sandbox.
