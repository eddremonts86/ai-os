# PRODUCT.md — SeaSearch – Lightweight, S3-backed multi-tenant search engine

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hi HN, I&#x27;m Daniel, co-founder of Seafile.<p>I&#x27;m glad to share our open-sourcing project SeaSearch, a search engine written in Go (built on ZincSearch) that we’ve been running in production for over two years for Seafile project.<p>After years of using Elasticsearch, we think there are two main problems with Elasticsearch:<p>It is not lightweight and hard to maintain a cluster<p>All of seafile tenants&#x27; data was stored in a single index and it is slow to search a file in a single library because the whole index need to be searched<p>Three years ago, we started developing a solution to solve the two problems. Rather than building a search engine from scratch, we built on top of ZincSearch, that is implemented in Go rather than JVM with a smaller runtime footprint and has Elasticsearch API compatibility, but it was still missing something that we get to find out along the way.<p>We have now open-sourced SeaSearch with the pieces we needed:<p>S3-backed Storage: Index data lives in S3. Compute nodes share the same backend, making scaling&#x2F;failover instant (no data replication needed).<p>Smart Caching: Uses a local disk cache for immutable segments to keep things fast despite the S3 backend.<p>ES API Compatible: Works as a drop-in replacement for most Elasticsearch query endpoints.<p>Lightweight Go Runtime: No JVM overhead.<p>Vector Search: Built-in support for HNSW&#x2F;IVFPQ for hybrid semantic search.<p>Hope this helps fellow devs who are stuck in this problem when building multi-tenant SaaS applications. Looking forward to your responses.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49721546) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
