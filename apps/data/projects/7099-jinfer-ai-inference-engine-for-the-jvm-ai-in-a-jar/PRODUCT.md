# PRODUCT.md — Jinfer – AI inference engine for the JVM. AI in a jar

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hi HN,
Some would call AI on the JVM quixotic. And so, Quixotic AI was born.<p>jinfer is an inference engine for the JVM: chat, vision, audio, embeddings, reranking, and TTS. No Python runtime, no ONNX, no Docker containers, no sidecar process, no IPC. Finally, AI in a jar.<p>The stack underneath is built for the JVM rather than bolted onto it:<p><pre><code>    toknroll: pure-Java tokenizers, zero dependencies
    gguf &#x2F; safetensors: read and write llama.cpp and HuggingFace model formats
    jam: quantized matmul kernels, competitive with llama.cpp on CPU
    jota: Tensor API targeting Java, C, CUDA, HIP, Metal, OpenCL, and Mojo
</code></pre>
It ships with integrations for Spring AI and LangChain4j, and is compatible with GraalVM Native Image for low-overhead, self-contained binaries with millisecond startup.<p>This is an early release (CPU only): I&#x27;d especially like feedback on the API surface.<p>Site: <a href="https:&#x2F;&#x2F;qxotic.ai" rel="nofollow">https:&#x2F;&#x2F;qxotic.ai</a>
Repo: <a href="https:&#x2F;&#x2F;github.com&#x2F;qxoticai&#x2F;qxotic" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;qxoticai&#x2F;qxotic</a>

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49708628) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
