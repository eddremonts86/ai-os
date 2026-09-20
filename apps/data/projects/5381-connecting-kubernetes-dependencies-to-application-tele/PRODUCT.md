# PRODUCT.md — Connecting Kubernetes dependencies to application telemetry

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I’m building Cardinal (cardinalhq.io). One thing that drives me nuts about Kubernetes debugging is the number of steps it takes to go from an application issue to its underlying kubernetes root cause.<p>Like for example, if I am seeing an error rate spike, and I group by deployment, I want to immediately see the deployment&#x27;s k8s neighborhood, which would then show me the configmap that was updated recently and incorrectly.<p>Similarly, say a node is low on disk and that is causing a ripple effect on a statefulset trying to write new files, which then affects request latency.<p>The list goes on.<p>To solve this, one idea we had was: build a smart chart legend that recognizes a k8s tag (based on OTEL semantic conventions), and then for every entry pops an &quot;infra map&quot; icon. Click and you see the full k8s neighborhood of that entity with health annotations. So now it&#x27;s easier to go from app telemetry to k8s infra.<p>I am curious if this UX makes sense, and if not how do you solve this correlation problem today?<p>https:&#x2F;&#x2F;cardinalhq.io&#x2F;use-cases&#x2F;kubernetes

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49588372) · **Category:** ask-hn · **Tags:** Ask HN,Problem
