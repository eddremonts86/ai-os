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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A small ecommerce operator or solo agency gets the production and monitoring layer of a performance marketing team for $39–$249 per month — competitor monitoring, creative generation, hourly fatigue detection, and a copilot that reads the connected account and queues specific recommendations. The human keeps strategy, positioning, and the budget sign-off. Compared with the alternative (a freelance creative at $150–500 per finished concept, a part-time media buyer at $1,500–3,000 per month, or a full team in the five figures), the article frames the price as roughly 1–5% of the human cost of the same work.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Solo ecommerce founder | Bottlenecked on creative volume; reads Meta metrics but cannot ship 20 variations a week; the Starter $39 plan is the entry point. |
| Brand performance team ($10K–$50K/month spend) | Creative fatigue is eating ROAS; needs fatigue detection + 300 credits + competitor intelligence under the Pro $99 plan. |
| Small agency managing multiple clients | Needs separate brand kits per client and enough credits to keep every client's ads fresh; Scale $249 covers 10 brands. |
| Independent media buyer evaluating tools | Wants a loop that actually closes (discover → create → launch → optimize), not an AI image generator with a Meta connector bolted on. |
| Meta itself | Indirectly: third-party tools that ship more structurally-distinct creative into Andromeda's auction benefit the platform's overall ad-quality signal. |

## Jobs To Be Done

1. **Functional job** — Ship 20+ structurally distinct creatives per week into the Meta auction without a designer on staff.
2. **Functional job** — Catch creative fatigue within 24 hours of the leading-indicator move (frequency, hook rate, CTR) instead of at the weekly dashboard review.
3. **Emotional job** — Stop feeling like every Monday morning reveals a problem the team should have seen on Wednesday.
4. **Social job** — Tell the founder or the client "we ran a structured test, here's what won" instead of "we tried a few things."
5. **Risk-management job** — Keep a human explicitly in the loop on every budget action, because no tool refunds ad spend when the automation guessed wrong.

## Success Metrics

- **Activation:** free audit completed within 24h of signup, with the first set of recommendations surfaced without a card.
- **Creative volume per active account:** median ≥ 8 new Meta-ready creatives shipped in the first 30 days on the Starter plan, ≥ 25 on Pro, ≥ 60 on Scale.
- **Fatigue MTTD:** median time from leading-indicator move (frequency ≥ 3.0, hook rate down ≥ 25% from baseline) to a flagged replacement in the workspace is under 24 hours.
- **Approval loop latency:** median time from recommendation surfaced to human approve/dismiss decision is under 4 hours during the user's working hours.
- **Paid conversion:** ≥ 30% of free-audit users reach their first credit purchase within 14 days; ≥ 12% convert to a paid plan within 30 days.
- **Net revenue retention:** ≥ 110% by month 6 as Pro accounts upgrade to Scale once they add a second client.
- **Public ROI claim:** the published "Starter pays for itself in 3 days at $10K monthly spend" claim is auditable from the in-app calculator on every workspace.

## Pricing & Monetization

Three public tiers, monthly and annual (20% off on annual): Starter $39/month (100 credits, 20 Ad Library searches/month = 1,200 ads), Pro $99/month (300 credits, 60 searches/month = 3,600 ads), Scale $249/month (750 credits, 100 searches/month = 6,000 ads, up to 10 brand workspaces). Free account audit + 10 credits on signup, no card required. Credit packs power AI image and video generation, product shoots, scrapes, AI ad copy, fatigue detection, A/B variations, and the competitor intelligence module. Enterprise plans exist but are not listed; the "calculate your creative ROI" widget on the public site pulls the Starter plan into the headline number.

## Competitive Landscape

- **Madgicx, AdAmigo, Revealbot (autopilot class)** — execute budget and bid changes automatically within rules. Faster reaction time but no human gate; the founder explicitly rejects this trade for budget actions because errors are expensive and compounding.
- **Smartly, Adext (walled-garden AI)** — AI-driven Meta and Google bid automation; covers a different surface (auction-internal optimization) than the discover-create-launch-optimize loop AdRiseLab closes.
- **Meta Advantage+** — Meta's own auction-internal AI suite; optimizes whatever creatives and budgets you hand it. The founder's counter is that Advantage+ inside the auction is a different job from external creative operations.
- **Generic AI image / video generators (Midjourney, Runway, Sora)** — generate pretty pictures but have no Meta account connection, no fatigue signal, no competitor monitoring. They are the wrong abstraction layer for performance marketing.
- **Spreadsheets + cron + a human** — what small accounts do today; brittle, no audit trail, no creative structural diversity.

## Risks & Open Questions

- [ ] Whether Meta's Marketing API edit-in-place refresh actually preserves the learning phase in practice, or whether Meta changes the contract. The 7–14 day creative-decay math collapses if every refresh resets learning.
- [ ] Whether the credit math at $39 for 100 credits covers the genuine cost of generation + monitoring, or whether the Starter tier is a loss-leader paid for by Pro and Scale. The pricing page says 100 credits is "enough to refresh your ads every week," but does not publish the underlying cost per credit.
- [ ] Whether the founder's "AI cannot be accountable for ad spend" position survives contact with a competitor that ships true autopilot and converts on speed. The article is unambiguous about the trade but the market may not be.
- [ ] Whether the article-cited Icon collapse (a startup that over-claimed AI Admaker and reversed to human services) materially shifts buyer skepticism against the whole category, including AdRiseLab. The founder addresses this directly in the article; whether it lands is a market question, not a product one.
- [ ] Whether the public "Starter pays for itself in 3 days at $10K monthly spend" ROI claim holds up across enough account archetypes to keep being published. One well-publicized counter-example will undermine the marketing more than any feature announcement can repair.

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49484708) · **Category:** show-hn · **Tags:** Show HN, Product, Problem
