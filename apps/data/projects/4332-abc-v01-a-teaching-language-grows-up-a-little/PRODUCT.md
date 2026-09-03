# PRODUCT.md — ABC v0.1 – A teaching language grows up a little

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I just tagged the first release of ABC, a small C-like language I originally developed for my Introduction to High Performance Computing course.<p>With v0.1, ABC is starting to grow a little beyond its original teaching purpose. It now has multiple backends, including LLVM, and initial x86-64 System V ABI support. As a first practical application, ABC can use raylib to build small graphical programs.<p>The original idea behind ABC was to give students something simpler than C&#x2F;C++ while keeping the parts that matter for understanding how programs actually map to a machine.<p>During the course, students develop a simple RISC-like architecture and write their own compiler for it in ABC. This way they get to see the complete chain at least once:
hardware → instruction set → assembly → compiler → programming language<p>That compiler eventually became self-hosting and is now called not-abc:
<a href="https:&#x2F;&#x2F;github.com&#x2F;michael-lehn&#x2F;not-abc" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;michael-lehn&#x2F;not-abc</a><p>ABC itself has gradually grown beyond what was strictly necessary for the course. The LLVM backend makes it possible to generate native code, and the new ABI layer is a first step toward using existing C libraries and writing small real applications rather than just teaching examples.<p>Currently, a subset of the x86-64 System V ABI is implemented. The ABI layer is designed so that other targets can be added; ARM is the obvious next one.
ABC v0.1 supports and has been tested with LLVM 17 through 22.<p>Project:
<a href="https:&#x2F;&#x2F;github.com&#x2F;michael-lehn&#x2F;abc-llvm" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;michael-lehn&#x2F;abc-llvm</a><p>Feedback on the language, the teaching approach, the ABI implementation — or ideas for small applications that would be fun to build with ABC — is very welcome. :-)

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49521713) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
