# PRODUCT.md — Flawd is mutation testing for the AI era

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hey, all! Flawd is a mutation testing tool that can target five languages (Python, JS, TS, Go, Rust) and it runs locally as a single binary on your machine. Importantly (for many), your code never leaves your machine and all processing takes place directly on your dev box or CI runner.<p>Mutation testing is a process in which faults (known as mutants) are intentionally injected into your codebase, tests are run and any faults which are not detected by your tests are known as survivors (or surviving mutants). Survivors can often indicate that your test assertions are not focused on expected behavior or might be missing altogether. Whereas code coverage can tell you which code was exercised during a test run, mutation testing can provide some insight regarding the strength of the assertions and whether or not certain classes of bugs would be caught.<p>With increasingly more code and tests being authored by coding agents, it seemed like a good time to build a tool like this. Mutation testing is not new, but many of the tools are either single-language specific or haven’t been designed with an agentic workflow in mind, so those are itches we wanted to scratch. Models continue to become more powerful and effective, but at some point there is still a “who watches the watchmen” scenario and we hope Flawd can provide one check towards that balance.<p>We recently ran Flawd against 10 established open source projects and you can find the full writeup here: <a href="https:&#x2F;&#x2F;fixture.dev&#x2F;writing&#x2F;we-mutation-tested-10-projects" rel="nofollow">https:&#x2F;&#x2F;fixture.dev&#x2F;writing&#x2F;we-mutation-tested-10-projects</a><p>Also, you can see what a sample report looks like here: <a href="https:&#x2F;&#x2F;fixture.dev&#x2F;flawd&#x2F;sample-report" rel="nofollow">https:&#x2F;&#x2F;fixture.dev&#x2F;flawd&#x2F;sample-report</a> . Flawd can also generate machine readable reports that can be handed off to coding agents for test strengthening tasks.<p>Feel free to ask my anything about Flawd and thanks for having a look!

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49536607) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
