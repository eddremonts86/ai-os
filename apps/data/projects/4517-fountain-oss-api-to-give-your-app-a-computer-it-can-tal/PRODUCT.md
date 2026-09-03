# PRODUCT.md — Fountain – OSS API to give your app a computer it can talk to

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Building tools for engineering teams running a bajillion Claude Code sessions, I kept hitting the same problem. To build the apps I wanted, I needed long-running processes that could scale to 0 when idle, resume quickly and retain their files and context. That meant I had to own the machine lifecycle, sandbox setup, credential handling, and communications plumbing. A bunch of stuff that isn&#x27;t core to the products I wanted to build, but I needed all of it to make the product work.<p>After several attempts to build directly on Fly Machines and reimplement this layer in each app, I threw my hands up. There was ANOTHER missing abstraction. Thankfully Fly.io shipped Sprites.dev, which gave me the compute primitive I needed: a vm that could idle between turns without losing its disk.<p>Agent Client Protocol solved the communication side. Fountain uses ACP to talk to different agent harnesses and exposes ACP on the client side so users can drive Fountain conversations from ACP-enabled apps.<p>Fountain is the api I wanted all along. Setup an environment, spec out an agent, give it some access and then just prompt it over http. It handles the machinery of managing the sandbox, running the agent harness, and streaming the response.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49528322) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
