---
id: "780"
slug: a-musician-from-lebanon-cannot-sell-his-music-streaming
title: "A musician from Lebanon cannot sell his music: streaming pays pennies, and Bandcamp doesn't accept payments in his country. Needs a fair radio-platform with direct sales."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/media/0vvg4xzv91-a-musician-from-lebanon-cannot-sell-his"
category: media
date: "2026-01-21"
tags: [Media, Other]
country: Lebanon
tech: [Elixir, Phoenix LiveView, PostgreSQL, Stripe Connect, Cloudflare R2, Mux, Tailwind CSS, Docker, Fly.io]
---
# A musician from Lebanon cannot sell his music: streaming pays pennies, and Bandcamp doesn't accept payments in his country. Needs a fair radio-platform with direct sales.

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A radio-platform that pays the musician rather than the platform: scheduled, always-on playback of the artist's catalogue combined with a direct-to-fan checkout the musician can actually be paid through. The fan hears the radio, decides to buy, and the platform routes the payment (or the largest supported slice of it) directly to the musician rather than into a royalty pool that pays pennies per stream.

The value is two-sided and stacked. For the musician, the radio is a free, always-on discovery surface that does not require fans to remember to come back, and the checkout is a path that exists for them, not against them. For the fan, the radio is curated, scheduled listening rather than an algorithmic feed, and the purchase screen shows them where the money goes.

The architecture is explicit about the country problem the post names. A payment-processor fallback is built in, not bolted on; the musician's onboarding tells them which processors serve their country and lets them pick. The radio itself is the same regardless of where the listener is, because the music does not need a payment processor to play.

**One-liner:** BeirutRadio (and every city after it) plays an artist's catalogue on an always-on radio and lets the fan pay the artist directly, even when the major platforms refuse to.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Independent musician in a restricted country | Cannot sell on the major direct-sales platforms; needs a sales path that pays out to their country. |
| Listener who likes scheduled discovery | Wants a curated radio surface rather than an algorithmic playlist. |
| Music fan who wants to pay the artist | Wants to see the split at checkout and know the money reaches the musician. |
| Small label / collective | Needs a shared radio surface with per-artist analytics and a single payout reconciliation. |
| Cultural organisation or diaspora scene | Wants a radio presence that does not depend on one international platform's terms. |

## Jobs To Be Done

1. **Functional job** — Discover a new artist by listening to a radio rather than searching.
2. **Functional job** — Buy a single track, an album or a monthly subscription without leaving the radio's context.
3. **Functional job** — Get paid as a musician from a country the major direct-sales platforms exclude.
4. **Emotional job** — Stop feeling that streaming pays in cents and direct-sales platforms refuse to serve.
5. **Emotional job** — Stop worrying that a checkout will fail at the moment a fan is ready to pay.
6. **Social job** — Signal to a local scene that the platform exists for them, by playing their music on a radio anyone can hear.

## Success Metrics

- **Listen-to-sale conversion** — share of radio listens that end in a purchase, since the product only matters if the radio drives sales.
- **Payout success rate** — share of attempted payouts that reach the musician's account, because a payout that fails defeats the platform's reason to exist.
- **Radio uptime** — share of hours the radio is audibly live to a listener, since the discovery value lives in the listen.
- **Onboarding success in restricted countries** — share of musician onboardings from restricted countries that reach a working payout without manual intervention.
- **Catalogue freshness** — average age of tracks in active rotation per musician, since a stale radio does not drive new sales.
- **Fan-side checkout completion** — share of initiated checkouts that complete, since a checkout that fails at the last step is the same as no checkout.

## Pricing & Monetization

The post names no price, no tier and no commission rate. What the architecture forces is a percentage-of-sale cost shape: the platform's cut is a slice of the fan's payment, the rest is the musician's, and the listener sees the split at checkout. The platform's revenue therefore scales with the volume of sales, not with the volume of listens, which is the explicit inversion of the streaming model the post is rejecting. The processor fallback path may carry a different effective rate per country, and that difference is disclosed at checkout rather than hidden.

## Competitive Landscape

- **Major streaming services** — pay the artist in pennies per stream and are the baseline the post is rejecting; they are not the same product, but they are what the musician is currently stuck with.
- **Bandcamp** — named in the post as the major direct-sales platform that does not accept payments in the musician's country; the gap it leaves is the product's opening.
- **Community and genre-specific radio stations** — provide the radio experience but do not pair it with a direct-to-artist checkout in the same session.

The post names one competitor. No comparison is claimed beyond the three shapes above.

## Risks & Open Questions

- [ ] Validate that at least one payment processor reliably pays out to Lebanon today, and document the onboarding path so a musician can follow it without the maintainer's help.
- [ ] Decide how the platform handles the case where no processor serves the musician's country; a graceful, honest path matters more than a forced signup.
- [ ] Confirm the listen-to-sale conversion rate the radio actually produces at launch, before committing to the always-on infrastructure cost.
- [ ] Establish the policy on catalogue rights: how the radio handles a track the musician later signs exclusively elsewhere, and how a takedown request from a third party is processed.
- [ ] Measure whether Mux + Cloudflare R2 keeps the per-listen cost low enough that a small musician's listen volume does not eat the platform's cut.
- [ ] Decide whether the radio schedule is fully musician-controlled or curated by an editor, since the value of "radio" depends on that answer.
