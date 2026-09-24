# SPEC.md — Socratix – update: the AI voice oral exam (Viva) is live

## Problem

Update to my previous post a couple of weeks ago (<a href="https:&#x2F;&#x2F;news.ycombinator.com&#x2F;item?id=49661638">https:&#x2F;&#x2F;news.ycombinator.com&#x2F;item?id=49661638</a>). Feedback for that run was brutal and constructive, so thought it would be good to follow up.<p>The Viva is live – that was the &quot;coming soon&quot; feature from before. Once you have completed a concept&#x27;s diagnostic, you will have a live voice conversation with the AI where it will ask follow-up questions and make you defend your reasoning orally as opposed to selecting a response. Finishing the conversation correctly will trigger an evaluation as opposed to just discarding the session.<p>Other issues addressed from the feedback:<p>The diagnostics were incorrectly rejecting short, verbatim answers (e.g. &quot;mutex&quot;) – they were simply being flagged for an AI evaluation as a result of their brevity. Fixed.
A few lessons were suffering from bad math formatting and some off-topic material making its way in due to the generation prompt – issue resolved.
The mobile navigation was hiding the review controls – issue resolved.
There is a feedback form on the homepage now rather than asking people to send an email.<p>Free, nothing priced yet. The thing I really want to find out is if it really does feel any different from taking a quiz, as the Viva is the ultimate proof of this because it’s much more difficult to fake knowledge in conversation. Wonder if it works for people who have tried it.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49694173)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-14T09:35:53Z

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
