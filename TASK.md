# TASK — Enrich 552 plan documents to web-ready

> Loop started 2026-08-13. Drives `ai-os plans enrich` over the whole corpus via 5
> parallel sub-agents. Each agent owns a fixed id range so they cannot collide.

## Goal

Every plan under `apps/data/projects/<id>-<slug>/` passes `ai-os plans check --id <id> --verbose`
(section `sections-written` green, `problem-substantive` green). Status advances to
`enriched` per plan; `web-ready` is granted by the gate, never by hand.

## Inputs

- Contract: `apps/data/projects/_schema.json` — sections, frontmatter fields, gate rules.
- Skill: `ai-config/skills/plan-authoring/SKILL.md` — read once at start.
- Source per plan: `apps/data/projects/<id>-<slug>/SPEC.md` (the captured problem + the frontmatter
  `source.url`). Source is thin on purpose. **Do not invent facts.**

## Outputs

- `apps/data/projects/<id>-<slug>/SPEC.md`, `PRODUCT.md`, `PLAN.md`, `TASKS.md` rewritten with real
  per-plan prose.
- `outputs/enrich/<id>-<slug>/report.md` — one per plan, with sections filled, TODOs kept
  (and named), and any humanizer / illustrate notes.
- `outputs/enrich/<id>-<slug>/frontmatter-changes.md` — when frontmatter fields are added
  (e.g. `tech`, `wtp`), record what was inferred from source and what was left absent.
- One line per plan appended to `PROGRESS.md` (do not edit lines you did not write).

## Method (per plan)

1. Read the skill, the schema, and the source URL.
2. Read the 4 docs of the plan; identify which varying sections are still the
   `_Not written yet …` marker.
3. Write the varying sections. Keep the poster's specifics — numbers, role, country.
4. Stay inside the section list in `_schema.json#documents`. Do not invent headings.
5. Do not write `status: web-ready` by hand. Advance to `enriched` only after every
   varying section has real content; leave `<!-- TODO -->` (the schema's allowed marker)
   where the source is genuinely too thin.
6. Verify: `ai-os plans check --id <id> --verbose`. If a rule still fails, fix and retry,
   or record the gap in the report.

## Anti-patterns (will be flagged in the report)

- Same MVP scope for two plans.
- Reaching for `diagram-design` on every plan.
- Humanizing before there is content.
- Inventing market size, competitor, price, or metric.
- Copying the legacy default tech stack (`React, TypeScript, Node.js API (TanStack
  Start), SQLite con Drizzle ORM, Coolify, Docker`).
- Setting `web-ready` by hand.

## Sharding (no collisions)

| Agent | Range | Count | Touch only |
|-------|-------|-------|------------|
| 1 | 001..111 | 111 | `apps/data/projects/0[0-9][0-9]-\*` and `1[0-1][0-9]-\*` |
| 2 | 112..222 | 111 | `apps/data/projects/1[1-2][0-9]-\*` and `2[0-2][0-9]-\*` |
| 3 | 223..333 | 111 | `apps/data/projects/2[2-3][0-9]-\*` and `3[0-3][0-9]-\*` |
| 4 | 334..444 | 111 | `apps/data/projects/3[3-4][0-9]-\*` and `4[0-4][0-9]-\*` |
| 5 | 445..552 | 108 | `apps/data/projects/4[4-5][0-9]-\*` and `5[0-5][0-9]-\*` |

Each agent only writes its own log under `apps/data/progress/`
(`PROGRESS.1.md` … `PROGRESS.5.md`). The merged `PROGRESS.md` at the repo root is the
loop's own memory and belongs to whoever runs the loop, not to a slice.
A separate reconciliation step merges them after all 5 finish.