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
4. **Compose from proven pieces, do not invent a visual system.** A from-scratch redesign was rejected on
   2026-11-06 as amateur; passing the gate does not make a design good. Find the pieces with ui-indexador
   (github.com/eddremonts86/ui-indexador, a local service: MCP `http://127.0.0.1:3041/mcp`, HTTP
   `${UI_INDEXER_URL:-http://127.0.0.1:3040}`; see "ui-indexador" below).
   - **Direction:** `design_notes`, `list_captures` and `curated_blocks` show measured patterns from proven sites.
     Compare at least three that fit the brief before picking one.
   - **Palette:** start from `search_themes` (by vibe) and `get_theme`, which returns the CSS variables. Adjust it
     to the brand; check contrast for every text-on-colour pair you change.
   - **Each section:** `search_items` with one English description per piece ("pricing table with a monthly/yearly
     toggle", not the whole page), `osi_only=true` and the project's `framework` (react by default). Take the best
     of the top results, not blindly the first.
   - **Before installing, read the item:** `npx shadcn@latest view @<registry>/<item>`. Reject an item that imports
     `next/*` or `node:*` in a non-Next project, brings its own styling system (StyleX, CSS-in-JS), or pulls npm
     packages beyond the usual (react, motion, lucide-react, radix, cva, clsx, tailwind-merge, cmdk, sonner,
     recharts) without a reason. A result with `mirror_of` has an unverified licence: check the source or skip it.
     The index cannot see these; the code can.
   - **Install** with the command the result returned (`npx shadcn@latest add @<registry>/<item>`), then adapt
     content, tokens and accessibility; keep its structure unless a reason is recorded. Run the build after each
     install: undeclared dependencies show up there.
   - **Record** each section's queries, top candidates, the choice and why (and every rejection) in a build log
     (e.g. `build-log.json`) next to the code. Hand-build only what no indexed piece covers, and say so in the log.
   Then `pick-ui-library` for libraries (toasts, charts, forms) the pieces do not bring.
   **Match references** (optional, when the user gives target screens or images, or a bar like "make it look like
   this"). References are the minimum bar, not inspiration. Write a shot list (one row per reference: the screen
   state, a fixed viewport, what to take from it), capture each shot at the reference's viewport, compare with
   `aios-ui-verify/scripts/compare.py`, and score with `aios-ui-review` scored mode on layout and spacing,
   typography, color, components, density and motion. Iterate until the bar is met; for a run longer than one
   session use `aios-loop` long-run mode. Take from many references, never copy one element 1:1, and never name
   or publish third-party references.
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

## ui-indexador

Read-only index of ~105k items from 320+ shadcn registries, searchable by meaning. Tools: `search_items`,
`list_facets`, `list_registries`, `curated_blocks`, `list_captures`, `design_notes`, `search_themes`, `get_theme`.
If it does not answer (the service is stopped, another machine), say so once and fall back to
`npx shadcn@latest search @<registry> -q "<words>"` over the registries in the project's `components.json`;
never invent component names or install commands. Semantic search needs its local Ollama; without it the
response says `mode: keyword` and English keywords work best.
