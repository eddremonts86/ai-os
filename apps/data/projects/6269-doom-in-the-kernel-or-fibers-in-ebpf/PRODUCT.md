# PRODUCT.md — DOOM in the kernel, or fibers in eBPF

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Some time ago my coworker who was working on first version of Perforator (<a href="https:&#x2F;&#x2F;github.com&#x2F;yandex&#x2F;perforator" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;yandex&#x2F;perforator</a>) kept talking about eBPF, so I got curious about its ISA and restrictions. That was around the time I read about DOOM on pregnancy test, so I thought: &quot;what if someone run DOOM inside of Linux kernel in eBPF? Surely, with some restrictions, this should still be possible?&quot;<p>I started to play around with it somewhere in 2024 - first stripping DOOM to bare minimum that is needed for showcase, simplifying code and trying to pass first restrictions that I encountered - function limit, recursion, memory access and checks. I tried to do this by hand, but it was, well, tedious labor. So I changed direction and instead started to do some of the things with LLVM-passes - rewriting memory access, simplifying and rewriting loops etc. But there were just so many corners. And given absence of time and all, I forgot about this project.<p>But couple months ago I thought: &quot;LLMs are quite good nowadays, so why not try again this time with more hands&quot;. I tried different approaches on how memory access could be &quot;virtualized&quot;, how loops can be made bounded, and in general - how to run unbounded logic on such a machine.<p>When I got DOOM running, I got carried away. Approach was so &quot;generic&quot;, so it would be a crime not to try to run more things. And now we have it - lua running on xdp hot path, llama2 working with softfloats, and even cpython, that did not fit initially into 1M verifier budget, is running there now thanks to freplace.<p>There is ton of work to do in order to make programs run faster, to make integration easier, but working examples are already there.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49630125) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
