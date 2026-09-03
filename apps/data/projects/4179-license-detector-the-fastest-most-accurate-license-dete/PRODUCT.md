# PRODUCT.md — License Detector – the fastest, most accurate license detection tool

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Years ago when I worked for Shogun, I was handed a compliance task: gather up all the LICENSE files from our codebase, so we could make sure all our products were legally compliant. It was not as easy as it sounded -- I had to use multiple different command line tools, merge all the results from the disparate tools together, and then manually verify that the data was correct. I made a mental note at the time that I should build something that made this easier one day.<p>Years later, I&#x27;m making good on that promise: introducing License Detector (<a href="https:&#x2F;&#x2F;licensedetector.com" rel="nofollow">https:&#x2F;&#x2F;licensedetector.com</a>) -- a license detection tool that works across 21 ecosystems, basically every major language, and it&#x27;s free in the web app for any open&#x2F;public repo!<p>I&#x27;m also releasing the CLI for free as well (<a href="https:&#x2F;&#x2F;github.com&#x2F;licensedetector&#x2F;cli" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;licensedetector&#x2F;cli</a>), so you can run it on your own repo before installing anything. The tool is ~80x faster than licensee, and matches or beats askalono and scancode-toolkit on accuracy in head-to-head benchmarks (I&#x27;ve included the benchmarks as well in the repo if you wish to run them yourself).<p>Hope people try it out and enjoy it, and would be glad to answer any questions!<p>CLI: go install go.licensedetector.com&#x2F;cmd&#x2F;license-detector@latest<p>GitHub App: <a href="https:&#x2F;&#x2F;github.com&#x2F;apps&#x2F;license-detector" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;apps&#x2F;license-detector</a><p>Benchmarks &amp; how it works: <a href="https:&#x2F;&#x2F;licensedetector.com&#x2F;compare#how-we-stack-up" rel="nofollow">https:&#x2F;&#x2F;licensedetector.com&#x2F;compare#how-we-stack-up</a>

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49510297) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
