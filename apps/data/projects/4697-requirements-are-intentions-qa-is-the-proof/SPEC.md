# SPEC.md — Requirements are intentions QA is the proof

## Problem

Requirements are intentions, QA is the proof.<p>I see massive gaps in QA out there. How did this come to be? I am not sure. I have been heads down on my own startups and didn&#x27;t realize how QA was changing - at least in certain communities.<p>It has been long known that handing QA to the same person who wrote the code is usually going to be ineffective.  Psychologically, it is non-trivial. You almost need a healthy competitive setup ( not to psychotic levels ) to get the best out of those who write the code and those who QA the product. You do this yourself, only if you have no other options: 
I run through my regression testing for my self-written game AccurateMisplaced  manually ( 60K LoC - non AI ) in a day for 3 device types and it goes way beyond happy path testing and domain knowledge testing. I am bootstrapped so I do it myself, and have zero bugs in production so far, and I have a strong foundational background in QA from my first job ages ago ( IBM uKernel) so perhaps I am better able to compartmentalize my brain but it is not ideal to test your own code.<p>I find average test coverage to be abysmal. Is this why we see so many broken products launched? When did it become okay to just fix it in production, when a little extra effort can secure better quality pre launch?<p>I am speaking of utter lack of security testing, integration testing, core logic testing, stress testing, memory and performance checks, resilience checks ( users may do unexpected things is your product going to fold or remain standing?) , scalability testing, etc.<p>For Mobile Apps, layout testing itself is a peak activity given the modern sprawl of window resizing, split windows, multiple scenes on the same device and device idiom spread ( various devices your app may run on ) .<p>If nobody is testing for the negative tests, then your code is vulnerable.<p>These are not Product domain judgments these are technical judgments. Somebody has to test for it else you run the risk of finding out in production.<p>And you have your business&#x2F;domain knowledge based tests, and UX testing which is really all about user empathy.<p>QA is a non-trivial activity especially given the complexity of our architectures and our products&#x27; scope.<p>To me, your test suite remains a promise&#x2F;contract of the quality you intend to provide. A well thought out test suite keeps code-writing AI accountable.<p>In the Agentic AI era, QA may be the only difference between mindful releases &amp; chaos.<p>Ms Gitanjali GulveSehgal AKA Gigi Sehgal Founder Gigi Sehgal LLC South Los Altos California

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49548737)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-03T11:43:14Z

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
