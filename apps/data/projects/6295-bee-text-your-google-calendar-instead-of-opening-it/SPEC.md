# SPEC.md — Bee – Text your Google Calendar instead of opening it

## Problem

I&#x27;ve bounced off every calendar app, always for the same reason: opening the app and learning new UX. I already have iMessage and WhatsApp open all day, so I built an assistant that lives there and manages my Google Calendar and Google Tasks by text. &quot;Lunch with Sam Thursday 1pm&quot;, &quot;move my 3pm to tomorrow&quot; — the real calendar updates.<p>No install, no new interface. When I get calendar invite from others, I also get a text and I can simply text back to RSVP.<p>Refresh tokens are envelope-encrypted via KMS.<p>Texting &quot;delete my account&quot; purges everything.<p>Would appreciate feedback.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49648544)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-10T18:49:41Z

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
