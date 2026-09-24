# SPEC.md — How does call center headset noise canceling filter out keyboard sounds?

## Problem

According to statistics from the market research firm QYResearch, global sales revenue for call center headsets reached $1.546 billion (approximately 11.1 billion RMB) in 2024. This figure is projected to grow to $2.18 billion by 2031, representing a Compound Annual Growth Rate (CAGR) of 5.1%. If we expand the scope to the broader category of &quot;Office + Call Center&quot; headsets, the global market size reached $6.72 billion in 2024. It is expected to grow by nearly $2.7 billion by 2029, boasting a CAGR of 13.8%-a growth rate that highlights a clear trend: professional‑grade headsets are becoming standard equipment for an increasing number of enterprises.<p>Another statistic offers an even more intuitive perspective: in 2025, global sales volume for commercial headsets is projected to reach approximately 98 million units, with an average unit price of around $34. Every year, nearly 100 million headsets flow into the enterprise, call center, and remote work markets.<p>Now, let&#x27;s turn to the Chinese market. As of 2024, the number of call center agent seats in China reached 4.4 million‑an 8.6% increase year‑on‑year. In that same year, the market size of China&#x27;s call center industry reached 55.3 billion RMB (approximately $7.8 billion). As the world&#x27;s second‑largest market, China accounts for roughly 13% of the global market share.<p>A simple calculation puts this into perspective: with 4.4 million agent seats and assuming an annual replacement rate of 50%, China alone generates a procurement demand for over 2 million headsets each year.<p>For procurement professionals facing a vast and highly fragmented supply chain, the choices you make directly impact the quality of service delivered by your agents‑as well as your own operational management costs.<p>While conducting a routine patrol in the call center, you encounter a recurring complaint: agents are repeatedly asked by customers, &quot;Is someone typing over there?&quot; You take a headset to test it and hear your own keystrokes coming through as clearly as your voice. You swap the headset for a different model, and the noise vanishes. Same keyboard, same desk‑what makes the difference? What exactly is a noise‑canceling headset doing?<p>To understand this, we must first deconstruct the term &quot;noise cancellation.&quot; Many product managers are misled by marketing copy, assuming that noise cancellation is solely about making the environment quiet for the wearer. However, in a call center scenario, the true goal is exactly the opposite: ensuring that the person on the other end of the line cannot hear the background noise. These are two entirely different objectives, each requiring a completely distinct technical approach.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49693496)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-14T08:08:33Z

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
