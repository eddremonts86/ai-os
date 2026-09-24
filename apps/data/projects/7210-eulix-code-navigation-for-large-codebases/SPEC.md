# SPEC.md — Eulix - Code navigation for large codebases

## Problem

Hey I&#x27;ve been working on Eulix, a tool for navigating large codebases.<p>It parses a repository into symbols, call graphs and other structural information, then combines that with keyword and semantic retrieval to find relevant code.<p>I tested it on OpenStack (~6.9M LOC &#x2F; 29k files). One query about Nova&#x27;s PCI passthrough scheduling pulled back the relevant filters, helpers and related call paths in well under a second once indexed.<p>Some queries don&#x27;t need an LLM at all, since Eulix can answer directly from the structured codebase data.<p>It&#x27;s open source and runs locally:<p><a href="https:&#x2F;&#x2F;github.com&#x2F;Nurysso&#x2F;eulix" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;Nurysso&#x2F;eulix</a><p>I&#x27;d especially like feedback from people who&#x27;ve worked on code search, static analysis, or large monorepos.<p>on a side note it may be able to handle 30M+ loc codebase too, I haven&#x27;t been able to test such huge repos cause I don&#x27;t have a good enough gpu to embed parsers output! :)

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49714268)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-15T15:41:18Z

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
