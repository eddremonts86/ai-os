# SPEC.md — I built my first MCP to manage Google Ads

## Problem

My co-founder and I tried running Google Ads for our Shopify store, but we could not get a positive ROAS (we spent 150USD on a single conversion).<p>As we also could not afford an agency, we turned to AI (IMO Codex &gt;&gt;&gt; Claude Code).<p>We found that Google’s Ads MCP could only read data, but it could not make changes. So we built our own hosted MCP with read and write access.<p>It can inspect performance, find wasted spend, create or update campaigns, and work with Google Analytics and Tag Manager.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49548962)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-03T12:11:44Z

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
