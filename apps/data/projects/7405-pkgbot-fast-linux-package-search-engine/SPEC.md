# SPEC.md — Pkgbot – Fast Linux package search engine

## Problem

I recently switched to NixOS and in the process of setting it up, found the package search on its repo site very clunky and tedious. No permalink to share, no way to find or sort by recency or version.<p>That got me thinking that most repo websites, including aggregators like pkgs.org and repology.org have the same issue with UX (AUR is nice and simple though).<p>So I made <a href="https:&#x2F;&#x2F;pkg.bot" rel="nofollow">https:&#x2F;&#x2F;pkg.bot</a> on top of the excellent Repology data dump specifically with the following subjective goals:<p>- Good, non-bloated, non-clunky UI and UX (opinionated, the way I would like it)
- Sorting and filtering across many parameters (license, &gt;version &lt;last_updated etc.)
- Speed (results render in single-to-double digit ms)<p>It has ~2.7m packages across 100+ package repos indexed. There are JSON APIs + CSV APIs (for direct terminal display &#x2F; easy LLM querying). I&#x27;m planning to add a DNS server also so that packages can by queried over DNS ala <a href="https:&#x2F;&#x2F;dns.toys" rel="nofollow">https:&#x2F;&#x2F;dns.toys</a><p>Source: <a href="https:&#x2F;&#x2F;github.com&#x2F;knadh&#x2F;pkg.bot" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;knadh&#x2F;pkg.bot</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49730611)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-16T17:56:21Z

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
