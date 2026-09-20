# SPEC.md — Is HTTP Basic Auth Broken in Chromium?

## Problem

Any time I try to access a page that requires Basic authentication, chromium just renders the server&#x27;s 401 page instead of opening a dialog to ask for a username&#x2F;password.<p>I could not find any existing bug reports about this... am I the only one with this issue?<p>https:&#x2F;&#x2F;authenticationtest.com&#x2F;HTTPAuth&#x2F;<p>https:&#x2F;&#x2F;testpages.eviltester.com&#x2F;pages&#x2F;auth&#x2F;basic-auth&#x2F;basic-auth-protected.html

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49600335)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-07T16:49:50Z

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
