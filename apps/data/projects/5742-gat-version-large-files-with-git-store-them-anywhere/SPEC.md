# SPEC.md — Gat – Version large files with Git, store them anywhere

## Problem

Hi HN — I was frustrated for a long time using Git LFS and DVC to version large files. 
Gat is the boringly simple tool I was looking for: Git manages versioning and Gat manages storage.
No dedicated LFS server, no clean&#x2F;smudge filters, just a lock file.<p>The workflow is small: `gat add` some files, commit `gat.lock` with Git, then `gat push` the content to your storage.
In a fresh clone, run `gat init` and `gat pull`. After init, hooks reconcile files automatically or you just run `gat sync`.<p>There is a lot of interesting engineering going on behind the scenes.<p>- Uses Git-inspired stat-proof before hashing
- Reconciles the worktree blazingly fast
- Can manage millions of files
- Multi-remote routing &#x2F; Read-only remote mounting
- ...<p>It’s written in Rust and Apache-2.0 licensed. It&#x27;s _very early_ pre-release days but I’d appreciate any feedback before launching the offical first v0.1.0 release.<p>Source: <a href="https:&#x2F;&#x2F;github.com&#x2F;getgat-dev&#x2F;gat" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;getgat-dev&#x2F;gat</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49609050)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-08T11:52:31Z

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
