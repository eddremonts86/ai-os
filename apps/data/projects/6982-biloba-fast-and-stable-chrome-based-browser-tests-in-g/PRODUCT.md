# PRODUCT.md — Biloba: fast and stable Chrome-based browser tests in Go and Vitest

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I wrote Ginkgo and Gomega over a decade ago.  Biloba&#x27;s the browser-testing library I&#x27;ve always wanted.  It&#x27;s 2-3x faster than playwright and allows you to write expressive parallelizable browser tests and automations in Ginkgo and Gomega (for Go) and Vitest (for TypeScript).<p>Pragmatic atomic Javascript operations (b.Click(&quot;#foo&quot;) =&gt; foo.click()) give you speed and stability by trading off realism.  Opting back into realism (scroll then emit pointer click event) where you need it is as easy as b.Realistic().Click(&quot;#foo&quot;).<p>And it&#x27;s designed from the ground-up to be agent-friendly.  Failure messages include DOM outlines, paths to saved screenshots, and polling traces so agents can pinpoint failures quickly.  Visual regression tests produce diff images and textual descriptions that point agents at what changed. A set of Claude Code skills describes best practices for finding and eliminating flakes, and keeping them gone.<p>Performance numbers: <a href="https:&#x2F;&#x2F;github.com&#x2F;onsi&#x2F;biloba?tab=readme-ov-file#performance" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;onsi&#x2F;biloba?tab=readme-ov-file#performanc...</a>
Docs: <a href="https:&#x2F;&#x2F;github.com&#x2F;onsi&#x2F;biloba?tab=readme-ov-file#performance" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;onsi&#x2F;biloba?tab=readme-ov-file#performanc...</a>

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49699819) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
