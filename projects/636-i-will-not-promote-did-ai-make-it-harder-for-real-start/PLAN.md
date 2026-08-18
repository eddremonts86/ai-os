---
id: "636"
slug: i-will-not-promote-did-ai-make-it-harder-for-real-start
title: "I will not promote: did ai make it harder for real startups to win?"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/startups/comments/1vozijo/i_will_not_promote_did_ai_make_it_harder_for_real/"
category: startups
date: "2026-08-15"
tags: [ai-noise, discovery, quality-signals, curation]
tech: [Next.js 14, Postgres + Drizzle, OpenAI embeddings, Resend, Plausible]
---
# I will not promote: did ai make it harder for real startups to win?

## Tech Stack

- **Next.js 14 (App Router)** — the directory, the rubric page, and the editorial admin are all served from one deployable; the editorial workflow is a protected route inside the same app, not a separate CMS.
- **Postgres + Drizzle** — the canonical store for entries, rubric scores, and the public edit history; relational integrity is the point in a curated product.
- **OpenAI embeddings (text-embedding-3-small)** — used only to find near-duplicates in the submission queue so the curator does not publish the same entry twice; never used to score.
- **Resend** — the weekly digest email; templated, not synthesised, so the curator's voice is consistent.
- **Plausible** — analytics on the directory and the rubric page so the curator can see which rubric dimensions drive reads.

## Architecture

The directory is a Next.js app with two surfaces: a public directory at `/` and a protected editorial surface at `/admin`. The public directory lists entries, each with a one-paragraph depth score, a category, a stage, and a link to the source. The editorial surface exposes a submission queue, a draft state, and a public edit history so the score is auditable. The weekly digest is a Sunday cron that pulls the week's newly published entries, runs a templated email through Resend, and links to each entry. The rubric is published as a markdown page so visitors can read it before reading a score. The depth-score widget is a small JSON-served snippet that the founder can drop on their site; the widget fetches the canonical score from the directory so the score is never out of sync.

```
visitor                directory (Next.js)        editor                 Resend          Plausible
  |                       |                       |                       |               |
  |---browse entries----->|                       |                       |               |
  |                       |                       |                       |               |
  |                       |---embed widget------->|                       |               |
  |                       |                       |                       |               |
  |                       |---submits entry-------|                       |               |
  |                       |                       |---queue review------->|               |
  |                       |                       |---applies rubric----->|               |
  |                       |                       |---publishes entry---->|               |
  |                       |                       |                       |               |
  | (Sunday cron)         |                       |---new entries ------>|---email-----> |
  |                       |                       |                       |               |
  |---reads entry-------->|                       |                       |               |
  |                       |---event----------------------------------------> |               |
```

## Milestones

- **M1 — Rubric published:** A 5-7 criterion rubric written in plain language, with each dimension captioned so a visitor can read it in two minutes.
- **M2 — First 20 entries:** Curated by hand, applied to the rubric, published with a one-paragraph depth score each; the directory's first credible batch.
- **M3 — Editorial admin:** A protected route to queue, draft, score, and publish; with a public edit history on every entry.
- **M4 — Weekly digest:** Sunday cron + Resend; the first 200 subscribers come from the curator's own network.
- **M5 — Depth-score widget:** A small embed that any founder can drop on their site; the widget fetches the canonical score from the directory.
- **M6 — Inter-rater test:** Two outside curators apply the rubric to the same 20 entries; the resulting inter-rater agreement is published as a methodology note.

## Risks

- **Risk:** The rubric is rejected as gatekeeping by founders who do not make the cut. **Mitigation:** Publish the rejection reason template; the curator writes a one-paragraph note for every entry, published or not.
- **Risk:** The directory becomes a target for founders trying to game the rubric. **Mitigation:** The rubric is published and intentionally not formulaic; gaming it would require gaming the work itself, which is the point.
- **Risk:** The weekly digest is unread because the curator's voice is monotonous. **Mitigation:** Ship the digest with three different opening lines and rotate; measure open rate per opening.
- **Risk:** The product is mistaken for a YC competitor and dismissed. **Mitigation:** Position the directory as a complement, not a replacement; the depth-score widget works on YC-funded companies too.
- **Risk:** The product is mistaken for an AI-vs-real detector. **Mitigation:** The rubric is explicitly about depth, not origin; the public page says so on the rubric itself.
