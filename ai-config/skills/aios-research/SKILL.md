---
name: aios-research
description: Use when explicitly invoking /aios-research to investigate a question, compare options, or evaluate a tool using the AI-OS research workflow.
---

# AI-OS Research

Use the user's request as the research question. Identify the expected outcome and
constraints; clarify only when needed.

Read `$AI_OS_ROOT/workflows/research.md` and follow the applicable steps. Resolve
`AI_OS_ROOT` from the AI-OS environment or global bridge, not the current project
directory. If the workflow is unavailable, report the missing path.

Verify sources and distinguish facts from recommendations. Save reusable research
only when requested or appropriate to the task. For implementation, use `aios-code`.
