# PRODUCT.md — Mitmcloak – mirror the client's TLS/H2/H3 fingerprint in mitmproxy

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ mitmproxy cannot recreate the client&#x27;s TLS, it uses python&#x27;s TLS stack, so even with a real browser behind it, your connection looks like that of a python script. To solve this, I&#x27;ve created mitmcloak. It reads the client&#x27;s ClientHello and HTTP&#x2F;2 preface in real time and mirrors it with httpcloak (my other tls client library), no capture or fine tuning of the preset required.<p>H3 is mirrored as well though QUIC only reaches the proxy in wireguard&#x2F;transparent&#x2F;reverse mode as a proxy setting doesn&#x27;t redirect UDP by default.<p>mitmcloak is an addon to mitmproxy, not a fork, so your setup stays exactly the same. Also it does not bypass certificate pinning, that&#x27;s a different problem.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49546984) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
