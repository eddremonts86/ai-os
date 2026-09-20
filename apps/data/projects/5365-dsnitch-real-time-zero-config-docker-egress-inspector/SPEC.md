# SPEC.md — Dsnitch – Real-time, zero-config Docker egress inspector via eBPF

## Problem

Hi HN,
I built dsnitch because I wanted a zero-config, bandwhich-style live TUI to see what my homelab Docker containers are connecting to—without running sidecar proxies, modifying container configs, or relying on reverse DNS (fails on anycast CDN IPs). Just run the binary and it automatically discovers running containers.<p>Under the hood, it&#x27;s written in Rust and attaches eBPF probes to the unified cgroup v2 hierarchy and TCP state tracepoints. To map IPs back to domain names accurately, it passively snoops raw UDP&#x2F;53 DNS responses per cgroup and decodes them in userspace using Hickory DNS. The terminal interface is built with Ratatui.<p>It targets Linux 5.8+ and does not modify or filter network packets in any way. It&#x27;s strictly read-only.<p>Happy to answer questions or hear your feedback!

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49586159)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-06T13:01:28Z

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
