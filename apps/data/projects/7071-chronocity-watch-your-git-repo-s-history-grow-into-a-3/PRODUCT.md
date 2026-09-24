# PRODUCT.md — Chronocity – Watch your Git repo's history grow into a 3D city

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ This is timelapse of a 3D city simulation based on your Git history, files are buildings and height is based on LOC. Weather can determines if the repo is quiet or active during a span of time.<p>Just a fun visual to get the momentum overview of your project. I&#x27;ve been working a lot in 1 repo for the past few months and got a handsome amount of commits, so I decided to make something visually appealing to &#x27;appreciate&#x27; my work somehow.<p>Based on the ideas of: CodeCity (Richard Wettel &amp; Michele Lanza) and Gource (Andrew Caudwell, 2009). Instead of static city like CodeCity or 2D tree like Gource, chronocity is an 3D interactive city and you can even drive car in there lol.<p>All in the browser, TypeScript + three.js, isomorphic-git in a Web Worker, WebCodecs for the video.<p>It scans your .git folder (all client-sided, nothing uploaded) and through the main branch (downscaled to 2000 steps for big repos), compares files, LOC with previous step. three.js renders all the buildings in one instanced mesh, and height is the square root of LOC. The weather is not random: the sky follows the local time (their time zone) of people that commited, fog indicates quiet stretches, rain means a burst of changes in a short window.<p>Try your own project straight in my GitHub page, drop your Git cloned repo there (containing .git folder, all in your browser, your repos are stored in YOUR cache, this is serverless).

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49708188) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
