# SPEC.md — Hush – Brown noise and a speech blocker in the macOS menu bar

## Problem

A MacOS menu bar app for brown&#x2F;speech blocker noise.<p>I&#x27;ve been using online &quot;white noise&quot; generators for over a decade because I find they reliably help me get in the zone for an hour or two of work. I didn&#x27;t like the context switching cost of needing to find the active browser tab, so I created a mac menu bar app that makes it almost frictionless to enable&#x2F;disable brown noise.<p>How to try it: See releases zip on the GH repo.
It&#x27;s macOS 13+, notarized.<p>Technical details:
- brown noise via leaky integration
- a low-pass, speech blocker via pink noise through a 10-band EQ
- all synthesized in real time via AVAudioEngine<p>There&#x27;s also a pay-what-you-want page on Gumroad: <a href="https:&#x2F;&#x2F;rahulp6.gumroad.com&#x2F;l&#x2F;hush" rel="nofollow">https:&#x2F;&#x2F;rahulp6.gumroad.com&#x2F;l&#x2F;hush</a><p>Always open to feedback or comments if this helps you in any way. TY!

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49599268)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-07T15:07:48Z

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
