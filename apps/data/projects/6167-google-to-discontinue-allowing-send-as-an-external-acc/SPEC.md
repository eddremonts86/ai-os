# SPEC.md — Google to discontinue allowing send as an external account in Jan. 2027

## Problem

Per https:&#x2F;&#x2F;support.google.com&#x2F;mail&#x2F;answer&#x2F;17101213, starting in January 2027, you may no longer send email as you@x.com if you use a you@gmail.com account. You can only send as you@gmail.com.<p>For those who like the convenience of having all of their external email commingling with their Gmail email, and taking advantage of the integration, such as calendar integration, Google Drive integration, and more, what is our best path forward?<p>At this point, it seems like doing a Google Workspace paid account may be the best solution for continuity of experience, but you break all the commingling and integration. Also, your you@x.com account is a separate window from your you@gmail.com account.<p>You could also consider a service like Fastmail. While it is reasonable quality, you don’t get the quality of the app or of the web experience, and its spam catching features don’t seem to be as good. Your access to you@x.com will be via Fastmail&#x27;s own interface or some IMAP solution. The Gmail mobile app appears to support IMAP, but it&#x27;s just an IMAP tool at that point, not strongly differentiated from any other IMAP tool. The Gmail web client has no support for IMAP.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49642314)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-10T12:00:17Z

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
