# PRODUCT.md — How do you test an app from a region you're not physically in?

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ We run a small B2B product for a few overseas markets. We keep seeing bugs that only reproduce locally: country-specific payment SDK behavior, stale CDN edge cache, and TLS&#x2F;TTFB issues that only appear on local mobile networks.<p>VPN and emulators are insufficient. VPN does not replicate carrier routing or device integrity checks like Play Integrity. Commercial device farms rarely guarantee physical device location, which is what we need.<p>We’re thinking of hosting physical devices in target countries and remote-controlling them. The connection is solvable, but we’re worried about operations: carrier NAT traversal, unattended OS updates, battery&#x2F;thermal drift, and long-running failure modes.<p>What has worked for you? Self-hosted remote hardware, device farms with location limits, or accepting user-reported bugs?

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

| Stakeholder | Why they care |
|---|---|
| Early adopters | _[What pain they feel, and how this solves it]_ |
| Founders | _[What pain they feel, and how this solves it]_ |
| SMEs | _[What pain they feel, and how this solves it]_ |

## Jobs To Be Done

1. **Functional job** — _[What the user is trying to accomplish]_
2. **Emotional job** — _[How they want to feel]_
3. **Social job** — _[How others perceive them using this]_

## Success Metrics (North Star)

- **Activation:** _[% of signups who complete X within Y days]_
- **Retention:** _[DAU/MAU, week-1 retention, cohort curves]_
- **Revenue:** _[MRR target, ARPU, LTV/CAC]_

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_TODO:_ list 2-3 alternatives + differentiation.

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49723043) · **Category:** ask-hn · **Tags:** Ask HN,Problem
