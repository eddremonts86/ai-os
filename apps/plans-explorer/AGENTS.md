# AGENTS.md — plans-explorer

> Instructions for any AI CLI (Claude Code, Codex, Gemini, Antigravity, Hermes, MiniMax) that opens this directory.

## What this is

Static SPA (Vite + Vue 3) that indexes and renders the 525 product plans in `../data/projects/`. **Framework component of AI-OS**, not a personal/work project.

## When you enter this dir

1. Read `SPEC.md` first to understand scope and constraints.
2. Read `PLAN.md` for architecture (where files live, how data flows).
3. Read `TASKS.md` to see current milestone + verify steps for each block.
4. If you need visual reference, read `../site/index.html` for tokens (palette, fonts, radii).

## Hard rules

- **Do NOT modify `../data/projects/`.** Read-only. If a plan needs editing, edit the SPEC.md/PLAN.md inside its own folder.
- **Do NOT touch `../site/index.html`** for design parity — copy tokens into `app/src/styles/tokens.css` instead. Document the copied values in `DESIGN.md`.
- **Stack:** Vue 3 Composition API + `<script setup lang="ts">`. Skill `antfu-vue` applies. Do not introduce React, Svelte, or Options API without explicit user approval.
- **Bundle budget:** <200KB JS gzipped. Lazy-load `markdown-it` + `highlight.js` only on `PlanView`.
- **No backend.** Everything is build-time → static.
- **English in code, commits, comments, logs.** Spanish only in chat replies to the user.
- **Verify before claiming done.** Each TASKS.md block has a `Verify` step. Run it. Don't claim "build passes" — show actual output (Lighthouse score, file count, browser screenshot).

## Build & dev

```bash
cd app
npm install
npm run dev          # http://localhost:3020  (pinned, see .claude/launch.json)
npm run build        # runs prebuild → build-index.mjs → vite build
npm run index        # only the indexer, no vite build
```

From the repo root: `./refresh-data.sh` runs `npm run build` inside `app/`.

## Data flow

- `app/scripts/build-index.mjs` walks `../data/projects/*/` and parses SPEC/PRODUCT/PLAN per plan.
- Writes `app/public/data/plans.json` + `app/public/data/documents/<id>.json` (lazy md).
- Writes `app/public/data/rankings.json` from `../data/projects/TOP_PROJECTS.md`.
- 5 fixture tests in `app/scripts/test-parser.mjs` validate extraction accuracy.

## Components cheatsheet

| Component | File | Purpose |
|---|---|---|
| `IndexView` | `src/views/IndexView.vue` | Grid of 525 plan cards + search/facets |
| `PlanView` | `src/views/PlanView.vue` | Single plan with SPEC/PRODUCT/PLAN tabs |
| `RankingsView` | `src/views/RankingsView.vue` | Top-5 money/learn/fun columns |
| `PlanCard` | `src/components/PlanCard.vue` | Card with title, chips, score badges, wtp, country |
| `FacetPanel` | `src/components/FacetPanel.vue` | Multi-select filters |
| `IncomeRangeSlider` | `src/components/IncomeRangeSlider.vue` | 0–$5000 MRR range |
| `ScoreBadge` | `src/components/ScoreBadge.vue` | money/learn/fun pill |
| `WtpBadge` | `src/components/WtpBadge.vue` | willingness-to-pay pill |
| `DocTabs` | `src/components/DocTabs.vue` | SPEC / PRODUCT / PLAN tabs |
| `MarkdownReader` | `src/components/MarkdownReader.vue` | markdown-it + hljs renderer |

## Common tasks

- **Add a new facet:** extend `src/lib/search.ts` (Fuse.js config + facet filter function), add UI in `FacetPanel.vue`, add doc in `DESIGN.md`.
- **Refresh data after corpus change:** `./refresh-data.sh` (or `cd app && npm run build`).
- **Add a top-N plan to a ranking:** edit `../data/projects/TOP_PROJECTS.md` (cron handles), then `./refresh-data.sh`.

## Do NOT

- Don't add a backend, API routes, server-side rendering, or auth.
- Don't scrape ProblemHunt on every build — `sourceUrl` is reconstructed from the local slug.
- Don't use Tailwind, Vuetify, or any UI kit — keep CSS small.
- Don't push directly to `main` — branch + PR per AI-OS convention.
