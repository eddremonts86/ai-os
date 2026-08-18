---
id: "593"
slug: social-media-alerts
title: Social Media Alerts
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1voqu49/social_media_alerts/"
category: saas
date: "2026-08-15"
tags: [saas, social-listening, ai, alerts]
tech: [Next.js, TypeScript, OpenAI embeddings, Reddit API, X.com API, Supabase, Resend, Stripe]
---
# I'm looking for a social media alert app for Reddit and X.com based on semantic search

## Tech Stack

- **Web app:** Next.js + TypeScript + Tailwind CSS.
- **Ingest:** Reddit API + X.com API v2.
- **Embeddings:** OpenAI text-embedding-3-small (or local equivalent) over post text.
- **Storage:** Supabase (auth, concepts, embeddings, daily digests).
- **Routing:** Resend for email, Slack webhook for Slack.
- **Payments:** Stripe.

## Architecture

Web app + a daily ingest job that pulls Reddit + X.com posts, embeds them, and matches against per-user concept embeddings. The digest is assembled per user with relevance tiers.

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + a single-concept digest demo. End of week 1.
2. **M1 — Reddit ingest + semantic search.** End of week 3.
3. **M2 — X.com ingest.** End of week 5.
4. **M3 — Daily digest + Slack routing.** End of week 7.
5. **M4 — Stripe paywall + Pro tier.** End of week 9.

## Risks

- **X.com API pricing** — volatile; per-user cost must be bounded and surfaced in the UI.
- **Relevance precision** — the per-user relevance-feedback loop is the differentiator; without it, the digest becomes noisy fast.
