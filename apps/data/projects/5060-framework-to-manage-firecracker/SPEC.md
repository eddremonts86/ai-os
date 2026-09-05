# SPEC.md — Framework to Manage Firecracker?

## Problem

I&#x27;ve been using Firecraker lately and it&#x27;s really good to manage microVMs.<p>What I still haven&#x27;t found though is a proper daemon&#x2F;framework that wraps Firecracker and provides an easy to use API to start&#x2F;stop microVMs, keep their filesystem backed up and expose their HTTP endpoint to the public.<p>Are there any frameworks&#x2F;tools out there?

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49566049)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-04T15:26:48Z

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
