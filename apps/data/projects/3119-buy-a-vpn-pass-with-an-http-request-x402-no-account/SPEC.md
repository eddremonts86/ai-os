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

## Problem

The Show HN post links to https://x402.le-vpn.com but the scraper captured only the link, not the description. From the title alone, the author offers a VPN that can be purchased without creating an account by sending an HTTP request paid through the x402 protocol.

## Objective

Sell VPN access to anyone willing to pay per request, with no signup flow.

## Target Users

Programmers and agents that need short-lived VPN egress and can pay per request with crypto (the x402 pattern is a 402-payment-required HTTP flow).

## MVP Scope

An HTTP endpoint that returns VPN credentials after a successful x402 payment, with no account creation, no email, no dashboard.

## Constraints

The source provides no detail on which x402 chain is used, supported regions, session length, or rate limits; everything beyond the title is TODO.
