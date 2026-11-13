---
name: aios-project-start
description: Use when explicitly invoking /aios-project-start to prepare an AI-OS Spec for a new task or project.
---

# AI-OS Project Start

Read `$AI_OS_ROOT/workflows/project_start.md` and use its Spec preparation and
review steps. Resolve `AI_OS_ROOT` from the AI-OS environment or global bridge,
not the current project directory. If the workflow is unavailable, report the
missing path.

Use a Spec when the work exceeds the workflow's threshold or the user requests
one. Never overwrite an active Spec. Present the Spec for approval and stop
before execution unless the user has authorized proceeding. If execution is
requested, continue with the applicable AI-OS workflow.
