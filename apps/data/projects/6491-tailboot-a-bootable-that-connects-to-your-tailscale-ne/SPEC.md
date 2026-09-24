# SPEC.md — Tailboot – A bootable that connects to your Tailscale network

## Problem

Hi everyone, I often use coding agents to debug remote machines when the host OS isn’t working. I built Tailboot for that workflow: it’s a minimal Debian-based live image that boots from USB, joins your tailnet using a Tailscale auth key, and starts Tailscale SSH.<p>It&#x27;s a minimal image (since you&#x27;re expected to be connected to the internet), but it&#x27;s enough to let an agent connect to it over Tailscale SSH and debug issues<p>The access key is injected into the ISO entirely client side, But I generally recommend adding a tag to it that will block it from being able to access other nodes on your network.<p>Github: <a href="https:&#x2F;&#x2F;github.com&#x2F;ShoeBoom&#x2F;tailboot" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;ShoeBoom&#x2F;tailboot</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49659104)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-11T14:30:43Z

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
