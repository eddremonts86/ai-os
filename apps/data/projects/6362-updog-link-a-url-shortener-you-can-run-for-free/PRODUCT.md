# PRODUCT.md — Updog.link – a URL shortener you can run for free

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hi HN. I half-built a dumb link-shortening service in 2020 on API Gateway and DynamoDB, and never finished it, but that didn&#x27;t stop me from registering an &#x27;updog&#x27;-themed domain for it. I forgot about it until tonight and decided it was worth finishing this tool from a bygone era.<p>I scrapped everything and moved to more modern tools: one script on a Cloudflare Worker, with the links (and the Terraform state) in R2. You can use what I&#x27;m hosting if you want, or clone it and deploy your own. Here are some of the characteristics:<p>It&#x27;s free-ish. It runs on Cloudflare&#x27;s free tier, which serves something like a hundred thousand requests a day.<p>It&#x27;s stateless-ish. Each link is an immutable JSON object in R2. No traditional databases or servers, nothing to really run or maintain.<p>It&#x27;s private-ish. There are no click stats, so nobody can see who followed a link, including the person who made it. Cloudflare&#x27;s edge presumably logs something somewhere, because that&#x27;s what edges do.<p>It&#x27;s funny-ish, if you can remember being 12.<p>What surprised me most is how simple a task this has become. Not only is writing code much faster, but the architecture and footprint are much smaller. I like to think I&#x27;m also better at my job, but that part is probably negligible.<p>The S3-ish object + short-lived compute architecture was sorta possible in 2020, but not that common as I recall. The simplicity is what let me rework and publish it from the couch in an evening.<p>You can make a shortlink with it here: <a href="https:&#x2F;&#x2F;whats.updog.link" rel="nofollow">https:&#x2F;&#x2F;whats.updog.link</a><p>Source (MIT): <a href="https:&#x2F;&#x2F;github.com&#x2F;ignore-prior-instructions&#x2F;Updog.link" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;ignore-prior-instructions&#x2F;Updog.link</a>

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49655103) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
