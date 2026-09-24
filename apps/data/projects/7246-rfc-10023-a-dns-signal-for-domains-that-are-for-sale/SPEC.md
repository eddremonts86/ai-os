# SPEC.md — RFC 10023: A DNS signal for domains that are for sale

## Problem

The IETF recently published RFC 10023, which I authored. It defines a small DNS convention for signalling that a registered domain is currently for sale.<p>What has been particularly encouraging is the amount of traction and support it has already received so soon after publication. A number of tools and projects have already added support or are building around the idea, including:<p>- https:&#x2F;&#x2F;forsaledns.net&#x2F; — an early adopter and reference implementation.<p>- https:&#x2F;&#x2F;for-sale-dns.hx-std.com&#x2F; — a simple lookup tool and record generator.<p>- TLDX — a tool for quickly finding available domain names.<p>- happyDomain — centralised domain management.<p>- https:&#x2F;&#x2F;ipwhois.net&#x2F;domain&#x2F;example.nl — a domain and DNS lookup service.<p>- https:&#x2F;&#x2F;inspectmydns.com&#x2F; — another handy DNS inspection tool.<p>- https:&#x2F;&#x2F;ipaddress.to&#x2F;lookup&#x2F;example.nl — a collection of useful domain&#x2F;IP tools, with API output that also helps detect syntax errors.<p>- https:&#x2F;&#x2F;www.rfc10023.de&#x2F;en — a new tool aimed primarily at German-speaking users, with an English version already taking shape.<p>The basic idea is deliberately simple: a domain owner can publish a `_for-sale` TXT record:<p>_for-sale.example.com. 300 IN TXT &quot;v=FORSALE1;furi=https:&#x2F;&#x2F;example.com&#x2F;buy&quot;<p>That&#x27;s it - the domain has it&#x27;s for sale sign.<p>Further info: https:&#x2F;&#x2F;rfc10023.nl&#x2F;<p>Let me know what you think and please let me know if I’ve missed anything or if there are any updates to the list I keep!

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49718470)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-15T20:29:19Z

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
