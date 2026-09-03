# SPEC.md — PopSQL and SeekWell were shutting down, so I built the replacement

## Problem

My team used PopSQL and SeekWell to get data from our DBs into Google Sheets on a schedule while also sharing a library of company specific SQL queries. Both were shutting down, so I built a replacement covering just the parts we actually used: connect a database, write and share SQL, schedule the results to Sheets or Slack.<p>Yes, a cron job running a python script does the same thing for free. But getting non-technical teammates to use that is the hard part, and that&#x27;s really what this solves.<p>Another thing I strongly believe is that data belongs to everyone in the company. People will figure out use cases when they have access to the data, and people are way more productive when the access is not gatekeeped.<p>It&#x27;s narrow on purpose, and I&#x27;m happy to build almost anything people need in a tool like this. What would you want to see?

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49514362)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-08-31T20:14:26Z

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
