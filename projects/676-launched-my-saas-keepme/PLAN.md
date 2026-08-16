---
tags: ["saas", "consumer", "ai", "content-saver"]
tech: ["Next.js", "TypeScript", "SwiftUI", "Supabase", "Anthropic Claude", "AWS", "Stripe"]
id: "676"
slug: launched-my-saas-keepme
title: Launched my SaaS - KEEPME
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vptxt6/launched_my_saas_keepme/"
category: saas
date: "2026-08-16"
---
# Launched my SaaS - KEEPME

## Tech Stack

- **Web app:** Next.js + TypeScript + Tailwind CSS.
- **iOS app:** SwiftUI, iOS 16+ deployment target.
- **Backend:** Supabase (auth + content metadata + the credits ledger).
- **AI layer:** a single Anthropic Claude call per save for tag generation, with a hard cap on monthly inference cost per user.
- **Hosting:** AWS (inside the credit window for 12 months), then migrate to Cloudflare.
- **Payments:** StoreKit 2 (iOS) + Stripe (web).

## Architecture

Web + iOS share the Supabase backend. The AI layer is a single serverless function invoked on save.

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + a single-save demo. End of week 1.
2. **M1 — Save + retrieve with manual tags.** End of week 3.
3. **M2 — AI-generated tags + credit ledger.** End of week 5.
4. **M3 — iOS app.** End of week 8.
5. **M4 — Paid tier + Stripe.** End of week 10.

## Risks

- **AWS-credit window closing** — the paid tier must convert inside 12 months.
- **AI cost** — every save triggers an inference call; a runaway cost curve will eat margin.
