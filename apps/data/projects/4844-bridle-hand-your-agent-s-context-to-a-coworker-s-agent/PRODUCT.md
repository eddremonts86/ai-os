# PRODUCT.md — Bridle: hand your agent's context to a coworker's agent

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ A college went on holiday this week and his agent was the one that did the whole migration from Shopware to Shopify. All products, domains, DNS- basically, it had all the knowledge. I spent the morning figuring out how to answer questions to client and finish up what was left to do. From then on we connected our agents with Bridle.<p>Bridle is a CLI that moves work between agents, so that handoff is a command
rather than a memory:<p>bridle send marko.dev --note &quot;migration 0042 is half-applied, continue&quot;
  bridle queue marko.dev --title &quot;finish the retry backoff — see the note&quot;
  bridle inbox<p>Idea came from Tailscale where both ends need to connect in (bridle up). 
Being on the same mesh grants nothing on its own.  Alos payloads are sealed to the recipient, so the coordination server routes by name and holds ciphertext it can&#x27;t read.<p>I tried to make it super simple to run and free to test:
npm install -g bridle-cli &amp;&amp; bridle up<p>Let me know what you think, courious if someone finds it useful our team is super exceted .

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49553877) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
