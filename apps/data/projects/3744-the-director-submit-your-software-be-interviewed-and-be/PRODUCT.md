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

## Value Proposition

A software directory that is not a database with a search box, but a *character* (ARCHIVE-9, a HAL-9000-toned AI who is calm, dry, and faintly menacing) conducting an interview with the submitter about the tool they want on file. The submitter does not fill a form — they answer the AI's questions, the AI names the verdict ("REMARKABLE," "RESPLENDENT"), and the record is filed as a `.REC` with a permanent server-rendered dossier page and an embeddable badge that the submitter drops on their own site. The badge is the friction-free way the dossier's link becomes a dofollow backlink, so the directory's growth is built into the directory's product. The capture states "Free" and "3,900+ records on file" — the directory is already running.

**One-liner:** A software directory where the discovery surface is not a search box but a CRT terminal that interviews the submitter, files the tool as a named verdict-bearing record, and trades an embeddable badge for a dofollow back-link.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Indie founder / small-team product owner | Wants a software directory listing that is character-driven, with a dofollow back-link earned by placing a badge on the submitter's own site. |
| Directory visitor / reader | Enjoys the HAL-9000-styled voice enough to click through to other records; occasionally submits their own tool after a visit. |
| Crawlers / link-graph readers | Consume the server-rendered dossier pages as canonical record entries; their traffic is itself an upstream driver of the directory's discovery. |

## Jobs To Be Done

1. **Functional job** — File a tool in a software directory in under five minutes by typing a URL and answering an AI's questions, then walk away with a badge to embed and a record URL to point to.
2. **Emotional job** — Stop the "I am one more row in a directory's database" feeling the submitter has every time they paste a tool into a form; the directory's voice is the part they remember.
3. **Social job** — Be able to link to a dossier URL where the directory itself spoke about the tool, rather than to a static page where a stranger wrote a feature list.

## Success Metrics

- **Submission completion rate:** ≥ 60% of submitter sessions that typed a URL also completed the interview and filed a record (the funnel drop-off is the metric that says the interview loop is too long).
- **Badge embed rate:** ≥ 40% of filed records show the badge image request hitting the directory within 30 days of the record being filed.
- **Dossier visit-to-badge-visit:** visitors who arrive at a dossier from outside the directory (search, social, link-graph) and then click through to the embed instructions or badge image at a rate ≥ 5% is evidence the dossier page is doing the work of a category listing.
- **Voice consistency:** ≥ 95% of the AI's dialogue in the interview loop is reviewed as on-register (calm, dry, faintly menacing). The voice is the product; slippage is a regression.

## Pricing & Monetization

The source states "Free" with no qualifier. The product ships free to submitters. There is no paywall in the capture for: submission, the dossier page, the badge, or embed access. Two reasonable, source-respecting directions a future revenue model could take, neither of which the MVP ships:

- **Sponsored verdict ribbons.** A category-level "SPONSORED" notation on a dossier, paid for by the submitter. The MVP does not introduce this because the capture states verdicts are always "kind words."
- **Featured placement on the home feed.** A paid slot to be the top of the CRT terminal's first screen. Again, not in the MVP capture.

A pricing calculator does not exist because the MVP is free. If a paid tier is added later, the source-grounded wedge will be either visibility (feature / home feed) or embed depth (rich badges, badge analytics), and the move must not break the source's "verdicts are always kind words, never numbers" constraint.

## Competitive Landscape

- **Product Hunt** — launching pad; community voting; submission is a public moment of judgment. The Director pitches itself as the *opposite* — verdicts are words, not votes, and the submission is private.
- **BetaList** — landing-page-with-email pattern; the upload moment is friction; the directory's value is the early-access funnel. The Director's submission moment is a CRT-styled interview — a different category of friction.
- **G2 / Capterra / GetApp** — review sites with numeric ratings. The Director's source explicitly states verdicts are *words*, not numbers.
- **Open-source directories like awesome-{category}** — community curated GitHub lists with no character, no interview, and no dofollow-back-link badge mechanic.

Differentiation stated by the source: an interview loop with a HAL-9000-toned AI, verdicts-as-words, embeddable-badge-as-dofollow-loop, and a directory that is already at 3,900+ records and running free.

## Risks & Open Questions

- [ ] "ARCHIVE-9" is a registered-trademark risk if the product's voice strays into HAL-9000 quotation; a style guide on what the AI can and cannot say is a non-negotiable before the LLM prompts are committed.
- [ ] LLM interview latency is the submitter's visible wait time; the CRT-styled slow line-by-line rendering hides 800-2000 ms of latency for free, but anything beyond a few seconds breaks the rhythm. Test the prompt-and-stream pipeline before publishing the landing copy.
- [ ] The dofollow-badge mechanic depends on the dossier page's outbound link being a normal anchor tag (a real `href` attribute), not a `nofollow`-marked link or a JS-only click; the embed snippet must be a real anchor tag.
- [ ] The directory is already at "3,900+ records"; the source does not say *when* the existing records were filed or what the shape of those 3,900 looks like (interview-filed vs. imported). Decide on a policy for "imported records" before the corpus owner is asked to defend it.
- [ ] The voice *is* the product. Every prompt change, every model swap, every fine-tune is a regression risk for the brand; a regression test that asserts "verdict is a word, not a number" on the last 100 records is part of MVP.
