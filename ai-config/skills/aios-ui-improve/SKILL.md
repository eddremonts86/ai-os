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
4. **Look for a proven replacement first.** When a finding says a section or component is weak, hand-rolled or
   broken, ask ui-indexador (`search_items` with one English description of that piece, `osi_only=true`, the
   project's `framework`) whether an indexed piece already does it well. Propose it with its install command and
   licence; swapping a component is a structural change, so it waits for the user like any other. For a palette
   finding, start from `search_themes` / `get_theme`. Read the item with `npx shadcn@latest view` before installing
   (the checks are in `/aios-ui-design` step 4). If ui-indexador does not answer, say so and go on with step 5.
5. **Fix** with the `impeccable` command that names the problem (`polish`, `harden`, `adapt`, `clarify`, `layout`,
   `optimize`, `animate`) rather than ad hoc edits; one concern per change. Motion only via `micro-interactions`.
6. **After.** `/aios-ui-verify` again, to a second folder. It must pass, or say precisely what is left and why.
7. **Report:** what was found, what was changed, which indexed pieces were proposed or installed, what was left
   for the user, before and after screenshot paths, the verify verdicts, and what was not checked.

If more than a handful of fixes touch the whole product, use `fix-ui-ux` (Impeccable end to end) or `saas-review`
(every route, scored) instead, and still finish with `/aios-ui-verify`.
