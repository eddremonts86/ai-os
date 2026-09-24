# PRODUCT.md — Why Six Millennium Problems May Be Hard for the Same Reason

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ A paper claiming to solve one Clay Millennium Problem would be extraordinary. A paper claiming to solve all six with one quantum-computing pipeline sounds almost designed to trigger disbelief.<p>That is what Denise Holt and Denis Ovseyenko of AIX Global report in “Demonstrating Quantum Value by Solving the Six Remaining Clay Millennium Problems.” They say IBM Heron computations produced certificates carried into Lean 4, yielding 27 theorems from 10 hours 24 minutes of QPU time.<p>I have not verified those claims, and the Clay Mathematics Institute still treats the six problems as unsolved. I am not asking you to accept the proofs. I am asking why the same architecture appears to have surfaced twice.<p>More than two months before the AIX preprint, my Six Birds Theory paper “One Meta-Theory, Three Clay-Problem Closures” reached a related structural conclusion from the opposite direction. It compared Navier–Stokes, the Riemann Hypothesis, and P versus NP and argued that they share a grammar: representation, residual obstruction, missing content, bridge, and audit.<p>One program started with a theory of emergence and moved toward hard problems. The other says it started with the problems separately and found one computational pipeline.<p>They do not offer the same proof. They appear to have found the same kind of bottleneck.<p>In software terms, think of a mathematical layer as an API. It exposes certain objects and operations. You can optimize forever inside that interface, but you cannot recover a distinction it never exposes. If two states produce the same log but need different responses, more log processing will not fix the observability problem. You need a new sensor, richer representation, or theorem showing the distinction does not matter.<p>Six Birds Theory formalizes this through saturation and residuals. Repeating a fixed completion rule is not the same as gaining new access. A residual measures the part of the target not accounted for by the layer’s native probes. A useful extension constrains that residual, then returns only what the original question needs.<p>That resembles the architecture AIX claims to implement:<p>native problem -&gt; problem-specific operator -&gt; governed quantum computation -&gt; compact certificate -&gt; classical proof checker<p>The quantum state need not be reconstructed classically. The receiving layer needs a sufficient certificate and a valid bridge to the theorem.<p>There is one exact point of contact. In the Hodge section, AIX constructs a defect object measuring what remains after algebraic cycles account for the Hodge-class space. My earlier paper “Adequacy Residuals and Blind-Spot Currency” generalizes the same job: remove what the available probes explain and measure the remainder. Under the Hodge choices, the constructions have the same operator form.<p>That does not mean AIX used my work; I have no evidence of that. The mathematics is classical. It means two programs, with different vocabularies, built a tool for the same structural job.<p>“One mechanism” should not mean “one equation.” Riemann and Yang–Mills concern confinement. Hodge and BSD compare presentations. Navier–Stokes asks for global control. P versus NP asks whether an obstruction persists against every efficient procedure. Same grammar, different polarity.<p>The developer lesson is broader. AI systems, theorem provers, and scientific workflows increasingly perform opaque searches. The right design target may be the smallest independently checkable artifact that preserves why the answer is true.<p>I wrote the full comparison, chronology, and caveats in Two Roads to the Same Bottleneck.<p>Disclosure: I developed Six Birds Theory and lead Automorph. This is a structural comparison, not validation of AIX’s claims.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49724391) · **Category:** ask-hn · **Tags:** Ask HN,Problem
