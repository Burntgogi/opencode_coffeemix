# Evidence — Pilot 01 TDD Index Alignment

**Workspace**: `C:\Work\claude_pickup\opencode_coffeemix_all_sandbox`  
**Primary skill exercised**: `test-driven-development`

---

## Red state

The workspace index documents still claimed the ordered `docs/superpower/` set was `01~15`, while the real folder already contained `01~18`.

Affected files:

- `README.md`
- `docs/README.md`

---

## Green state target

Both index documents should:

- reflect the actual `01~18` set,
- distinguish planning docs from implementation/judgment docs,
- and remain sandbox-local.

---

## Files changed

- `README.md`
- `docs/README.md`

---

## Validation

- verified `README.md` now says `01~18`
- verified `docs/README.md` now says `01~18`
- verified both docs distinguish `01~15` from `16~18`

---

## Result

- pass

---

## Open risks

- other historical planning docs may still contain pre-implementation language and require later cleanup

---

## Out of scope

- any global OpenCode configuration
- `AGENTS.md` changes
- `oh-my-opencode.json` changes
