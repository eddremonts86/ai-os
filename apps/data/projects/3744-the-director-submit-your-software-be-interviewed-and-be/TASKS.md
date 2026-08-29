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

## Phase 0: Scaffold

- [ ] Define the schema in Drizzle: `records` (REC-####, slug, verdict, dossier_url, submitted_url, submitted_at), `interviews` (record_id, transcript, q_count, completed_at), `crawl_runs` (record_id, pages_pulled, summary).
- [ ] Stand up SvelteKit on the submission route with a CRT-styled monospace, line-by-line rendering surface and a "type a URL" entry prompt.
- [ ] Stand up TanStack Start on the dossier route, server-rendered; every dossier URL renders canonical HTML with the verdict and the crawled excerpts inlined at request time.
- [ ] Wire the Crawlee worker to the SvelteKit submission route so a typed URL triggers a crawl (5-15 pages) and the LLamaIndex RAG context for the interview.
- [ ] Provision Postgres + Drizzle ORM and the Cloudflare R2 bucket for the embeddable badge images.
- [ ] Lock the ARCHIVE-9 system prompt and write the regression test that asserts every verdict in the `records` table is a word, not a number.

## Phase 1: Core

- [ ] Build the interview loop: ARCHIVE-9 asks ≤ 5 questions per session, the answers stream back as monospace text, the transcript is appended-only.
- [ ] Build the `REC-####` writer: on completion, assign the next number in the global counter (continuing from the existing 3,900+ sequence), choose the verdict word ("REMARKABLE" / "RESPLENDENT" / "NOTEWORTHY" / etc.), persist the record and the interview transcript.
- [ ] Server-render the dossier route with crawled excerpts inlined as evidence next to the verdict. No client-side fetch on the route.
- [ ] Ship the embeddable badge: an anchor tag with a real `href` pointing to the dossier URL, wrapping an SVG/PNG on the dossier page itself, with a one-line copy-and-paste snippet.
- [ ] Add a regression test that asserts every new record's verdict is a single word from a known list, never a number, never a star rating.
- [ ] Add a style guide on what ARCHIVE-9 can and cannot say (HAL-9000 homage vs. quotation boundary) and lock the system prompt against drift.

## Phase 2: Deploy

- [ ] Audit the existing 3,900+ records: how many were interview-filed vs. imported; publish the policy and the breakdown on the directory's about page.
- [ ] Run a public beta with a hand-picked set of submitter tools; measure submission completion rate and badge-embed rate from the funnel.
- [ ] Verify the dofollow-link integrity on the embed snippet from a third-party site that has the badge in production.
- [ ] Run a load test on the dossier route under realistic visitor counts; the dossier is server-rendered, so the test is a server-rendering throughput test, not a cache test.
- [ ] Create the GitHub repo, deploy SvelteKit + TanStack Start to Coolify, and verify the production deployment end-to-end.

---

_Enriched 2026-08-29 from BetaList capture._
