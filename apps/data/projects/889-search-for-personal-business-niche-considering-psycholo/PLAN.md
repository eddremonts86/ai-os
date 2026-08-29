---
id: "889"
slug: search-for-personal-business-niche-considering-psycholo
title: Search for personal business niche considering psychological barriers
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/psychology/u4o11i24f1-search-for-personal-business-niche-consi"
  captured: "2025-10-22"
category: psychology
date: "2025-10-22"
tags: [Psychology]
country: Russia
tech: [Next.js, TypeScript, Node.js API, PostgreSQL, a small LLM for barrier-categorisation (OpenAI-compatible endpoint), a private journaling store, optional VPN-friendly deployment on Coolify]
---
# Search for personal business niche considering psychological barriers

## Tech Stack

- **Frontend:** Next.js with TypeScript; server-rendered for the public marketing page so the Russian-language copy is crawlable.
- **Backend:** Node.js API; the barrier interview is server-stored so the user can pause and resume, and the shortlist is regenerated server-side from the interview responses plus the niche-template library.
- **Data:** PostgreSQL for users, interview responses, niche-template library, generated shortlists, exports.
- **Reasoning:** a small LLM (OpenAI-compatible endpoint, with a local-llama fallback option for the VPN-friendly deployment) used only to summarise free-text barrier notes into the fixed barrier categories; the structured interview itself is rule-based.
- **Privacy:** all interview data is private-by-default; opt-in aggregate-only contribution; the privacy policy lives at a stable URL and is linked from every screen that touches user data.
- **Deployment:** Coolify on a Hetzner VPS for the standard cloud path; the optional VPN-friendly deployment runs the same Docker compose behind a reverse proxy chosen by the user (Cloudflare WARP, Outline, etc.) because the audience is in Russia and may have connectivity constraints.

## Architecture

```
User (browser)
    │
    ▼
Next.js (marketing + interview)
    │
    ├─▶ /api/interview/* ──▶ PostgreSQL (private interview responses)
    │
    ├─▶ /api/shortlist ──▶ niche-template library (PostgreSQL) + barrier profile
    │                       │
    │                       └─▶ scoring engine (rule-based, no LLM in the hot path)
    │
    ├─▶ /api/summarise (optional) ──▶ LLM endpoint ──▶ structured barrier category
    │
    └─▶ /api/export ──▶ PDF / markdown export of barrier profile + shortlist
```

The shortlist is computed from a rule-based scoring engine; the LLM is only consulted when a free-text note is summarised into a structured barrier category. Keeping the LLM out of the scoring hot path means the shortlist is reproducible, the user can re-run the interview without re-paying the API, and the privacy story is simpler.

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + the nine barrier categories approved; copy reviewed by a Russian-native speaker. End of week 1.
2. **M1 — Interview + scoring engine.** Next.js interview flow with 25–35 minute runtime, nine barrier categories, rule-based scoring engine producing a top-8 shortlist. End of week 3.
3. **M2 — Niche template library.** First 80 niche templates authored and reviewed; each tagged with which barrier categories it tends to trip. End of week 5.
4. **M3 — Export + privacy.** PDF and markdown export; privacy opt-in flow; aggregate-only contribution opt-in. End of week 7.
5. **M4 — Pilot.** 200 users run the interview end-to-end; pricing validated against the post-interview survey. End of week 10.

## Risks

- **Vulnerable user state.** A user searching for a personal business niche is, by definition, at a decision point; the wrong recommendation tone can mislead. The product copy must respect the "this is a recommendation, not a prediction" line on every screen, not just in a disclaimer.
- **Russian-language quality.** Auto-translated copy in the psychology vertical is a brand-destroying risk. The v1 copy must be reviewed by a Russian-native psychologist or coach before launch; the cost is real but the alternative is worse.
- **Niche-template library fabrication.** The score depends on the templates' barrier tags; if those tags are wrong, the shortlist is wrong, and a confident wrong answer is the worst possible outcome. Each template needs a reviewer with personal experience of the niche before it ships.
- **LLM dependency creep.** The temptation to use the LLM for the shortlist itself is high because the answers look smarter. The architecture has to keep the LLM in the summarise-only lane; the scoring engine must remain rule-based, or the reproducibility and privacy stories both degrade.
