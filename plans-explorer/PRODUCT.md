# PRODUCT.md — AI-OS Plans Explorer

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A static, fast, searchable reader for the 455 product plans living in `~/Projects/ai-os/projects/`. Filter by category, tags, technology, and ranking scores (money / learn / fun) parsed from `TOP_PROJECTS.md`. Read any SPEC, PRODUCT or PLAN as rendered markdown without cloning the repo.

**One-liner:** _Browse, search and rank 455 AI-OS product plans in one place._

## Target Users

| Stakeholder | Why they care |
|---|---|
| Edd (founder) | Picks "what to build next" by skimming top-money and top-fun plans in seconds, not by `cd`-ing into each folder. |
| Reviewer | Reads any plan via a single URL with rendered markdown + side-by-side metadata. |
| AI-OS contributors | Discovers which plans already exist before proposing a new one (deduplication). |

## Jobs To Be Done

1. **Functional job** — "show me the top-5 most profitable plans filtered to US market with React stack and let me read their SPECs without leaving the browser."
2. **Emotional job** — "I want to feel oriented in the corpus of 455 plans in under 10 seconds and trust that the income numbers are real."
3. **Social job** — "I want to share a `/plans/<id>` link in chat and have the reviewer see exactly what I mean, including the original ProblemHunt post."

## Success Metrics (North Star)

- **Activation:** _Time-to-first-useful-filter < 5s on a cold load._
- **Retention:** _Weekly re-visits when picking next build._
- **Coverage:** _100% of SPEC.md, PRODUCT.md, PLAN.md indexed and readable._

## Pricing & Monetization

Not applicable — internal tool.

## Competitive Landscape

- **GitHub web UI** — generic, no faceted search, no score ranking.
- **Obsidian** — local-only, requires manual setup.
- **Static site generators** (Astro, MkDocs) — none ship with our `TOP_PROJECTS.md` ranking parsed as first-class facet.

Differentiation: **the ranking-aware search on top of an already-curated corpus**.

## Risks & Open Questions

- [ ] Confirm scope: full SPA with Vite vs lighter Astro static. _Resolved: Vite + Vue 3 SPA._
- [ ] Confirm md/mdx coverage: most plans are plain `.md`, a few may have frontmatter — parser must tolerate both.
- [ ] Confirm deployment: same Coolify/VPS as `site/` or separate static host? _Open — defer to deploy phase._
- [ ] Indexer perf: 455 plans × 3 docs is fine to read on every CI build (<2s expected).

---

_Source:_ internal backlog · **Category:** dev · **Tags:** Developer,Productivity,AI
