---
name: plans-explorer
description: Operate the plans-explorer SPA inside AI-OS (~/Projects/ai-os/apps/plans-explorer/). Use when the user mentions "plans explorer", "browse plans", "plans-ranking", "TOP_PROJECTS.md", or asks to work on the plans-explorer app.
license: MIT
metadata:
  hermes:
    tags: [plans-explorer, ai-os, vue, vite, plans-indexer]
---

# plans-explorer

Static SPA inside the AI-OS framework that indexes 525 product plans (in `../projects/`) plus the auto-generated `TOP_PROJECTS.md` rankings (money / learn / fun).

## When to use

- User says: "plans-explorer", "plans app", "browse the plans", "TOP_PROJECTS", "ranking money/learn/fun", "wtp filter", "income range slider".
- User opens `~/Projects/ai-os/plans-explorer/` and asks for help.
- User wants to refresh data, fix the indexer, add a facet, or deploy the SPA.

## When NOT to use

- The user is working on a plan inside `~/Projects/ai-os/apps/data/projects/NNN-.../`. That is its own plan with its own SPEC/PLAN/TASKS — not the explorer.
- The user wants to modify `apps/site/index.html` (that's the landing page, separate).
- The user is editing `TOP_PROJECTS.md` directly (that's done by the `problemhunt-scraper` cron).

## How to start

1. **Read `AGENTS.md`** in `~/Projects/ai-os/plans-explorer/AGENTS.md` first.
2. **Read `SPEC.md` and `PLAN.md`** for scope and architecture.
3. **Read `TASKS.md`** to see current milestone + verify steps.
4. If the user is making a code change, **read `app/src/`** to understand existing components before adding new ones.

## Hard rules (from AGENTS.md)

- **Do NOT modify `../projects/`.** Read-only corpus.
- **Do NOT modify `../site/index.html`.** Copy tokens to `app/src/styles/tokens.css` instead.
- **Vue 3 Composition API + `<script setup lang="ts">`.** No React/Svelte without approval.
- **Bundle <200KB gzipped.** Lazy-load md parser on `PlanView`.
- **No backend.** Static SPA, build-time indexing only.
- **Verify before done.** Each TASKS.md block has a verify step — run it.

## Common operations

### Refresh data + rebuild

```bash
cd ~/Projects/ai-os
./refresh-data.sh
```

This runs `app/scripts/build-index.mjs` then `vite build`. Output: `app/dist/` (deployable).

### Run dev server

```bash
cd ~/Projects/ai-os/plans-explorer/app
npm run dev    # http://localhost:5173
```

### Test the parser

```bash
cd ~/Projects/ai-os/plans-explorer/app
node scripts/test-parser.mjs
```

Validates extraction on 5 fixture plans (001, 016, 236, 419, 441).

### Add a new facet

1. Extend `app/src/lib/search.ts` (Fuse config + facet filter function).
2. Add UI block in `app/src/components/FacetPanel.vue`.
3. Update `app/../DESIGN.md` "Components" section.
4. Add a verify step in `TASKS.md`.

### Add a new score kind

Today: money / learn / fun. To add (e.g.) "speed":

1. Edit `../projects/TOP_PROJECTS.md` to add a `## Top 5 — Speed` section (matching existing format).
2. Extend `parseRankings()` in `app/scripts/build-index.mjs` regex.
3. Add `ScoreBadge kind="speed"` case in `app/src/components/ScoreBadge.vue`.
4. Update verify fixture in `TASKS.md`.

## Stack at a glance

- **Build:** Vite 5
- **Framework:** Vue 3 + Composition API
- **Router:** vue-router 4
- **Markdown:** markdown-it + highlight.js (lazy)
- **Search:** Fuse.js
- **Indexer:** Node `scripts/build-index.mjs` (build-time)

## Deploy

Currently undecided. Options:

- Subpath under `ai-os.eduardoinerarte.dk/plans/` (shares Coolify setup with `apps/site/`).
- Separate subdomain `plans.ai-os.eduardoinerarte.dk`.

`app/dist/` is deployable to any static host. CI re-runs `./refresh-data.sh` on changes to `../projects/TOP_PROJECTS.md` or new plan folders.

## Related

- Corpus: `~/Projects/ai-os/apps/data/projects/`
- Rankings source: `~/Projects/ai-os/apps/data/projects/TOP_PROJECTS.md`
- Visual reference: `~/Projects/ai-os/site/index.html`
- AI-OS master: `~/Projects/ai-os/CLAUDE.md`
