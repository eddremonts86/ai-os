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

## Problem

The capture for this plan is a URL — www.torsalis.com — and a title that states three constraints as the whole product: "A retirement planner in one HTML file, works offline, nothing uploaded." The website's own copy confirms and elaborates: the page is a retirement-planning tool aimed at people whose plan rests on a small number of specific holdings rather than a single diversified pot, and who therefore cannot use a planner that models an account instead of the holdings inside it.

The framing on the site names the failure of the mainstream tools directly. Mainstream planners are described as modelling "brokerage, $800,000, growing 7%" without naming a ticker, which the page says is "fine for an index investor and useless when your plan rests on three specific companies you have an actual opinion about." The cited Reddit pattern is the recurring r/ChubbyFIRE and r/fatFIRE conversation: a household whose net worth is concentrated in one or two positions is told that the standard 4% rule does not apply, and is then told to diversify, but is given no tool to model the actual cost of unwinding that concentrated position over a sell schedule they control. The tool exists to fill that gap.

The third constraint from the title — "nothing uploaded" — is also stated on the site: there is no account, no sign-up, and nothing is sent to the server. The site's pricing line is "free in your browser" for the running model and a stated $99 one-time payment to "own the file", which makes the file ownership the product and the network path optional. The page describes a four-holding working example with a 60%-over-five-years sell schedule from 2026–2031, a 33.1% capital-gains example on a $2M holding with a $250K cost basis, and a final position the user can edit to see what an unwind actually costs.

The technical constraints in the title are the whole spec. One file means there is no build step, no module loader, no separate stylesheet and no remote font by default. Offline means the file works after being saved locally with no network round-trip. Nothing uploaded means the planner runs entirely in the browser, with no telemetry and no sync to a backend the user does not control. Those three constraints are stated in the source and are the foundation of every design choice below.

## Objective

Ship a single-file retirement planner that models a concentrated portfolio holding by holding, applies a user-set growth rate per holding, runs the unwind of one or more positions across a user-defined sell schedule, and shows the after-tax result side by side with the gross figure so the user can see the cost of converting a concentrated position into retirement income. The file must work offline after being saved locally, must not upload any value entered by the user to any server, and must be small enough to be sold or shared as one file the user owns. The advanced planning features described on the source page — Monte Carlo and a crash test — are part of the planned surface, scoped as features the planner adds to the holding-by-holding engine rather than as replacements for it.

## Target Users

- Holders of one or two concentrated positions whose plan cannot be modelled by a diversified-portfolio calculator and who want to know the actual after-tax cost of unwinding.
- People planning retirement around specific tickers rather than around an asset-allocation pie, who need each holding to carry its own growth rate.
- DIY investors who refuse to enter their holdings into a third-party web service and who would otherwise abandon planning rather than upload the data.
- Readers of r/ChubbyFIRE and r/fatFIRE conversations who have already seen the "4% rule does not apply here" answer and are looking for the next tool.
- People who want to own the planning tool itself, where the source page describes a $99 one-time purchase of the file.
- Tax-aware planners who care about cost basis, account type (brokerage, pre-tax, Roth) and the way basis recovers proportionally as a position is sold.
- Anyone who wants a planning tool that works on a plane, on a train, or anywhere with no network — the offline constraint from the title.

## MVP Scope

- A single HTML file containing the markup, CSS, JavaScript and any small assets required for the page to render without any external request.
- A holdings table where each row carries ticker or label, account type, price, share count, cost basis and the holding's share of the plan.
- A per-holding growth model with a high-growth stage and a more conservative one afterwards, plus a price-target mode that derives the implied rate.
- An unwind engine that takes a sell schedule (for example, 60% over 5 years from 2026 to 2031) and applies it holding by holding, with basis recovery as the position sells.
- A tax pass that computes capital gains on the realised portion, with the example rate of 33.1% from the source treated as illustrative, not as the rate any user is forced to.
- An after-tax result panel showing gross proceeds, what the user keeps, and the cost of getting out, exactly as the source page describes.
- An interactive sample portfolio with editable cells so the user can see the effect of any change without leaving the page.
- Local-only persistence of the entered values, so a refresh does not destroy the user's working scenario.
- No network request of any kind once the file has loaded, including no fonts, no analytics, no remote scripts, no remote styles.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The planner must live in one HTML file. No build step, no module bundler, no separate assets served from a different origin.
- The file must work offline. After the page has loaded once, every interaction must succeed with the network disabled, including a page reload.
- No value the user enters may leave the browser. There is no telemetry, no analytics, no sync, and no call home of any kind.
- The mainstream 4%-rule framing is explicitly rejected by the source as the wrong model for a concentrated portfolio; the planner is not built to model a diversified index drawdown.
- The advance features — Monte Carlo and the crash test — are stated in the source as part of the "full planner" alongside the basic engine, and must run inside the same single-file constraint.
- The basis-recovery behaviour is part of the source: when a position is partially sold, basis must be recovered proportionally, and the planner must not silently use a different rule.
- The $99 one-time purchase described on the source is a payment for the file, not a subscription; the planner must remain usable without any payment, with the file being the deliverable.
- Account-type tagging matters: a holding in a brokerage account is taxed on sale, while a Roth or pre-tax holding is not, and the tax pass must honour the tag rather than averaging across accounts.
