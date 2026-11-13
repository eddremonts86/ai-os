---
name: aios-content
description: Use when explicitly invoking /aios-content to create or update documentation, an ADR, a tutorial, release notes, or other written content.
---

# AI-OS Content

Determine the audience, goal, format, and destination from the request; clarify
only when needed. Read `$AI_OS_ROOT/workflows/content_creation.md` and follow its
applicable steps. Resolve `AI_OS_ROOT` from the AI-OS environment or global
bridge, not the current project directory. If the workflow is unavailable,
report the missing path.

Verify factual claims, links, and runnable examples as applicable. Save to the
requested destination; commit only when authorized by the user. For pure research,
use `aios-research`.
