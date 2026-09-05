# PRODUCT.md — PicoLM v1.0-rc1

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ PicoLM is an LLM inference engine written in C99. It currently supports llama-2, GPT-2, Qwen 3.6&#x2F;3.8(+MoE) and Gemma-3n models. Significant amount of work went into CPU SIMD acceleration&#x2F;testing&#x2F;correctness, and wide cross-platform availability with constant testing to never lose portability (from DOS through OS&#x2F;X 10.4 to modernity). CUDA&#x2F;HIP is supported, and accelerated IMMA kernels are available. More work needs to be done on prompt processing speed, but text generation is quite fast already.<p>GGUFs are mmap()&#x27;ed, not preloaded, so it&#x27;s much more friendly to RAM usage than llama.cpp. External LE&#x2F;BE GGUF-&gt;FUGG utility available for the endian-handicapped.<p>OpenAI&#x2F;llama.cpp-compatible HTTP server, ready to use with harnesses.<p>Eye candy: optional live VNC visualization of the per-layer activation heatmap.<p>I do actual feature freeze and release cycles, unlike llama.cpp which did a grand total of zero in the past 3 years. In fact, v1.0-rc1 just got released.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49547323) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
