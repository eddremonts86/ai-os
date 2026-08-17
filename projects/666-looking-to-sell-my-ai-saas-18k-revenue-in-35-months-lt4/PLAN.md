---
tags: ["saas", "twitter", "ai", "byok"]
tech: ["Next.js", "TypeScript", "Tailwind CSS", "Cloudflare", "Dodo Payments", "Resend", "Umami"]
id: "666"
slug: looking-to-sell-my-ai-saas-18k-revenue-in-35-months-lt4
title: "Looking to Sell my AI SaaS: $1.8K revenue in 3.5 months, <$45/month in costs"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vpvny2/looking_to_sell_my_ai_saas_18k_revenue_in_35/"
category: saas
date: "2026-08-16"
---
# Looking to Sell my AI SaaS: $1.8K revenue in 3.5 months, <$45/month in costs

## Tech Stack

- **Web app:** Next.js + TypeScript + Tailwind CSS (existing stack inherited from the source).
- **Browser extension:** TypeScript + Tailwind CSS, manifest v3, talks to the web app for the style profile.
- **BYOK layer:** customer-supplied OpenAI / Anthropic / xAI key, stored encrypted at rest with libsodium; never logged.
- **Hosting:** Cloudflare Pages + Workers (free tier covers the documented traffic).
- **Payments:** Dodo Payments (existing in source; recurring + lifetime-deal support).
- **Email:** Resend.
- **Analytics:** Umami (self-hosted, no third-party tracking).
- **Domain:** Spaceship.
- **Affiliate platform:** custom-built on Next.js + Resend (existing in source).

## Architecture

Three components: the web app (writes to Cloudflare KV / D1 for the user's style profile, watchlists, and keyword list), the browser extension (reads from the active X page and pushes tweets into the web app for reply drafting), and the AI gateway (proxies inference to the customer's chosen provider with their key). The operator's server never holds an API key; the customer's key lives in their session.

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + a single-user reply-drafting demo with a fake style profile. End of week 1.
2. **M1 — BYOK auth + reply drafting.** Customer pastes their OpenAI key, opens a tweet in the extension, sees 3 draft replies. End of week 3.
3. **M2 — Custom style training.** Customer pastes 20-50 example posts; the system produces a style profile; reply drafts use it. End of week 5.
4. **M3 — Watchlists + keyword monitoring.** Daily digest email of new posts in the tracked list. End of week 7.
5. **M4 — Billing.** Lifetime-deal and recurring tiers via Dodo Payments. End of week 9.
6. **M5 — Public beta.** 200 indie founders from r/SaaS and IndieHackers. End of week 12.

## Risks

- **BYOK churn** — the customer can quit paying for AI inference and lose the value of the tool overnight. Mitigation: a usage-metered credit pack (operator-paid inference, marked up) as a fallback plan.
- **X platform policy** — rate limits and API pricing can break the extension overnight. Mitigation: a fallback "paste a tweet URL" path that does not require the extension.
- **Lifetime-deal margin compression** — the source sold $1,800 of lifetime deals against $45/month operating cost; a future operator cannot repeat that without a recurring tier to cover the long tail.
