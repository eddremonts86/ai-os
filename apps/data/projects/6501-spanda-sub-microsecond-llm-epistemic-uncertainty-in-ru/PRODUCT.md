# PRODUCT.md — Spanda: Sub-microsecond LLM epistemic uncertainty in Rust

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ We built an open-source sub-microsecond Rust engine and gateway for LLM epistemic uncertainty quantification and hallucination gating:<p>GitHub: https:&#x2F;&#x2F;github.com&#x2F;Adarshent&#x2F;Spnda
Python SDK: pip install spnda<p>Why we built this:
Semantic Entropy (Nature 2024) is great at detecting hallucinations, but the quadratic NLI cross-encoder bottleneck (90ms GPU overhead with DeBERTa) makes it unusable for real-time production serving.<p>We found that exact-match normalized entropy (R_sc) achieves the same discriminative AUROC on structured reasoning (GSM8K) while running in under 1 microsecond on CPU (760 nanoseconds).<p>Benchmarking against Python proxies:
- Kernel latency: 760 ns (Rust) vs 15 ms (Python)
- Memory RSS: ~3 MB vs 230 MB
- Cold start: 3.6 ms vs 1.17 s<p>Happy to answer any questions about the Rust implementation, the zero-GPU exact-match math, or the benchmark results!

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49663329) · **Category:** ask-hn · **Tags:** Ask HN,Problem
