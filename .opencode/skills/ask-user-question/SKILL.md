---
name: ask-user-question
description: Gate dangerous or irreversible operations behind explicit user confirmation. Use before file deletion, destructive git operations, database drops, or any action the user cannot easily undo.
compatibility: opencode
---

# ask-user-question

## What this skill does
This skill ensures that dangerous, destructive, or irreversible operations are never executed without explicit user confirmation. It is derived from Claude Code's `AskUserQuestion` tool pattern.

## Dangerous operations (ALWAYS confirm)
- **File deletion**: `rm`, `Remove-Item`, `unlink`, `shutil.rmtree`
- **Git destructive**: `git reset --hard`, `git push --force`, `git clean -fd`
- **Database**: `DROP TABLE`, `DELETE FROM` without WHERE, `db.drop_all()`
- **Overwrite**: Writing to files that already contain important data
- **Permission changes**: `chmod`, `chown`, ACL modifications
- **Environment**: Modifying `.env`, credentials, secrets

## Confirmation format
```
⚠️  This operation is [dangerous/irreversible/destructive]:

**What will happen**: [specific action]
**Files affected**: [list]
**Can this be undone?**: [Yes/No/Partially — explain]

Type "yes" to confirm, or suggest an alternative.
```

## Rules
1. **Never** execute a dangerous operation without confirmation
2. **Never** assume implicit consent ("the user probably wants this")
3. **Always** explain what will happen and whether it's reversible
4. If the user says "just do it", confirm once more: "To confirm, you want me to [action]. This cannot be undone. Proceed?"
5. If unsure whether something is dangerous, **ask anyway**

## Non-dangerous operations (no confirmation needed)
- Creating new files
- Reading files
- Running tests
- Linting/formatting
- Git add/commit (not reset/push --force)
- Installing dependencies

## Integration with enter-plan-mode
When `enter-plan-mode` is active, dangerous operations should be flagged in the plan phase:
```
**Step 3**: Delete old migration files ⚠️ (requires confirmation)
```
This gives the user early visibility into risky steps before implementation begins.
