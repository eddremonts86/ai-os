# SPEC.md — 1Baton – a no-code tool for chaining API calls

## Problem

Hi HN!<p>I&#x27;ve been building a no-code tool for authoring and running API integration tests called 1Baton.<p>I work with APIs on a daily basis, building and testing them. In the services I work on, a single API endpoint often represents only a small action in a larger process, so testing a complete flow usually means calling several endpoints in sequence.<p>When I started testing these flows, I found myself spending too much time setting up and reusing the same multi-step processes across different tests. I wanted to define a flow once, reuse it as a building block, and avoid having to manually maintain the connections and data passed between requests.<p>This is what led me to build 1Baton.<p>The basic idea is to define HTTP requests once, compose them into reusable sequences, and then use those sequences to create runnable scenarios, without writing glue code to pass data between requests.<p>A request or sequence is also flagged as invalid as soon as a required parameter is missing or becomes stale, directly in the editor, before you run the scenario.<p>There are three building blocks:
- Requests - HTTP requests with defined inputs and outputs.
- Sequences - reusable groups of requests, where outputs from one request can be passed to later requests without writing glue code.
- Scenarios - runnable test cases composed from requests and sequences, with a run monitor showing the result of each step.<p>The runner is an npm package, while the authoring experience is browser-based. You can currently use it to test public APIs without setting up anything locally.<p>It&#x27;s still an MVP and there are definitely things missing. I&#x27;m mainly interested in finding out whether this workflow is actually useful to other developers and QA engineers, and how you currently solve this kind of problem.<p>I&#x27;d be very interested in hearing what you think, including reasons why you wouldn&#x27;t use it.<p>Try it here: <a href="https:&#x2F;&#x2F;app.1baton.com&#x2F;" rel="nofollow">https:&#x2F;&#x2F;app.1baton.com&#x2F;</a>
The landing page is here: <a href="https:&#x2F;&#x2F;1baton.com&#x2F;" rel="nofollow">https:&#x2F;&#x2F;1baton.com&#x2F;</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49686047)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-13T16:58:55Z

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
