# PRODUCT.md — I made a tiny MoE/Engram viz tool

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ As part of a ML study group I&#x27;ve been building tools to experiment with ML concepts.  I use AI Coding agents to develop software, mostly cloud-based but I keep trying local LLMs on 12G, 16G, and 24G VRAM GPUs.  Freetoken has made it possible to run larger MoE models on smaller GPUs.<p>This inspired me to use my ML tools to build a tiny MoE model from scratch so I can experiment with different agent optimizations and things like Engram, recursive models, hierarchical modeles, KV Cache compression etc.<p>My link above shows results of building different tiny models, one dense, the rest MoE variants.  There is a lot of code and tooling behind this.<p>Goals: 
- build tiny MoE models that run in a browser to give interactive help (today I use deterministic matchers to respond to user queries; still researching how to improve this with better trained MoE models).
- build tiny MoE models that run on small ARM and RISC-V development boards, possibly using NPUs (using no_std Rust).<p>My tools are an alternative to Python, ML libraries, Jupyter notebooks, and Google Colab.<p>My approach is a REPL and&#x2F;or AOT Compilable array-programming DSL written in Rust.  This language has ML concepts as first class language elements and built in visualization primitives.<p>It runs in a browser via WASM.  It runs at the CLI on both Apple and Linux (supporting Apple GPU and NVIDIA GPU libraries, Ollama-based REPL context-senstive help).  It is extensible via dyamic plug-in Rust libraries.<p>I have created many demo repos showing how to use this ML array language for ML tasks, learning Math concepts, general purpose programming.  You can build desktop apps, (Ruby on Rails inspired) CRUD apps.  So you can create ML experiments and visualize data in the browser or on the desktop.<p>It also supports Emacs org-mode for literate programming.<p>This tiny MOE Microscope is just my latest demo of this approach.  I hope it helps someone learn more about MoE experts, routing, Engram, etc.  It helped me learn more.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49690947) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
