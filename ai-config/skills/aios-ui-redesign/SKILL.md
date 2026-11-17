---
name: aios-ui-redesign
description: Redesign an existing page or app with Hallmark while keeping its content and wiring - record before, pick a depth (polish, restyle, full; a full redesign starts from three directions the user chooses between), rebuild, prove nothing was lost. Explicit invocation, /aios-ui-redesign <path or url> [polish | restyle | full].
disable-model-invocation: true
---

# aios-ui-redesign

A new look on the same page. `/aios-ui-improve` is for targeted fixes that keep the current design; this is for
when the design itself is the problem. `H=$AI_OS_ROOT/ai-config/skills/aios-ui-verify/scripts/hallmark.sh`.

1. **Before.** From the project root: `/aios-ui-verify` on every route in scope into `ui-verify/before`, then
   `$H sloplint <target> --before` (records links, fields and screenshots in `.hallmark/before*`, git-ignored by
   its own `.gitignore`).
2. **Directions (depth `full`, a complete redesign of an app or site, which is Hallmark's default depth; polish
   and restyle skip this, and a request that names no depth gets full).** Run
   `/aios-ui-design` step 2 on the same terms (lens, looks from `/aios-ui-themes deal`, three directions, the user
   picks), with these changes: the brief is the Before record plus Hallmark's three opening questions (what must
   stay, what is wrong, anything new), asked once and not again through impeccable's `shape`; a brand the project
   names in files (logo, tokens, a font file) stays, so the directions differ only where it leaves room; the
   current look and any existing `DESIGN.md` are what is being replaced, so a direction may leave them and the
   offer says so. Each direction is a redesign of the same content and routes (system, composition, hero), shown
   beside the Before screenshot. Stop for the pick, then `/aios-ui-themes apply <slug>` and `lock`, so Hallmark's
   pre-flight reads the choice as the locked system.
3. **Load the `hallmark` skill** with `redesign <target>` and read `references/redesign.md` first. The depth
   argument maps to its depth (`polish`, `restyle`, `full`; asked when missing). Its AI-OS limits apply.
4. **The plan.** Hallmark proposes a file-level plan. Show it to the user and wait: never delete a route or a
   component tree without their approval. Content, copy, data and wiring stay unless the user asks.
5. **Build** in the project's own stack, tokens and components, with no hardcoded or inline styles (rule 27) (`references/export-formats.md`).
6. **Prove it.** `$H sloplint <target> --kept --render` (what the before record had is still there),
   `/aios-ui-verify` into `ui-verify/after`, `compare.py` before vs after on the 375 and 1280 px shots, then
   `/aios-ui-review`.

Report: the depth, what changed and what was kept (sloplint's kept line), the before/after shot pairs, the
verdicts, and anything left.
