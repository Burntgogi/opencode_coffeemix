# Release Notes

**Language:** English | [한국어](./RELEASE_NOTES.ko.md)

## 2026-04-15

### Highlights

- Reframed `coffeemix_all` as an **installable CoffeeMix extension pack for OpenCode + OMO**
- Added a sweet-themed CoffeeMix SVG mark to the English and Korean READMEs
- Hardened validation and installation guidance for safer setup and clearer handoff

### User-facing changes

- Updated the README introduction to describe the package as an **extension pack** rather than a standalone workspace
- Added a CoffeeMix visual mark to `README.md` and `README.ko.md`
- Improved installation guidance around:
  - unresolved `YOUR_PROVIDER/YOUR_MODEL` placeholders
  - selective merge behavior for `oh-my-opencode.json`
  - the generated and gitignored nature of `reports/`

### Technical changes

- Updated `tools/harness.py` to resolve the OpenCode binary in a safer order:
  - `OPENCODE_BIN`
  - system `PATH`
  - common fallback locations
- Improved missing-binary handling so validation runners return a structured failure instead of crashing
- Updated stale validation-runner references from sandbox naming to workspace naming
- Removed stale `archive/` references from public README structure tables

### Validation

- `python -m py_compile tools/harness.py`
- `lsp_diagnostics` on `tools/harness.py`
- targeted verification of README, installation guide, config wording, and asset placement

### Notes

- A temporary backup branch was kept:
  - `backup/master-20260415-pre-coffeemix-update`
- Recommended cleanup timing: after a short stabilization window with no reported issues
