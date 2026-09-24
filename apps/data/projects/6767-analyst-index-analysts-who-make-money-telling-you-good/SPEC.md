# SPEC.md — Analyst Index – analysts who make money telling you good stock calls

## Problem

Hi HN!<p>What if analyst ratings could be relied on to help you find the next Sandisk, before it takes off?<p>On Analyst Index, analysts publish price targets with a maturity date. Every call gets scored against what the stock actually did, so an analyst builds a record on accuracy instead of on follower count.<p>I started this because after riding the Tesla wave in 2019&#x2F;2020, I messed up epically with some high risk bets that didn’t work out, including one pick from an analyst I didn’t know was not much good. I needed something like this to help me figure out a) which analysts are worth listening to, and b) which stocks to buy based on their ratings.<p>On what already exists: TipRanks has scored analysts since 2009 and Benzinga sells accuracy scores through an API, so this isn’t entirely new. The difference here is that analyst incentives are aligned with that of investors through a subscription. TipRanks and others scrape published sell side calls and sell access to investors without analysts seeing a dollar of investor revenue. So without aligned incentives, the quality of their work is going to be lower.<p>(Yes, I scraped sell side calls to bootstrap Analyst Index with some data - better than launching with a ghost town).<p>On methodology: Right now scoring is naive. I compare the call against the stock&#x27;s movement over the stated horizon and score the difference. I thought it better to ship simpler something sooner rather than later. If scoring design is your area, I&#x27;d like to talk.<p>What&#x27;s live: 44 price targets from 25 analysts across 3 tickers, browsable without an account.
What isn&#x27;t: no analyst signup yet, no payments, and no paywall enforcement — anyone can currently subscribe to anyone and see everything.<p>Business model (planned): analysts set their own subscription price, readers subscribe directly, I take 10%.<p>Open problems I don&#x27;t have answers to:<p>- Cold start on supply. The analysts I want are good and undiscovered, which means they have no audience by definition, so the score has to do the work an audience normally does. If I can&#x27;t drive demand-side traffic, no amount of scoring sophistication saves this.<p>- Whether price targets carry information at all. Plenty of people think they&#x27;re noise. My guess is that aligning incentives will produce a signal, but I can&#x27;t prove that just yet.<p>Regulatory: I operate as a publisher, not an adviser. Content is impersonal and general circulation, with no personalized recommendations and no performance promises. Nothing on the site is investment advice.<p>Link: <a href="https:&#x2F;&#x2F;www.analystidx.com&#x2F;" rel="nofollow">https:&#x2F;&#x2F;www.analystidx.com&#x2F;</a><p>The feedback I want most is who you would like to see on Analyst Index (analysts) and what it would take for you to become a customer (as an investor). I know most people out of the gate are going to have objections to using Analyst Index for their own investing, but it would be helpful to learn what those objections are to evaluate whether they can be overcome.<p>Any other feedback is welcome too!

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49682946)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-13T11:50:35Z

---

## Objective

Build a solution that addresses this problem clearly and at scale.

---

## Target Users

1. **[Primary user]** — the main user this serves
2. **[Secondary user]** — other relevant users

## MVP Scope

- Core functionality
- Leave out anything beyond the MVP

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Keep the MVP simple
- No unnecessary external dependencies
