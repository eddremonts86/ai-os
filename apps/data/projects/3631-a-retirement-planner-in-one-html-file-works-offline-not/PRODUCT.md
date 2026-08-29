---
id: "3631"
slug: a-retirement-planner-in-one-html-file-works-offline-not
title: "A retirement planner in one HTML file, works offline, nothing uploaded"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49481776"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Single HTML file, Vanilla JavaScript, CSS (no framework), LocalStorage (optional, same file)]
---
# A retirement planner in one HTML file, works offline, nothing uploaded

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A retirement planner that models the portfolio you actually have — a small number of specific holdings, each with its own growth rate, account type and cost basis — and shows the after-tax unwind of one or more concentrated positions across a sell schedule you control. The page exists because mainstream planners model accounts rather than holdings, which the source page describes as "fine for an index investor and useless when your plan rests on three specific companies you have an actual opinion about."

The product is delivered as one HTML file. There is no account, no sign-up, and no upload; the file runs offline after being loaded once, and the website describes a $99 one-time fee for the file rather than a subscription. The advanced planning features — Monte Carlo and a crash test — sit on top of the same engine rather than replacing it, so the basic holding-by-holding unwind is free and the full planner is one file the user owns.

**One-liner:** Torsalis is a single-file retirement planner that models a concentrated portfolio holding by holding and shows the after-tax cost of unwinding it on a sell schedule you set, with nothing uploaded and no network needed.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Concentrated-position holders | Mainstream planners model accounts; this one models the holdings inside the accounts. |
| ChubbyFIRE / fatFIRE planners | The page is built for the recurring "4% rule does not apply here" conversation. |
| Privacy-first DIY investors | The "nothing uploaded" constraint is the product, not a side benefit. |
| Tax-aware planners | Basis, account type and proportional basis recovery are first-class. |
| Offline workers | The file works on a plane, on a train, or anywhere with no network. |
| Owners of the file | The $99 one-time payment makes the file itself the deliverable. |

## Jobs To Be Done

1. **Functional job** — See the after-tax cost of unwinding a concentrated position on a sell schedule the user picks.
2. **Functional job** — Model a portfolio holding by holding, with each holding carrying its own growth rate and basis.
3. **Functional job** — Test what happens to the plan under a Monte Carlo run and a crash test, without leaving the file.
4. **Functional job** — Save a working scenario and return to it later without creating an account.
5. **Emotional job** — Replace the "I don't actually know what I keep" feeling that the source page names with a number the user can point at.
6. **Emotional job** — Plan a retirement around specific holdings without uploading those holdings anywhere.
7. **Social job** — Hand a planning file to a partner, a financial advisor or a tax preparer, where the file is the artefact and not a login.

## Success Metrics

- **Plan-to-close time** — minutes from opening the file to a working scenario that the user trusts.
- **Network requests on a reload** — must be zero after the initial load, measured against an empty browser cache.
- **Working file size** — small enough that the $99 one-time purchase of the file is a reasonable transaction for a single file.
- **Crash-test and Monte Carlo run time** — short enough that a user runs them interactively rather than queueing them overnight.
- **Basis-recovery correctness** — proportion of partial-sale scenarios where realised basis matches the proportional rule the source describes.
- **Account-type correctness** — proportion of scenarios where the after-tax number respects the brokerage / pre-tax / Roth tag.
- **Owned-file conversion** — share of users who pay the stated one-time price after using the free in-browser version.

## Pricing & Monetization

The source page states the pricing directly: the in-browser planner is free, the file is sold for $99 once to own it. The cost shape is therefore a one-time purchase of a single file, not a subscription, not a per-account fee, and not a hosted offering. The plan respects that shape: the free path is the page itself, the paid path is the file. Any extension has to preserve the "no upload, no network, no account" promise because the price is for the file, not for the service.

## Competitive Landscape

- **Mainstream retirement calculators (FIRECalc, cFIREsim, Personal Capital)** — described by the source as modeling accounts rather than holdings; the differentiator is that the source models the specific tickers the user has an opinion about.
- **Index-investor planners** — the category the source explicitly says it is not for; the page is built for the case where an index-investor model is the wrong model.
- **Tax-specific calculators** — tools that focus on the tax side without the holding-by-holding schedule; the source combines both.
- **Spreadsheets built by the user** — what the audience is currently doing; the source is a packaged version of that workflow with the per-holding growth and unwind logic built in.

The source page names no direct competitor, and the plan names no further comparison.

## Risks & Open Questions

- [ ] Decide how Monte Carlo and the crash test are presented inside the single file without external randomness sources, since crypto-grade RNG has to come from inside the page.
- [ ] Confirm the tax model is honest about the rate the user enters: the source's 33.1% is illustrative, and the planner must not pretend a single rate covers all jurisdictions.
- [ ] Establish the basis-recovery rule for positions sold across multiple accounts, since the proportional rule described in the source has edge cases at small remaining balances.
- [ ] Decide the file's update story: a $99 owned file has to be re-sold or re-licensed for updates, which is a pricing question the source raises but does not answer.
- [ ] Confirm no network requests slip in via web fonts, CDN-served icons or auto-updating scripts, because the offline promise depends on every request being absent.
- [ ] Establish the browser support floor — a single HTML file with vanilla JavaScript has to run in the browsers the audience actually uses, including older versions on locked-down laptops.
- [ ] Decide whether local persistence is localStorage or an exported JSON, because either choice has trade-offs the user will need to understand.
