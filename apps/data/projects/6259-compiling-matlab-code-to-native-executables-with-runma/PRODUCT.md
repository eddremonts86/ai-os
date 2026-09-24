# PRODUCT.md — Compiling Matlab Code to Native Executables with RunMat

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I&#x27;m on the RunMat team. Prior releases of RunMat focused on accelerating large math w&#x2F; auto offload to GPUs via transpiling to WGPU shaders, and correct interpretation of the MATLAB language semantics (we&#x27;re 99%+ on grammar &#x2F; semantics now).<p>We left a placeholder for a Cranelift based JIT, and when we went back to fill it in, we though -- why not take it a bit further.<p>Since we were putting in the logic for branches of the CFG to be compiled to native code, we figured why not fundamentally build it such that you could run &quot;runmat compile simulation.m -o simulation&quot; and get a standalone binary target.<p>I.e. compile a MATLAB input project into to a standalone native binary target. We&#x27;ve detailed more in the blog.<p>There&#x27;s a bit of work we&#x27;re finishing still, but a build with the core native compile pieces is now out (we still have to propagate some metadata through the runtime library such that the compiler can effectively tree shake, and some portions of the system still need Cranelift translation logic, but the remaining work is relatively mechanical [and already in progress]).<p>The RunMat compiler and runtime are open source: <a href="https:&#x2F;&#x2F;github.com&#x2F;runmat-org&#x2F;runmat" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;runmat-org&#x2F;runmat</a>

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49644323) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
