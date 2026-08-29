---
id: "882"
slug: nigerians-cant-access-local-movies-due-to-expensive-sub
title: "Nigerians can't access local movies due to expensive subscriptions and piracy"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/media/pypg9yzgy1-nigerians-cant-access-local-movies-due-t"
category: media
date: "2025-10-25"
tags: [Media, Legal]
country: Nigeria
---
# Nigerians can't access local movies due to expensive subscriptions and piracy

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

An affordable, mobile-first streaming platform for Nollywood and pan-African films, priced for the Nigerian market rather than the global market, with three side-by-side monetisation paths (subscription, pay-per-view, ad-supported) so every viewer finds a legal way in. Creators get a transparent revenue share (70/30), a portal to upload their own catalogue with rights documentation, and a path to a revenue stream they do not have today.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Nigerian viewer (₦1k–₦5k/month disposable) | Wants Nollywood and pan-African films at a price they can afford; Netflix is out of reach. |
| African diaspora (UK / US / CA / EU) | Willing to pay global-market prices for legal Nollywood and pan-African content. |
| Nollywood / pan-African creator (producer, distributor) | Needs a legitimate distribution channel and a transparent revenue share. |
| Mobile carrier / payments partner (indirect) | New transaction volume through Paystack, Flutterwave, and USSD rails. |

## Jobs To Be Done

1. **Functional job** — Watch Nollywood and pan-African films on a low-end Android phone over 3G, pay for them in a way that fits the local budget (subscription, pay-per-view, or ads), and download some for offline viewing.
2. **Emotional job** — Stop the daily anxiety of "should I pirate this or wait for it to land somewhere legal?" — there is now a legal option at the right price.
3. **Social job** — Be able to recommend a Nollywood film to friends without the conversation ending in "where do I find it legally?".

## Success Metrics

- **Affordability reach:** ≥ 70% of monthly active Nigerian viewers pay ≤ ₦1,500/month (or watch with ads for free); the platform's ARPU in Nigeria is ≤ $1/month, well below Netflix.
- **Catalogue breadth:** launch with ≥ 200 licensed Nollywood / pan-African titles; ≥ 50 new titles added per month from the creator portal by month 6.
- **Creator payout:** ≥ 90% of creator-uploaded titles that pass rights review reach first payout within 60 days of upload; 100% of payouts are settled via the documented 70/30 split.
- **Offline downloads:** ≥ 30% of paid-tier users download at least one title per month; offline plays account for ≥ 20% of total watch time.
- **Latency:** first video frame in ≤ 3 seconds on a median Nigerian 3G connection at 480p.

## Pricing & Monetization

Three side-by-side monetisation paths so every viewer finds a legal way in:

- **Free ad-supported tier** — unlimited streaming with ≤ 2 ads per 30-minute session; 5 offline downloads / month; the headline experience for viewers who cannot pay.
- **Subscription — ₦1,500/month (≈ $1)** — unlimited streaming, no ads, 20 offline downloads / month; targets the median Nigerian viewer.
- **Pay-per-view — ₦500/title (≈ $0.32)** — buy individual titles to keep forever (including offline); no subscription required.
- **Diaspora pricing** — $4.99/month or $1.99/title for viewers outside Africa; same catalogue, different price band.
- **Creator revenue share** — 70% to the creator, 30% to the platform; published in the creator portal; paid monthly via Paystack / Flutterwave / direct bank transfer.

## Competitive Landscape

- **Netflix, Amazon Prime, Disney+** — global catalogues with limited Nollywood and pan-African content at Nigerian-unaffordable pricing (Netflix Nigeria standard is ₦4,400/month).
- **Showmax** — African-focused but priced at ₦3,200/month and operated by a multinational media group; not local-creator-led.
- **iROKOtv** — the closest incumbent; Nollywood-focused, but pricing and catalogue depth vary, and creator revenue share is opaque.
- **YouTube** — the de facto free, ad-supported destination for Nollywood, but no offline downloads, no creator-controlled monetisation, and no legal PPV path.
- **Piracy sites** — the default today; free, ubiquitous, and the reason local creators cannot monetise.
- **Local TV broadcasters (NTA, Silverbird)** — free-to-air but not on-demand and not mobile-first.

## Risks & Open Questions

- [ ] Rights licensing is the single biggest operational risk. Each title needs a signed licence with the producer or rights-holder. Mitigation: a creator portal that requires rights documentation on upload; legal review before a title is published; default to "sub-only" monetisation until rights are fully cleared.
- [ ] Bandwidth and device constraints. Most Nigerian viewers watch on a 2 GB RAM Android over 3G. Mitigation: aggressive bitrate adaptation, 480p default with one-tap 720p upgrade, resumable downloads, and a PWA shell for low-storage devices.
- [ ] Payment friction. Card penetration in Nigeria is still limited; the free ad tier must work without any payment method, and the paid tiers must default to USSD and mobile-money rails. Mitigation: Paystack + Flutterwave + USSD at launch; recurring subscription billed through Paystack's saved instrument.
- [ ] Piracy substitution. If the platform prices even ₦1,500/month too high, viewers will pirate. Mitigation: the free ad tier is the legal answer for the price-sensitive segment; the price band is calibrated against piracy's "free" anchor, not Netflix's anchor.
- [ ] Co-founder fit. The author is explicitly looking for a co-founder. Mitigation: the build plan is sized for 2 people; if no co-founder is found, the founder must recruit or bootstrap solo.
- [ ] Catalog discovery. Without a Netflix-grade recommendation engine, the catalogue feels like a stack of tapes. Mitigation: a "trending in Lagos / Abuja / PH" rail at launch, then a collaborative-filtering model on the watch history of the first 10k users.
- [ ] Creator payout fraud. A malicious creator could upload content they do not own. Mitigation: rights documentation review before publish; takedown workflow; creator identity verification (BVN for Nigerian creators, passport for diaspora).

---

_Source:_ [ProblemHunt](https://problemhunt.pro/en/media/pypg9yzgy1-nigerians-cant-access-local-movies-due-t) · **Category:** media · **Tags:** Media,Legal
