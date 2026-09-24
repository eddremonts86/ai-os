# SPEC.md — You can't read every ToS, but the clanker can

## Problem

Termsinator is a public registry of LLM-performed analyses of public legal documents like ToSs, Privacy policies, Cookie policies, etc. The goal of this project is to help people better understand how their data will be used, and what potential pitfalls they need to avoid.<p>Why?
You know that feeling of enlightenment and sense of control after you&#x27;ve red dozens of pages of legal mumbo-jumbo before subscribing to a service? Yeah, neither do I (well, maybe some of you do and mad respect for that). I&#x27;ve been encountering more and more reports on how corporations abuse ToSs, Privacy policies and the like to push data collection and retention to really orwellian depths - and thus openly declaring that they deem their (paying!) userbase sheepishly stupid. I don&#x27;t know the solution to this problem, but Termsinator is a stab in this direction.<p>What?
The idea is very simple:<p>- let the clanker read and analyse the legal stuff
- collect the results in a common place so everyone can access it
- help people make better informed choices
- rinse repeat<p>On a high level this is being implemented in the following way:<p>- scrape public facing legal docs
- forward it to an LLM, which will analyse it, and evaluate the content based on several metrics (see the docs)
- store the results along with some metadata
- present these on the website
- and also provide people a browser extension that can pull these results automatically (if they exist of course)<p>I&#x27;d like to honestly declare (not that it&#x27;s not obvious) that this is a PoC and it&#x27;s an LLM generated codebase (Python + Go + Astro written mainly by Sol in&#x2F;with? the Pi agent). At the moment I manually trigger the analyses and since I&#x27;m poor I&#x27;m using a dirt cheap and thus not super bright Qwen model to do the reading. My goal with this Show HN is to gauge if such a project even makes sense. If you find it promising I encourage you to try it, contribute to it or just spread the word. :)<p>PS.: The logo was carefully crafted by my totally human hands and not part of a new &quot;draw me an angry robot-like SVG face&quot; benchmark.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49656324)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-11T11:01:04Z

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
