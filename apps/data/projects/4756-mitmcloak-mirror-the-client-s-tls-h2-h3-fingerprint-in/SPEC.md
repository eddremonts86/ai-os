# SPEC.md — Mitmcloak – mirror the client's TLS/H2/H3 fingerprint in mitmproxy

## Problem

mitmproxy cannot recreate the client&#x27;s TLS, it uses python&#x27;s TLS stack, so even with a real browser behind it, your connection looks like that of a python script. To solve this, I&#x27;ve created mitmcloak. It reads the client&#x27;s ClientHello and HTTP&#x2F;2 preface in real time and mirrors it with httpcloak (my other tls client library), no capture or fine tuning of the preset required.<p>H3 is mirrored as well though QUIC only reaches the proxy in wireguard&#x2F;transparent&#x2F;reverse mode as a proxy setting doesn&#x27;t redirect UDP by default.<p>mitmcloak is an addon to mitmproxy, not a fork, so your setup stays exactly the same. Also it does not bypass certificate pinning, that&#x27;s a different problem.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49546984)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-03T07:32:14Z

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
