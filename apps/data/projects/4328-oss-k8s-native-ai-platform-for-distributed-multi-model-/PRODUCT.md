# PRODUCT.md — OSS, K8s-native AI platform for distributed multi-model inference

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hi everyone,<p>I’m one of the co-founders of axem. We recently open sourced Shaide, a project we’ve been working on to make running multiple LLMs on your own infrastructure less painful.<p>It started pretty simply. Running one model wasn’t the hard part. The hard part came when we needed several models running at the same time, scaling them independently across GPU nodes, routing requests between replicas, and making the whole setup reproducible without relying on an external cloud service.<p>Over time we ended up building most of that infrastructure into one platform, and decided it made more sense to open source it rather than keep it internal.<p>Current setup:
- vLLM for inference
- llm-d for multi-instance orchestration
- multiple models running and scaling independently
- KV-cache-aware scheduling
i- nternal OCI registry for container images + model weights
OpenAI-compatible API
- the entire platform is managed as infrastructure as code
- interactive installer that runs from Docker against an existing Kubernetes cluster
- can operate fully air-gapped with no cluster egress<p>It currently works with on-prem RKE2 as well as EKS&#x2F;GKE&#x2F;AKS.<p>The project is Apache 2.0 and still fairly early, so there are definitely things that will change as more people try it.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49521905) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
