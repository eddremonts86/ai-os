---
id: "2989"
slug: openleetcode-local-leetcode-runner-where-tests-live-in-
title: Openleetcode – local LeetCode runner where tests live in the repo
status: enriched
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49337367"
category: show-hn
date: "2026-08-17"
tags: [Show HN, Product, Problem]
---
# Openleetcode – local LeetCode runner where tests live in the repo

## Value Proposition

A local-first LeetCode runner where your solutions and tests live in your own git repo. The CLI identifies the problem by ID or title, executes the solution against the bundled tests, and shows pass/fail per case. The runner stays out of the way of whatever stack you're practising.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Self-taught developers prepping for interviews | Want a versioned history of practice solutions, not a hosted dashboard that erases progress. |
| Engineers practising in non-mainstream languages | LeetCode's hosted runners often don't support their language; local execution works around that. |
| Bootcamps and study groups | Want shared test fixtures and a CLI that integrates with their existing git workflow. |

## Jobs To Be Done

1. **Functional job** — run a LeetCode-style solution against test cases from the terminal, with no hosted account.
2. **Emotional job** — keep practice work in your own repo, so progress is preserved and reviewable.
3. **Social job** — share solutions with peers via pull requests, not links to a hosted judge.

## Success Metrics

- **Activation:** time from `git clone` + CLI install to running the first problem end-to-end.
- **Coverage:** number of supported problems (currently ~1.4k per the source) and languages.
- **Retention:** monthly active learners solving problems via the CLI.

## Pricing & Monetization

The source post does not name a price. Treat as open source; reasonable future monetization includes a hosted problem browser, paid problem packs (system design, SQL), or team plans for bootcamps. Pricing is left as an open question.

## Competitive Landscape

- **LeetCode.com** — the canonical hosted judge; charges for premium problem packs; progress is account-locked.
- **NeetCode / Grind75 / other curated lists** — opinions on what to practise, not a runner.
- **Other local runners (rust-leetcode, etc.)** — language-specific; none cover the breadth this project aims for.
- **Exercism** — language tracks with mentoring; broader than LeetCode but a different pedagogical shape.

## Risks & Open Questions

- [ ] Problem-set provenance: the project bundles ~1.4k problems; ensuring they remain usable under fair use / their original licence is a legal question, not just a technical one.
- [ ] System-design / SQL / concurrency support: explicitly deferred per the source; whether to add them changes the project's shape.
- [ ] Haskell-as-tooling: keeps the dependency surface small but raises the bar for outside contributors.
- [ ] No stated monetization: if it's open source forever, sustainability comes from sponsorships, donations, or a future hosted tier.
