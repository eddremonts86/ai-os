# SPEC.md — Beware: Malicious Profiles on YC Co-Founder Matching

## Problem

Today I received a match through YC’s Co-Founder Matching Platform. The user claimed to be an experienced British technologist named “Dave J.”<p>Immediately after matching, they sent me a WhatsApp link and asked to connect there. They then said they were “having a procedure” and were unable to voice or video call.<p>A reverse image search of their YC profile photo led to the website and GitHub of someone named “David W.” When I asked the person I was speaking with for their GitHub, however, they provided a completely different account filled with infosec-related projects.<p>There were several other red flags:<p>• Their command of English was poor despite claiming to be British.
• They claimed not to have LinkedIn, while the real David W., whose photo appeared to have been used, has an active LinkedIn profile.
• They were unwilling or unable to verify their identity by voice or video.<p>I didn’t have the time or interest to let the interaction play out beyond a few minutes, but please be careful on the Co-Founder Matching platform. There appear to be people using fabricated identities and potentially stolen photos to initiate conversations and quickly move them off-platform.<p>This also isn’t the first suspicious interaction I’ve encountered there. On a previous occasion, someone wanted me to apply for jobs on their behalf using my identity or post to HN for them.<p>I’ve reported this one to YC.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49552237)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-03T16:02:14Z

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
