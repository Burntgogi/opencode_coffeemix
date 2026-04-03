---
name: tool-search
description: Dynamically discover and select tools based on the current task context. Use when unsure which tool is best for a job, or when multiple tools could apply.
compatibility: opencode
---

# tool-search

## What this skill does
This skill enables dynamic tool discovery and selection. Instead of hardcoding tool choices, the agent selects the most appropriate tool based on the current task context and the actual tools available in the OpenCode environment.

This pattern is derived from Claude Code's `ToolSearch` tool concept, but adapted for OpenCode's native tool set.

## When to use
- Multiple tools could solve the problem
- Unsure which tool is most appropriate
- Task requires a tool combination
- The task involves unfamiliar file types or operations

## OpenCode tool families

### File operations
| Operation | Primary tool | Alternative |
|-----------|-------------|-------------|
| Read file | read | look_at |
| Edit file | edit | write |
| Write file | write | edit |

### Search operations
| Operation | Primary tool | Alternative |
|-----------|-------------|-------------|
| Search content in files | grep | codesearch |
| Find files by pattern | glob | bash (find) |
| Search code context | codesearch | grep |
| Search web | websearch | webfetch |
| Fetch URL content | webfetch | websearch |

### Code intelligence (LSP)
| Operation | Primary tool | Alternative |
|-----------|-------------|-------------|
| Go to definition | lsp_goto_definition | grep |
| Find references | lsp_find_references | grep |
| Get symbols | lsp_symbols | grep |
| Check diagnostics | lsp_diagnostics | bash (lint) |

### Execution
| Operation | Primary tool | Alternative |
|-----------|-------------|-------------|
| Run command | bash | interactive_bash |
| Interactive TUI | interactive_bash | bash |

### Task management
| Operation | Primary tool | Alternative |
|-----------|-------------|-------------|
| Track work items | todowrite | (none) |
| Ask user | question | (none) |

### Agent orchestration
| Operation | Primary tool | Alternative |
|-----------|-------------|-------------|
| Delegate work | task | (none) |
| Background tasks | task (run_in_background=true) | bash (&) |

## Selection rules
1. Always prefer specialized tools over generic ones (bash)
2. Always prefer LSP tools over grep when available
3. Always prefer codesearch over websearch for code context
4. If no tool matches, use bash as fallback
5. Document tool selection reasoning when non-obvious

## Decision flow
1. What operation is needed? (read, write, search, execute, etc.)
2. Which tool family matches? (file, search, LSP, execution, task, agent)
3. Pick the primary tool for that operation
4. If primary tool is unavailable or fails, try the alternative
5. If no tool matches, use bash as fallback
