---
id: "3684"
slug: substack-and-x-and-reddit-and-crypto-pow
title: Substack and X and Reddit and Crypto = POW
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49485378"
  captured: "2026-08-28"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [SvelteKit, TypeScript, PostgreSQL, Drizzle ORM, Nostr relays, eCash (XEC) node integration, Coolify, Docker]
---
# Substack and X and Reddit and Crypto = POW

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A writer publishes once and the same post reaches long-form readers, microblog followers, and thread commenters inside one product, with tip income settling in XEC on-chain rather than through a payment processor. The poster's framing — Substack + X + Reddit + a crypto token — collapses four accounts into one and replaces platform-paid monetization with token-paid monetization.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Independent writer / newsletter operator | Currently publishes on Substack, amplifies on X, hosts discussion on Reddit, and has no on-platform way to convert readers into paying supporters beyond a newsletter paywall. |
| Crypto-native micro-community | Already runs tipping and games on the source site; wants the same loop on a self-hostable app that ties tokens to writing, not to speculation. |
| Reader | Wants one feed that mixes long-form articles, short posts, and threaded replies instead of switching between three apps. |

## Jobs To Be Done

1. **Functional job** — Publish one piece of writing and have it surface as long-form article, short post, and discussion thread without re-formatting.
2. **Emotional job** — Feel that tips from readers are direct economic signals from a person, not noise from a recommendation algorithm.
3. **Social job** — Be visible as a writer inside a community that tips, ranks, and rewards — instead of being one feed entry among millions on a generic social platform.

## Success Metrics

- **Activation:** ≥ 60% of new accounts publish at least one article or microblog within 7 days of signup, and ≥ 30% connect an XEC deposit within 14 days.
- **Engagement:** Median reader comments on ≥ 10% of articles; ≥ 40% of comments earn a tip within 24h of being posted.
- **Retention:** Week-4 returning-reader rate ≥ 25%; month-3 writer retention ≥ 40% of accounts that posted in week 1.
- **Economy:** Median XEC tips per active writer ≥ 100 XEC / week; treasury tip-fee revenue covers Coolify hosting cost within 3 months of public launch.

## Pricing & Monetization

The source site already charges a per-post fee in XEC and runs a 100K XEC bug bounty on top. Mirror that in v1: charge a fixed posting fee in XEC (set by the platform, not the poster, so the fee can't be gamed to zero), take a fixed bps cut on tips routed through the in-app wallet, and keep all on-platform prize pools (weekly leaderboard) sourced from the treasury. No fiat subscription in v1 — the entire unit of account is XEC, matching the source site's operating model.

## Competitive Landscape

- **Substack + X + Reddit (the disjoint stack)** — what writers actually use today; four accounts, four audiences, no shared tip economy.
- **Steemit / Hive-style "earn crypto to blog"** — similar shape but token design is inflationary and rewards are decoupled from any specific writer's quality signal.
- **Mirror.xyz** — crypto-native long-form publishing with on-chain posts but no microblog, no threaded discussion, and no tipping from reader to writer.
- **Lens / Farcaster** — on-chain social graph with tipping, but long-form writing is a third-class citizen and the audience there skews crypto-native, not general readership.

## Risks & Open Questions

- [ ] Confirm the eCash (XEC) block time and finality model are short enough that tip confirmation under one block feels instant; if not, the tip UX will lag visibly.
- [ ] Decide custody model for the in-app wallet in v1: custodial keys in a Coolify-managed HSM, or non-custodial where the user signs locally? Custodial is faster to ship but makes the platform a target.
- [ ] Validate that the per-post XEC fee is high enough to deter spam and low enough that a new writer can publish ten posts for the cost of a coffee; the source site has already iterated on this and the chosen rate should be benchmarked against it.
- [ ] Confirm whether the on-chain tip flow must support XEC-to-XEC only, or also allow tipping through Lightning / other eCash L2 — Lightning support would materially expand the reader-side addressable market.
