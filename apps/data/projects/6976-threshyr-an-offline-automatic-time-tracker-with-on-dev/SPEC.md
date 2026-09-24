# SPEC.md — Threshyr – An offline automatic time tracker with on-device AI

## Problem

I&#x27;ve built and continuously improved Threshyr based on the problem I faced myself. I was working on more than 3 projects at one time. At the end of any day&#x2F;week&#x2F;month if I had to calculate how many hours I have worked on each one, I would always not be able to calculate an accurate time. Because I had to  just reconstruct it from memory instead of any real record.<p>Every tracker I tried solved this either by:
- sending my activity to their cloud or 
- by making me press start and stop, which I most of the time forget or 
- requires a monthly subscription.<p>So I built Threshyr to address all of these pain points.<p>It is a background time tracker for Windows and macOS. It runs entirely locally, recording the duration and window title for active application and active browser(excluding Firefox) domain locally on your machine.<p>It comes up with predefined categories for installed application and browser domain. Each category can be marked as Productive(green color), Neutral(gray color) and Unproductive(red color). Users can modify predefined and can also create their own custom categories.<p>Threshyr utilizes categories, tagging rules and light weight offline AI model called Threshyr AI to classify activity for projects. Users can review the activity classified by Threshyr-AI, can modify the project or even create rules based on the classification. As users review more and more activities, Threshyr-AI gets more accurate with each review.<p>Threshyr lets users see how focused they were, how often and for how long they were distracted, and what was their duration for their productive and unproductive apps and domains. Threshyr also calculates hourly and fixed totals for client projects.<p>Privacy is the core constraint I built this around:
- No account, no password, no email required.
- No keystroke logging, no screenshots, no behavioral analytics.
- Zero cloud inference.
- There are exactly two daily network calls: an anonymous daily ping to check for version updates and an active user ping.<p>Threshyr is closed source right now. I am a solo developer in Pakistan trying to build a longer term and sustainable alternative to expensive time trackers.<p>Right now, it is in pre-release. It is completely free to use with no obligation to pay (though there is an optional early-purchase at $29&#x2F;year if you want to support it). After the pre-release ends Threshyr will be priced at $58 per year. No monthly subscription. I might add a lifetime price.<p>Linux builds and team features are not available yet. Threshyr does not support Firefox<p>I’d appreciate any feedback from the community, especially on how well the classification and tagging rules work for your specific workflows. Also let me know your thoughts about a lifetime price. I&#x27;ll be in the thread to answer any questions.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49701054)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-14T17:53:51Z

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
