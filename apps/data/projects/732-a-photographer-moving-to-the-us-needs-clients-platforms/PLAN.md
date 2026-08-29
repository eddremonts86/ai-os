---
id: "732"
slug: a-photographer-moving-to-the-us-needs-clients-platforms
title: "A photographer moving to the US needs clients. Platforms require reviews, agencies are expensive. Wants a website + ads that bring bookings. Willing to pay $100–300/month."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/6t7ke01t41-a-photographer-moving-to-the-us-needs-cl"
category: other
date: "2026-07-17"
tags: [Immigration, Freelance, Marketing, Career, Other]
country: Serbia
wtp:
  raw: $100-300/month
  currency: USD
  min: 100
  max: 300
  period: month
  mrrMid: 200
tech: [Next.js, TypeScript, Tailwind CSS, Stripe subscriptions, Google Ads API, Meta Ads API, Calendly embed, Coolify]
---
# A photographer moving to the US needs clients. Platforms require reviews, agencies are expensive. Wants a website + ads that bring bookings. Willing to pay $100–300/month.

## Tech Stack

- **Frontend:** Next.js (App Router) + TypeScript + Tailwind CSS, served from a single Coolify instance behind Docker; one workspace subdomain per photographer (`{slug}.platform.com`).
- **Backend:** Next.js server actions + Route Handlers for booking submissions, lead capture, and Stripe webhooks; SQLite (via Drizzle ORM) for workspaces, leads, wallet balances, and ad-spend logs.
- **Ads:** Google Ads API (search + local services campaigns) and Meta Marketing API (Instagram + Facebook lead-gen), both wrapped behind an internal `AdChannel` interface so a third channel (TikTok Ads) can be added later.
- **Booking widget:** Calendly or Cal.com embed (v1 fastest path); native widget deferred to v2.
- **Payments:** Stripe Subscriptions ($100/month, $90/month annual) and Stripe Top-ups for the prepaid ad-spend wallet; webhook updates `Workspace.subscriptionStatus` and `Wallet.balanceCents`.
- **Auth:** email-link (Resend) passwordless; single workspace per account.
- **Notifications:** Resend transactional email + Twilio SMS for new-lead alerts (SMS opt-in per workspace).

## Architecture

A single Next.js app serves the photographer-facing dashboard (authed) and the public portfolio site (unauthed, route group `(public)`). On signup, the photographer completes a self-serve form (city, genre, portfolio upload, ideal-client description); the platform generates a niche site, configures Google + Meta campaigns from a per-genre template, and pauses the campaigns until the photographer tops up the wallet. A cron worker (same Node process) syncs ad spend from each channel's API every hour and updates the wallet balance; nightly it generates a per-workspace performance digest and emails it.

```
Photographer signup ─▶ self-serve onboarding form
                              │
                              ├─▶ niche site generated (template + portfolio)
                              │
                              ├─▶ Google Ads campaign created (paused)
                              │
                              ├─▶ Meta Ads campaign created (paused)
                              │
                              └─▶ Wallet = $0, awaiting first top-up

Top-up ─▶ Stripe ─▶ webhook ─▶ Wallet.balanceCents += amount
                                          │
                                          └─▶ unpause campaigns if first top-up

Lead submits booking widget ─▶ Route Handler ─▶ leads table
                                          │
                                          ├─▶ email + SMS to photographer
                                          │
                                          └─▶ dashboard shows new row

Hourly cron ─▶ Google/Meta API ─▶ ad_spend_log
                          │
                          └─▶ Wallet.balanceCents -= spend, low-balance alert at $20
```

## Milestones

1. **M0 — Spec + design freeze.** SPEC.md, DESIGN.md, niche-site template approved. End of week 1.
2. **M1 — Onboarding + site generation.** Self-serve signup form, niche site template rendering, portfolio upload. End of week 3.
3. **M2 — Ads integration.** Google Ads API and Meta Ads API integrations, per-genre campaign templates, paused-by-default. End of week 5.
4. **M3 — Wallet + booking.** Stripe Subscriptions, Stripe Top-ups, Calendly/Cal.com embed, lead capture, email + SMS notifications. End of week 7.
5. **M4 — Cron + dashboard.** Hourly ad-spend sync, nightly digest, wallet dashboard, low-balance alerts. End of week 9.
6. **M5 — Pilot cohort.** 10 relocating photographers onboarded across 5 US cities; weekly performance review for 8 weeks. End of week 17.

## Risks

- **Google / Meta Ads API access tier.** Both platforms gate SMB-tier API access behind partner programs with months-long approval; if the launch cannot secure partner status, the v1 launch slips or falls back to manual ad-account linking via Google Ads Editor / Meta Business Suite exports (degrades the self-serve promise).
- **AI-generated ad creative policy.** Meta's "misleading claims" and "before-and-after" policies reject a meaningful slice of generated captions and headlines; the platform must keep a curated template library per genre and only let AI vary within safe bounds, not generate from scratch.
- **Cost-per-booking at $200/month ad spend.** In a saturated metro (LA, NYC) the median cost-per-lead for family / newborn / headshot photography is $25–$60; a $200/month budget yields 3–8 qualified leads, which is workable but thin if conversion is below 30%. The Pro tier (deferred) may need to ship earlier if median cost-per-booking exceeds $60 across the cohort.
- **Wallet accounting drift.** Ad-spend reconciliation between Google / Meta's billing API and the photographer's wallet must be exact; a daily reconciliation job that flags drift > $5 is load-bearing, or trust evaporates after the first disputed top-up.
- **Cross-border relocation friction.** The author is relocating from Serbia; payment methods (US bank account vs. international card), tax form (W-9 vs. W-8BEN), and Stripe Connect onboarding all diverge for non-US photographers. The signup flow must route by country of origin or it will reject valid users.
- **Niche-site SEO runway.** City landing pages need 60–90 days to rank organically for "[city] [genre] photographer"; paid search is the bridge, but if Google Ads budget is exhausted before organic kicks in, the workspace churns before SEO pays off.
