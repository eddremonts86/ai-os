---
name: aios-ui-design
description: Design and build a new UI (page, screen, component) with one design direction, the right libraries, and a verified result. Plans before code, then runs the runtime gate and a cold review. Explicit invocation, /aios-ui-design <what to build>.
disable-model-invocation: true
---

# aios-ui-design

New UI, start to verified. Reuse the skills below; do not restate them.

1. **Context.** AI-OS surfaces use `context/06_brand.md`. Any other project uses its `PRODUCT.md` / `DESIGN.md`;
   if missing and the work is bigger than one component, run `impeccable init` (and `document` for an existing code base).
2. **Mode and direction. Load ONE.**

   | The surface is | Load |
   |---|---|
   | Landing, portfolio, campaign, showcase (persuade, experience) | `taste-skill` |
   | App UI, dashboard, form, settings, component, docs (operate, read) | `frontend-design` |

   The brief's own words win over any default of the skill.
3. **Plan before code.** Palette, type, layout (one-line prose and an ASCII wireframe), principles. Review the plan
   against the brief and change what reads as a default. Go on without asking unless the brief is ambiguous.
4. **Compose from proven pieces, do not invent a visual system.** Ask ui-indexador (an external app,
   github.com/eddremonts86/ui-indexador, run locally by its `schedule/install.sh`; MCP at
   `http://127.0.0.1:3041/mcp`): its MCP tools
   (`design_notes`, `list_captures`, `curated_blocks`, `search_items`, `search_themes`/`get_theme`) or the same
   queries over HTTP (`${UI_INDEXER_URL:-http://127.0.0.1:3040}`, e.g. `/items?kind=hero&type=block`). It indexes
   every block and component of 300 shadcn registries (kind, layout, features, deps, install command), plus real
   sites captured and measured, and tweakcn themes. Compare at least three patterns that fit the brief before
   picking one; start the palette from a theme whose vibe fits (`get_theme` returns the CSS variables). Then
   `pick-ui-library` for libraries. For each section, search the catalog by kind and take the best-ranked match
   (`npx shadcn add @<registry>/<item>`), then adapt them to the brand. Hand-build only what no top registry has.
   A from-scratch redesign was rejected on 2026-11-06 as amateur; passing the gate does not make a design good.
5. **Show one section first.** Build the hero (or the one section that carries the idea), show it to the user
   with a screenshot, and only continue after they approve the direction. Do not spend a whole page of tokens
   on an unapproved look.
6. **Build.** Motion only through `micro-interactions` or `emil-design-eng`, and only for what answers a user action
   plus at most one orchestrated moment. Load `impeccable`'s `craft-floor` before editing.
7. **Gate.** Run `/aios-ui-verify` on every route you touched, then `/aios-ui-review`. Fix blockers and majors;
   two rounds at most, then report what is left.

Done means: the verify verdict is PASS (or its gaps are stated), you looked at the screenshots, and the review
has no blockers. Report those three things, not "it looks good".

For a whole existing app use `/aios-ui-improve` or `saas-review`, not this.
