# PRODUCT.md — Zero downtime embedding model upgrades

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ People use embedding models all the time for rag&#x2F;semantic retrieval. However, when a newer, more desireable model comes out, there is an expensive (both in time and computational) cost of re-embedding every document in the database.<p>However, I figured out an interesting way to forgo that upfront embedding cost.<p>algo:<p>old model&#x2F;index -&gt; retrieve top-K docs -&gt; score those docs with the new model -&gt; cache&#x2F;materialize the new embeddings<p>so instead of rebuilding the entire vector store upfront, the old index keeps getting retrieved from, while the new model reranks those candidates.<p>This works surprisingly well for some model pairs, (i tested 63 source-&gt; target migrations on h100s, on upto 1M documents).<p>For example, on a 1M document Natural Questions dataset,<p>native Qwen3-Embedding-8B: 0.6812 nDCG@10
Qwen3-4B -&gt; Qwen3-8B, K=50: 0.6816
Qwen3-0.6B -&gt; Qwen3-8B, K=50: 0.6638
MiniLM -&gt; Qwen3-8B, K=50: 0.6486<p>(the hard part is determining k, I held the k constant above to give some sense of migratability).<p>You can install it with pip<p>pip install embedflow<p>and the code is on github<p><a href="https:&#x2F;&#x2F;github.com&#x2F;arnsri33&#x2F;embedflow" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;arnsri33&#x2F;embedflow</a>

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49605110) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
