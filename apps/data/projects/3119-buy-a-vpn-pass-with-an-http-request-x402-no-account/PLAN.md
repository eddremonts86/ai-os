---
id: "3119"
slug: buy-a-vpn-pass-with-an-http-request-x402-no-account
title: "Buy a VPN pass with an HTTP request (x402, no account)"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49450671"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
---
# Buy a VPN pass with an HTTP request (x402, no account)

## Tech Stack

Not stated by the source. An x402-based VPN service would run an HTTP server that handles 402 challenges, a payment verifier on-chain, and a VPN backend (likely WireGuard) that issues short-lived configs. Specifics are TODO.

## Architecture

A small HTTP API sits in front of a payment verifier and a VPN control plane. Successful payment returns a WireGuard config or token. No user database is implied.

## Milestones

- [ ] HTTP endpoint that returns a usable VPN config after a paid x402 challenge.
- [ ] VPN backend with enough capacity for the expected traffic shape (not specified).
- [ ] Anything beyond "one request, one session" (accounts, dashboards, multi-hop) is not implied by the source.

## Risks

Abuse and regulatory exposure around paid anonymous egress are the main risks; the source does not state mitigations.
