---
id: "3689"
slug: adriselab-i-built-an-ai-media-buyer-for-my-own-meta-ads
title: AdRiseLab – I built an AI media buyer for my own Meta ads
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49484708"
  captured: "2026-08-28"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
wtp:
  raw: "$39/month (Starter), $99/month (Pro), $249/month (Scale)"
  currency: USD
  min: 39
  max: 249
  period: month
  mrrMid: 99
tech: [Next.js, TypeScript, Python (FastAPI), PostgreSQL, Meta Marketing API, Stripe]
---
# AdRiseLab – I built an AI media buyer for my own Meta ads

## Problem

The poster (Caner Moral, founder of AdRiseLab) defines a category he calls "AI performance marketer": software that closes the loop on Meta ads — discover what is working in a niche, generate platform-native creatives, launch them via API, watch performance every hour, and tell the operator what to change next. His article traces the pain to a structural change: Meta's Andromeda algorithm made the ad's creative the primary targeting mechanism, so the volume of structurally distinct creatives an account ships is now the binding constraint on results, and the old "one hero ad refreshed monthly" cadence is losing to accounts that ship 20–40 variations weekly and prune winners by hook rate and frequency. The article reports that winning creatives on Meta typically decay within 7–14 days, and a human watching Ads Manager once a day catches that decay late; software watching every metric every hour catches it early. The poster's explicit constraints: AI cannot be accountable for ad spend, so the AI drafts and recommends and the human approves; no vendor refunds ad spend when the automation guessed wrong; the tool is the execution layer, not the decision layer.

The author's framing of the problem is that there is a real, repeatable loop (discover → create → launch → optimize) and that production and monitoring in that loop are exactly what current AI does well — leaving the human free to handle positioning, offer, budget allocation, and reading what caused the CPA spike.

## Objective

Ship a Meta-ads copilot that automates discover, create, and optimize — with human approval at every budget action — so a small ecommerce account can run the volume of creative testing that Andromeda rewards without growing a media-buying team. Three pricing tiers are posted publicly: Starter $39/month (100 credits, for solo brands), Pro $99/month (300 credits, the most-popular plan), Scale $249/month (750 credits across up to 10 brands, for agencies).

## Target Users

- Primary: solo ecommerce founders who run their own Meta ads and have hit a creative-volume ceiling — they can read the metrics but cannot produce 20 variations a week and check every ad every morning. The Starter plan is sized for them.
- Secondary: performance teams at brands spending $10K–$50K/month on Meta where creative fatigue is the bottleneck. Pro is sized for this cohort and adds competitor intelligence.
- Tertiary: small agencies running Meta for multiple clients, who need separate brand kits per client, separate ad-account connections, and enough credits to keep every client's ads fresh. Scale is sized for this cohort.
- Out of scope for v1: enterprise advertisers running $500K+/month on Meta with an in-house team; the article is explicit that AdRiseLab does not compete there.

## MVP Scope

- Meta Marketing API integration (OAuth2 + Marketing API v18+) covering: account structure read, ad set and creative CRUD, insights rollups, ad-library scraping for competitor monitoring.
- Creative generation pipeline that takes a product URL or photo, extracts assets and value proposition, and emits Meta-ready image and video creatives in the platform's preferred aspect ratios — including the "edit-in-place refresh" path that swaps creative signals without resetting the learning phase.
- Fatigue monitoring: hourly checks on frequency, hook rate, CTR, and CPA; flagged creative enters a refresh queue with replacement variants already generated from the product page.
- AI Media Buyer copilot: a chat-shaped surface that reads the connected account and returns ranked, specific recommendations ("hero ad crossed frequency 3.2, hook rate -31% from baseline, replace with these two variants"); recommendations stay recommendations, no execution without human approval.
- Competitor intelligence: 20/60/100 Meta Ad Library searches per month by tier, each search returning tagged ads by hook type, format, and visual style with run duration as a performance proxy.
- Three-tier Stripe billing with credit packs per tier, free account audit + 10 credits on signup, no card required for the audit.

## Design Direction

See `DESIGN.md` for this project's design tokens. Two surfaces again: the marketing site (long-form, editorial, founder-voice — the article is itself the most credible ad) and the in-app workspace (dashboardy, status-coloured, AI recommendations as cards with explicit approve/dismiss actions).

## Constraints

- The article is explicit that the AI cannot be accountable for ad spend. The product's architecture must reflect that: every budget or bid change is a recommendation that requires an explicit human click, even when the user has set up rules. This is a design constraint, not a feature to add later.
- The poster's published pricing is $39 / $99 / $249 per month, with a stated ROI claim that the Starter plan pays for itself in 3 days at $10K monthly spend. The credit math has to actually close: 100 credits per month at $39 has to be enough for a small account to refresh creatives weekly, or the ROI claim collapses.
- 10 free credits with no card on signup is a public promise; the activation funnel must surface the audit result before asking for payment, or the funnel converts at noise level.
- All creative output must be "platform-native": structurally distinct variations in the formats the auction rewards, not stock-template variants. The M1 milestone is the difference between "an AI image generator with a Meta connector" and "an AI performance marketer," and the company has explicitly named that difference.
