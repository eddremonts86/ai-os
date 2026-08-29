---
id: "3744"
slug: the-director-submit-your-software-be-interviewed-and-be
title: "The Director – Submit your software, be interviewed, and be remembered"
status: enriched
source:
  name: BetaList
  url: "https://betalist.com/startups/the-director?utm_campaign=startup-181540&utm_medium=atom&utm_source=newsfeed"
category: beta
date: "2026-08-29"
tags: [BetaList, Beta, Product]
tech: [TypeScript (SvelteKit for the terminal UI), TypeScript (TanStack Start for the public dossier pages), Postgres + Drizzle ORM, Crawlee (site crawl), LLamaIndex (RAG over crawled pages), Cloudflare R2 (badge image hosting)]
---
# The Director – Submit your software, be interviewed, and be remembered

## Tech Stack

The stack is picked for the problem — a character-driven software directory whose public surface is server-rendered dossier pages — not from a default.

- **Terminal UI:** SvelteKit on the submission route. Monospace, slow line-by-line text rendering, optional keystroke audio; the terminal feel is built into the front-end framework rather than wrapped around it.
- **Dossier pages (public surface):** TanStack Start (server-rendered). Every record has its own static-ish URL with the crawled excerpts and the verdict inlined server-side; client-side fetch is not allowed on the dossier route.
- **Crawl pipeline:** Crawlee for the worker that fetches a representative subset of pages from the submitted URL; LLamaIndex over the crawled pages builds the RAG context the AI uses during the interview.
- **Interview AI:** an LLM behind a system-prompt-locked character (ARCHIVE-9); prompts defined as versioned templates with regression tests on "verdict is a word, not a number" before each deploy.
- **Persistence:** Postgres + Drizzle ORM for records, interviews, and dossier content; the record naming (`REC-####`) continues the existing 3,900+ on-file sequence in a single global counter.
- **Badge hosting:** Cloudflare R2 serving the embeddable badge image, with the dossier URL as the canonical `href` of the badge's anchor tag.

## Architecture

```
                        ┌────────────────────────┐
   submitter types  ──▶ │  SvelteKit terminal UI │ ──┐
   a URL                │  (monospace, line-by-  │   │
                        │   line rendering)      │   │
                        └────────────────────────┘   │
                                                     ▼
                                         ┌────────────────────────┐
                                         │  Crawlee worker        │
                                         │  (pulls 5-15 pages,    │
                                         │   LLamaIndex RAG)      │
                                         └────────────────────────┘
                                                     │
                                                     ▼
                                         ┌────────────────────────┐
                                         │  ARCHIVE-9 interview   │
                                         │  (LLM, ≤ 5 questions,  │
                                         │   system-prompt-locked │
                                         │   voice)               │
                                         └────────────────────────┘
                                                     │
                                                     ▼
                       ┌────────────────────────────────────┐
                       │  Postgres + Drizzle ORM           │
                       │  REC-#### records, dossier copy   │
                       └────────────────────────────────────┘
                                                     │
                                                     ▼
                       ┌────────────────────────────────────┐
                       │  TanStack Start dossier route      │
                       │  server-rendered, no client fetch  │
                       └────────────────────────────────────┘
                                                     │
                                                     ▼
                                  ┌───────────────────────────────┐
                                  │  Embeddable badge (R2 image,   │
                                  │  anchor tag with href to the  │
                                  │  dossier; dofollow backlink)  │
                                  └───────────────────────────────┘
```

The directory's two surfaces are deliberately isolated: a SvelteKit terminal UI on the submission route, and TanStack Start server-rendered pages on the dossier route. There is no client-side fetch on the dossier; the canonical HTML is the dossier.

## Milestones

1. **M0 — Submission loop end-to-end.** URL in, ≤ 5 interview questions answered, REC-N written, dossier URL returned. The character voice is system-prompt-locked from day one.
2. **M1 — Server-rendered dossiers + badge loop.** Each record has a permanent URL on the dossier route, with the crawled excerpts inlined; the embeddable badge serves an anchor with a real `href` back to the dossier and is one snippet away on the dossier page itself.
3. **M2 — Voice regression test + style guide.** A regression test asserting the last 100 records each carry a verdict word (not a number); a public style guide on what ARCHIVE-9 can and cannot say, to defuse the HAL-9000 quotation risk before legal review.
4. **M3 — Public launch + record counter continuity.** Continue the `REC-####` sequence from the 3,900+ on-file counter; document and publish the policy for the existing 3,900+ (interview-filed vs. imported) and the policy for newly filed records.

## Risks

- **Voice consistency is product-critical.** A model swap, a fine-tune, or a prompt change is a regression risk; a "verdict is a word" regression test must run before each deploy.
- **HAL-9000 quotation risk.** ARCHIVE-9's voice is one prompt away from a trademark-quotation problem; a style guide that names the boundary between homage and quotation is in scope before the LLM prompts are committed.
- **LLM latency during the interview.** Streamed output is the only way the loop feels alive under 800–2000 ms per question; anything above that breaks the cadence. Test under realistic network conditions before launch.
- **Dofollow link integrity.** The embed snippet must be a real anchor tag with a real `href`; a JS-only click handler or a `nofollow` would break the badge's growth-loop claim. The dossier's outbound to the submitter must be a normal anchor.
- **Existing 3,900+ records vs. new filings.** The capture states a count but not a shape; an audit of how those records were filed (interview-filed vs. imported) is the load-bearing piece of credibility. Decide the policy and document it before the public launch.
