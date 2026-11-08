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
4. **Compose from proven pieces, do not invent a visual system.** Start in the ui-indexador API
   (`${UI_INDEXER_URL:-http://127.0.0.1:3040}`; start it with `python3 $AI_OS_ROOT/apps/ui-indexador/server.py`):
   `/index.md` has real sites and registry blocks, captured and measured, grouped by pattern; `/captures?kind=hero`
   and `/blocks?kind=hero&min_fit=4` list screenshots and surveyed blocks. Compare at least three patterns that fit
   the brief before picking one. Add new references with the app's `scripts/capture.py`. Then `pick-ui-library` for
   libraries and the API's `/registries` for components and blocks: take sections from the top registries of the matching category
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
