# SPEC.md — Free GitHub Action that scans PR diffs for malicious code, not quality

## Problem

I watched a video recently on malicious code injection into OSS repo PRs and how they can go undetected because of how well they&#x27;re hidden and decided to do a project for this. This tool is essentially used in unison with ai code review bots like greptile. While tools like greptile reason because they run with LLMs, this is a deterministic step before greptile that scans for malicious code (command execution, credential access, exfil, auto-run hooks, obfuscation, and prompt injection; regex + semgrep, no LLM), then can trigger the ai code reviewer like greptile or coderabbit, pointing it to its findings.<p>It&#x27;s free&#x2F;MIT and runs in your CI.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49749862)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-18T03:20:54Z

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
