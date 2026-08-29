---
id: "3705"
slug: visitsreport-analytics-you-can-publish-and-prove
title: Visits.Report – analytics you can publish and prove
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49487243"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [Plain HTML, vanilla JS tag, Cloudflare-edge hashing, SQLite]
---
# Visits.Report – analytics you can publish and prove

## Value Proposition

A privacy-first analytics product whose only dashboard is a public page anyone can recompute — so the moment your numbers matter to somebody else, they can verify them themselves.

**One-liner:** Your analytics, published and provable.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Site owners selling attention | They have an advertiser, sponsor, or buyer who wants to see real numbers; a screenshot of a dashboard is a claim, a public recomputable page is a receipt. |
| Buyers, sponsors, and acquirers | They are tired of being shown analytics they can't verify; a recomputable hash chain and a DNS TXT ownership check turn "trust me" into "check it yourself". |
| Operators of small standalone sites | They want server-side counting with no cookie banner, no fingerprinting, and no client-side dashboard to maintain; the script tag is one line, the rest is on the operator's infrastructure. |

## Jobs To Be Done

1. **Functional job** — Run analytics on a site without dropping a cookie banner and without handing a counterparty a screenshot you could have edited.
2. **Emotional job** — Stop the low-grade worry that an advertiser who asks "can you show me the numbers?" has more leverage than you do, because the answer is "yes, and you can check them".
3. **Social job** — Hand a link to a public page that says what the numbers are and how to verify them; the verification story is the social proof.

## Success Metrics

- **Activation:** % of signups who add the script tag and complete the DNS TXT ownership check within 14 days (a site without the TXT check shows a banner saying so, which is itself an activation signal).
- **Retention:** Daily traffic per active site as the floor metric; the analytics product is one the operator checks daily, so retention is a function of site activity, not product stickiness.
- **Revenue:** Free tier at the entry; the landing page shows `Start free` and does not state paid tiers. The pricing shape is unstated in the source.

## Pricing & Monetization

The landing page shows `Start free`. No pricing tiers, no per-seat, no traffic-based billing, no enterprise tier is named in the source. The shape of paid plans is a question the post does not address.

## Competitive Landscape

The product's positioning is direct: "Every analytics tool shows you your traffic. The hard part is showing it to somebody who has a reason to doubt you." That is the wedge against any analytics tool — Google Analytics, Plausible, Fathom, Umami, Matomo — none of which produce a public, recomputable, DNS-anchored report by default. The privacy posture (no cookies, no fingerprinting, no stored IPs, daily-salted hashes) is the wedge against cookie-banner-mandated analytics in the EU. The product does not name competitors on its landing page.

## Risks & Open Questions

- **The hash chain is the product.** If the daily sealing logic has a bug, the entire trust claim breaks. The MVP needs a small, reviewable sealing implementation and a public verifier that operators (and their counterparties) can run against any historic report.
- **DNS TXT ownership is a UX cliff.** Many site owners do not know how to add a TXT record; the public page must be honest about this but not pushy, because the alternative is "fake traffic claim" and the product's whole claim is the opposite.
- **Daily visitor reset is a feature and a limit.** The founder is explicit about it; users who want cohort analytics or funnel analysis are not the audience. A future "events" tier would change the privacy posture and the post does not address that.
- **Revenue model unstated.** Free + free + free is not a business. The founder has not stated a paid tier, per-site pricing, or an enterprise path; the post leaves this as an open question.

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49487243) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
