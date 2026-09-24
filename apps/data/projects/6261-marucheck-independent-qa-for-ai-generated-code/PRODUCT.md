# PRODUCT.md — MaruCheck – Independent QA for AI-generated code

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hi HN,<p>I&#x27;ve been building MaruCheck, an independent, open-source QA verification tool aimed to solve the issues that arise when coding agents like codex, claude, cursor make semantic issues that has heavy ramifications.<p>Take the example where the requirements says a free user gets 5 uploads. The code changes this behavior to 10. Test generated from the implementation may simply start expecting 10. But Marucheck treats the existing approved requirements as a separate evidence and flags the behavior change.<p>Some of the things implemented currently are Quality contracts, repository and stack scanning, Git diff&#x2F;change- impact analysis, risk based analysis, semantic drift detection, QA memory for previous bugs&#x2F;regression, CLI workflows, integration for coding agents, Github&#x2F;CI verification etc etc..<p>Another area I’m experimenting with is QA Memory.<p>If six months ago a bug existed because users could access another customer’s invoice by changing an invoice ID, MaruCheck can associate that regression with the relevant files&#x2F;contracts. If those areas change again later, that previous failure becomes part of the new verification plan.<p>The project is local-first and I’m trying not to reinvent existing testing infrastructure unnecessarily. The idea is to orchestrate tools like Playwright&#x2F;Vitest&#x2F;security&#x2F;Jest tooling rather than build another browser automation framework from scratch.<p>Currently it&#x27;s on NPM and you can runit using npx or npm by writiing npx --yes marucheck@0.3.0 init and all the information and docs are available on   the site marucheck.dev.<p>I have decided to build it in the open and I&#x27;m especially interested in feedback on all aspects. Contributors are very welcome as well - issues, adapters, testing, docs, bug reports, architecture criticisms, all of it.<p>Thanks

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49644238) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
