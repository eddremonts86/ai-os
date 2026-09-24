# PRODUCT.md — Nari Qwen3-TTS and Qwen3-ASR – High accuracy, low latency and cost

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hey HN, Toby from Nari Labs here.<p>We&#x27;ve been working on making OSS speech models super-fast. Last year, we built Dia, the first OSS text-to-speech model capable of doing natural dialogue. Since then, so many more great speech models have been released to the public.<p>But the market is still dominated by closed source models. We think that&#x27;s an inference problem. Existing systems such as vLLM &#x2F; SGLang are not well suited for multimodal inference. To prove this, we built an inference engine specialized for Qwen3-TTS and open-sourced it (<a href="https:&#x2F;&#x2F;github.com&#x2F;nari-labs&#x2F;nari-qwen3-tts" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;nari-labs&#x2F;nari-qwen3-tts</a>). Running at sub-50 ms latency at 10 RPS, this showed open models can be run much faster and cheaper.<p>Since then, we&#x27;ve been working hard to bring cheap, fast, and high quality serving to all. And we&#x27;ve even beat closed models at their game!<p>Measured on the highly cited Coval (YC S24) voice AI benchmarks, our Qwen3-TTS endpoint not just is #2 in latency, but #1 in accuracy (WER) compared to 11Labs, Cartesia etc. while being the cheapest endpoint. Our Qwen3-ASR endpoint has the lowest latency and #2 accuracy, just 0.1% away from #1. It is the second cheapest model on the list.<p>It took a lot of clever inference engineering to make these models quick, perform well while keeping costs low. Interestingly, Alibaba&#x27;s official endpoints seem to perform worse in terms of accuracy and latency compared to ours. But nonetheless, much love to the Qwen team for OSS-ing these amazing speech models.<p>We want to continue to push prices down to make speech technology a commodity - so that every app can have great TTS and STT without worrying about unit costs. We&#x27;re also working on other parts of audio such as diarization - as well as video and world model inference. More to come!

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49699267) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
