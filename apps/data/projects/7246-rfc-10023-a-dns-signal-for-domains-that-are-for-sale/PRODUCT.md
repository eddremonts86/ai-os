# PRODUCT.md — RFC 10023: A DNS signal for domains that are for sale

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ The IETF recently published RFC 10023, which I authored. It defines a small DNS convention for signalling that a registered domain is currently for sale.<p>What has been particularly encouraging is the amount of traction and support it has already received so soon after publication. A number of tools and projects have already added support or are building around the idea, including:<p>- https:&#x2F;&#x2F;forsaledns.net&#x2F; — an early adopter and reference implementation.<p>- https:&#x2F;&#x2F;for-sale-dns.hx-std.com&#x2F; — a simple lookup tool and record generator.<p>- TLDX — a tool for quickly finding available domain names.<p>- happyDomain — centralised domain management.<p>- https:&#x2F;&#x2F;ipwhois.net&#x2F;domain&#x2F;example.nl — a domain and DNS lookup service.<p>- https:&#x2F;&#x2F;inspectmydns.com&#x2F; — another handy DNS inspection tool.<p>- https:&#x2F;&#x2F;ipaddress.to&#x2F;lookup&#x2F;example.nl — a collection of useful domain&#x2F;IP tools, with API output that also helps detect syntax errors.<p>- https:&#x2F;&#x2F;www.rfc10023.de&#x2F;en — a new tool aimed primarily at German-speaking users, with an English version already taking shape.<p>The basic idea is deliberately simple: a domain owner can publish a `_for-sale` TXT record:<p>_for-sale.example.com. 300 IN TXT &quot;v=FORSALE1;furi=https:&#x2F;&#x2F;example.com&#x2F;buy&quot;<p>That&#x27;s it - the domain has it&#x27;s for sale sign.<p>Further info: https:&#x2F;&#x2F;rfc10023.nl&#x2F;<p>Let me know what you think and please let me know if I’ve missed anything or if there are any updates to the list I keep!

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49718470) · **Category:** ask-hn · **Tags:** Ask HN,Problem
