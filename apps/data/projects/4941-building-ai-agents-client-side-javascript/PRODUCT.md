# PRODUCT.md — Building AI agents client-side JavaScript

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hey HN, most agent systems default to server-side Python inside containers and chain frameworks. I wanted to see how far we could push agent in the browser with vanilla JavaScript <a href="https:&#x2F;&#x2F;buttercup.sh" rel="nofollow">https:&#x2F;&#x2F;buttercup.sh</a><p>The reason this is interesting is because agent loops in the browser keeps infrastructure costs low. No need for proxy or API calls. And ollama&#x2F;vLLM can be used for 100% offline. Also WebLLM for embedded. We need to consider CORS, API keys for remote models, access to visual state, and handling remote tool calls. I am working on a guide with references in vanilla JS. This is a short-lived guide starting mid-September with weekly topics.<p>Draft topics starting mid-September:<p>In-Browser Loops: Function calling, and deterministic multi-turn loops running purely in the browser runtime.
Vision (Multimodal): Capturing viewport screenshots using browser APIs.
Remote Agent Access &amp; Transports: Connecting the in-browser agent to remote agents.
Multi-Agent Coordination: Lightweight client-side agent, specialist delegation, and running concurrent sub-agents without locking the browser UI thread.<p>Everything is open source, zero-install, and runnable directly in the browser. Would love feedback from the HN community on agents running in browsers.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49557409) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
