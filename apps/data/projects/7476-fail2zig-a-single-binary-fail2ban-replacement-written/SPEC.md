# SPEC.md — Fail2zig. A single-binary fail2ban replacement written in Zig

## Problem

Built fail2zig because I like fail2ban&#x27;s log-to-ban model but wanted a smaller runtime with explicit limits on the work attacker controlled input can cause.<p>fail2zig is a single static binary with bounded parsers instead of a regex engine, SQLite-backed durable state, and nftables enforcement directly through netlink. Also has the ability to inspect and migrate existing fail2ban configurations.<p>I just release 0.4.0 today which is the point where I&#x27;m more comfortable putting it in front of more people.<p>Source: <a href="https:&#x2F;&#x2F;github.com&#x2F;ul0gic&#x2F;fail2zig" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;ul0gic&#x2F;fail2zig</a><p>Wouldn&#x27;t mind feedback from people running fail2ban today, including reasons you would not switch.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49732015)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-16T19:52:26Z

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
