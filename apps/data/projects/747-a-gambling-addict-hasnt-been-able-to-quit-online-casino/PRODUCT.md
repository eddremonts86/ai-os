---
id: "747"
slug: a-gambling-addict-hasnt-been-able-to-quit-online-casino
title: "A gambling addict hasn't been able to quit online casinos for years. All known methods have failed. He has three hypotheses for solving his own problem. Willing to pay $15–30/month."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/psychology/dopyur7701-a-gambling-addict-hasnt-been-able-to-qui"
  captured: "2026-04-20"
category: psychology
date: "2026-04-20"
tags: [Psychology, Other]
country: USA
wtp:
  raw: $15–30/month
  currency: USD
  period: month
  min: 15
  max: 30
  mrrMid: 22.5
tech: [Mobile (iOS + Android via React Native or Flutter), bank/card linking via Plaid, AI relapse-detection on device screenshots or app usage, end-to-end encryption of all journal data]
---
# A gambling addict hasn't been able to quit online casinos for years. All known methods have failed. He has three hypotheses for solving his own problem. Willing to pay $15–30/month.

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A gambler who has exhausted blockers, self-exclusion, and therapy gets one mobile app that combines a tapered-dose simulator, an AI "panic button" that intercepts the moment of relapse, and a friend-confirmed financial barrier — so the right tool fires at the right moment instead of relying on willpower between sessions, at $19/month, anonymously, with end-to-end encrypted journal data.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Online-casino gambler (US, similar markets) | Has tried blockers, self-restrictions, therapy, and Gamblers Anonymous without lasting effect; needs an in-the-moment intervention that fights the dopamine loop, not the consequences. |
| Family member / partner | Acts as the trusted confirmer on the financial barrier and the panic-button call; wants a way to help without becoming a 24/7 supervisor. |
| Addiction clinician / GA sponsor | Wants a tool that closes the "moment of relapse" gap their existing methods leave open so they can recommend it without owning the outcome. |
| Crypto-aware user (subset) | Wants the financial barrier to cover crypto wallets too, not just bank cards, because casino deposits increasingly happen on-chain. |

## Jobs To Be Done

1. **Functional job** — Have the right tool fire in the moment of relapse (simulator to taper the urge, panic button to interrupt it, financial barrier to block the spend) without choosing between them.
2. **Emotional job** — Stop hating themselves after a relapse because there is now a system between the urge and the loss, instead of relying on willpower that has already failed for years.
3. **Social job** — Be able to tell a partner or family member "the app blocks it unless you confirm" instead of "I promise I'll stop", after years of broken promises.

## Success Metrics

- **Activation:** ≥ 70% of new signups complete simulator setup + trusted-confirmer invite + at least one financial-barrier rule within the first 7 days.
- **Relapse containment:** ≥ 60% of detected relapse events (casino app/URL open) result in a panic-button interaction rather than an unblocked casino session in the first 30 days.
- **Spend blocked:** financial barrier triggers a friend-confirmation request at least once per active user per month on average; > 80% of those requests are declined by the friend.
- **Retention:** ≥ 50% of users remain subscribed after 90 days; the author has stated willingness to pay $15–30/month, but churn in this category is brutal — if 90-day retention is below 40%, the taper isn't working.
- **Anonymity:** ≥ 99% of accounts have no email and no phone on file (the trusted confirmer is the only shared identifier).

## Pricing & Monetization

$19/month subscription (mid-point of the author's $15–30 stated willingness to pay); annual plan at $15/month locked. Anonymous signup, no email required, no ads, no data resale. Family-confirmer accounts are free (they are the protection mechanism, not a paying customer).

- **Gamblers Anonymous / clinic referrals** — recommended but require willpower + sponsor contact; do not handle the in-the-moment dopamine spike.
- **Bank / card gambling blocks** — available at many US banks since 2024, but bypassable by switching to crypto or a new card; do not address the urge itself.
- **App-store blockers + cold-turkey apps** — static blocklists the user can disable in a moment of weakness; the author explicitly rejects blockers as a solution.

## Competitive Landscape

- **BetterHelp / Talkiatry + therapy** — the author tried a psychologist; the issue is the moment of relapse, not the between-session reflection.
- **GamCare / National Council on Problem Gambling** — helplines and self-exclusion registries; they do not intervene in real time and rely on the user to call.

## Risks & Open Questions

- [ ] Validate the on-device screenshot-detection hypothesis with iOS and Android — both platforms have restricted screen-capture APIs, and a background detector may need foreground permission that Apple has not yet approved.
- [ ] Decide the friend-confirmer liability model: if a friend declines a transfer and the user relapses anyway through another channel, is the friend protected? Document the legal and ethical boundary before launch.
- [ ] Confirm the tapered simulator does not itself become a trigger — a cent-stakes casino app could re-trigger heavy gamblers and may need a clinician-reviewed "harm-reduction vs harm-creation" gate before activation.
- [ ] Confirm US bank coverage for Plaid-based casino-counterparty detection; not every issuer exposes merchant category codes for gambling, and the financial barrier must work for the user's actual cards, not a curated list.

---

_Source:_ [ProblemHunt](https://problemhunt.pro/en/psychology/dopyur7701-a-gambling-addict-hasnt-been-able-to-qui) · **Category:** psychology · **Tags:** Psychology,Other
