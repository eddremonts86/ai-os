---
name: aios-ui-improve
description: Improve an existing UI safely. Reviews it cold, applies the blockers and majors that keep identity and copy intact, verifies again, and reports before and after screenshots. Explicit invocation, /aios-ui-improve <url or files> [what bothers you].
disable-model-invocation: true
---

# aios-ui-improve

Fixes that are proven, not hoped for. Refinement preserves what works; it does not redesign.

1. **Before.** `/aios-ui-verify` on the pages in scope; keep that screenshot folder as "before".
2. **Review.** `/aios-ui-review` on the same scope, with what bothers the user as part of the brief.
3. **Choose what to apply.** Blockers and majors that do not change copy, brand identity, behaviour or scope: apply them.
   Anything that does, and every minor: list it for the user and wait. Never replace factual copy or add claims unasked.
4. **Fix** with the `impeccable` command that names the problem (`polish`, `harden`, `adapt`, `clarify`, `layout`,
   `optimize`, `animate`) rather than ad hoc edits; one concern per change. Motion only via `micro-interactions`.
5. **After.** `/aios-ui-verify` again, to a second folder. It must pass, or say precisely what is left and why.
6. **Report:** what was found, what was changed, what was left for the user, before and after screenshot paths, the
   verify verdicts, and what was not checked.

If more than a handful of fixes touch the whole product, use `fix-ui-ux` (Impeccable end to end) or `saas-review`
(every route, scored) instead, and still finish with `/aios-ui-verify`.
