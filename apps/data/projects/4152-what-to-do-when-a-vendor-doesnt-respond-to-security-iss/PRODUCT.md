# PRODUCT.md — What to do when a vendor doesn't respond to security issues?

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I got fed up with a certain internet-connected appliance at home, and decided to investigate its firmware. Since the vendor claims the product is still in active support and not EOL, my main goal was to find a pre-existing CVE it was vulnerable to and report that so the vendor would need to release an updated firmware, hopefully with other improvements too.<p>The latest build was years old, so that wasn&#x27;t too hard. I found an outdated service that is reachable unauthenticated from LAN and has a known vulnerability that allows arbitrary file reads on the device. I also found another endpoint that is unauthenticated from LAN and with a single GET request essentially bricks the device, requiring disassembly and JTAG access to recover from. There are no cross-origin checks or restrictions of any kind, so a malicious site could put the URL in an img tag or similar and brick visitors&#x27; devices with no interaction.<p>I&#x27;m in the EU, so I went to their EU site where I was first instructed to create a ticket on their support site. I tried numerous times but it always failed with &quot;an unknown error&quot;, instructing me to &quot;contact the service desk&quot; with no clues how to reach them. I also found another form where you could select security issue as the topic, but the description field was barely long enough to fit &quot;I found security issues with ${product}, please contact me for more details.&quot; Three weeks later I&#x27;m still waiting.<p>Next I filed the same security issue form on their US site, and promptly got a reply. The exact model isn&#x27;t sold in the US so they wouldn&#x27;t handle it directly, but promised to forward any details to their EU counterpart since I had such a hard time reaching them directly. I sent the issue details and have not heard back since. I sent a follow-up email asking for a status update, but so far that has gone unanswered too.<p>What should I do next? Is there some EU entity that could step in? Can I get in trouble if I just publish what I found?

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49507259) · **Category:** ask-hn · **Tags:** Ask HN,Problem
