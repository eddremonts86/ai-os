---
name: problemhunt-pipeline
description: Use when fetching fresh project ideas and generating per-project plans. Multi-source: ProblemHunt + Reddit. Triggers on "problemhunt", "fetch project ideas", "scrape reddit", "generate plans", "new projects". Runs the multi-source scraper under ai-os/tools/problemhunt-scraper.
license: MIT
metadata:
  hermes:
    tags: [scraping, planning, problemhunt, reddit, ai-os]
    related_skills: [brainstorming, writing-plans, spec, product-capability, scraper-state-disk-truth]
---

# ProblemHunt Multi-Source Pipeline

Fetches fresh startup/project ideas from multiple sources and generates
per-project documentation under `~/Projects/ai-os/apps/data/projects/(NNN-slug)/`.

Each project folder contains **5 files**:

- `SPEC.md` — problem statement + scope
- `PLAN.md` — tech stack + milestones
- `TASKS.md` — phased checklist
- `DESIGN.md` — design tokens & visual direction (from design-dna.js)
- `PRODUCT.md` — value prop, users, JTBD, metrics, risks

Plus one ranking file at the root:

- `TOP_PROJECTS.md` — top 5 by money / learning / fun, updated by the cronjob

## Sources

| Source | What it gives | Auth needed |
|---|---|---|
| **ProblemHunt** (Tilda feed, EN) | Validated startup problems | None — open Tilda API |
| **Reddit** RSS (`r/SaaS`, `r/IndieHackers`, `r/startups`, `r/SideProject`) | Pain points from real founders | None — public RSS, rate-limited (~1 req/s) |

Rejected sources (see "Rejected" below for why):

- ideaBrowser.com — paywall, only 12 free ideas visible
- IndieHackers.com — Cloudflare bot challenge
- ProductHunt — GraphQL protected

## Location

```text
~/Projects/ai-os/
├── apps/data/tools/problemhunt-scraper/
│   ├── scraper.cjs          # main entry, multi-source
│   ├── design-dna.js        # 17 design-system palettes
│   ├── state.json           # dedupe + per-source tracking
│   └── package.json
├── apps/data/projects/                # OUTPUT — one folder per project
│   └── NNN-slug/
│       ├── SPEC.md
│       ├── PLAN.md
│       ├── TASKS.md
│       ├── DESIGN.md
│       └── PRODUCT.md
├── apps/data/projects/TOP_PROJECTS.md # ranked top 5 per dimension
└── skills/problemhunt-pipeline/   # ← this skill
```

## Steps

### 1. Run the scraper

```bash
cd ~/Projects/ai-os/tools/problemhunt-scraper
node scraper.cjs                  # all sources, incremental
node scraper.cjs --force          # re-generate everything
node scraper.cjs --dry-run        # fetch but do not write files
node scraper.cjs --source=ph      # only ProblemHunt
node scraper.cjs --source=reddit  # only Reddit
node scraper.cjs --quiet          # suppress per-project logs
```

Override the AI-OS root (for tests):

```bash
AI_OS_ROOT=/tmp/ai-os node scraper.cjs --dry-run
```

### 2. Verify output

```bash
ls ~/Projects/ai-os/apps/data/projects/ | grep -v "^TOP" | wc -l
# Should equal state.json analyzed count
```

If a folder only has some files (crash mid-way), delete the bad folder
and re-run `node scraper.cjs` — dedupe will re-generate.

### 3. Ranking (triggered automatically by cronjob)

The cronjob reads `state.json` and, if new projects exist, scores them
across 3 dimensions and updates `TOP_PROJECTS.md`. See the cronjob prompt
for the exact scoring rubric.

### 4. Notify (optional)

If `TELEGRAM_BOT_TOKEN` + `TELEGRAM_CHAT_ID` are exported (or in
`apps/data/tools/problemhunt-scraper/.env`), the scraper sends a Telegram summary.
Missing env is non-fatal — it logs and continues.

## Rejected Sources (and why)

- **ideaBrowser.com**: Home page only exposes 12 ideas for free; the rest
  are paywalled. No way to scrape the catalog without an account.
- **IndieHackers.com**: Cloudflare bot challenge blocks even Playwright
  headless. Would need a real Chrome profile or residential proxy.
- **ProductHunt**: GraphQL API requires OAuth + app credentials.

## Pitfalls

- **Reddit rate-limit**: `x-ratelimit-remaining: 0.0` blocks you for ~30s
  per IP. Scraper handles 429 + `x-ratelimit-reset` header automatically,
  but don't run it twice in a row without backoff.
- **Source-tagged docs**: `SPEC.md` and `PRODUCT.md` are different for
  Reddit vs ProblemHunt (different `category` semantics, different
  stakeholder defaults). If you edit the generators, edit both branches.
- **Phantom slots from --dry-run**: `--dry-run` still consumes `nextNumber`
  slots in state.json. If you then run for real, the new projects get
  higher slot numbers than the dry-run preview. Use `--dry-run` only for
  network/rate-limit tests, not to preview slugs.
- **Stale state after manual edits**: if you delete folders manually,
  re-run `node scraper.cjs` and it will detect the missing docs and
  re-generate (gate is `docsExist(slug)` not just URL match — see
  `scraper-state-disk-truth` skill).

## Verification

- `node scraper.cjs --dry-run` should print "X nuevos (sin docs)" matching
  what the real run will write.
- After a real run, `~/Projects/ai-os/apps/data/projects/` should grow by N folders.
- Each new folder must contain all 5 .md files.
- `state.json.analyzed` count should equal the folder count (excluding
  `TOP_PROJECTS.md`).

## Related

- `scraper-state-disk-truth` — the disk-gated dedupe pattern this scraper uses
- `spec` — produces one Spec from a single idea
- `writing-plans` — breaks a Spec into plan blocks
- `product-capability` — translates PRD intent into product scope
