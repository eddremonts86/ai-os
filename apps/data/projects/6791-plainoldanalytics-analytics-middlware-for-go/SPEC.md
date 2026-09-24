# SPEC.md — Plainoldanalytics: Analytics Middlware for Go

## Problem

I built a middleware that gives you posthog-style analytics in go. It is all first-party. It logs every HTTP request, lets you track users, and lets you record screen sessions. The thing uses DuckDB as the underlying data store.<p>All of my side projects are now Golang + SQLite. I wanted an easy way to just add basic traffic analysis without needing to sign up for or integrate a third party option.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49686582)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-13T17:48:17Z

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
