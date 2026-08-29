---
id: "3705"
slug: visitsreport-analytics-you-can-publish-and-prove
title: Visits.Report – analytics you can publish and prove
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49487243"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [Plain HTML, vanilla JS tag, Cloudflare-edge hashing, SQLite]
---
# Visits.Report – analytics you can publish and prove

## Problem

The product's framing is direct: anyone can screenshot a dashboard. The hard part is showing your numbers to somebody who has a reason to doubt you — an advertiser, a buyer, a sponsor, an acquirer — and having them believe the screenshot.

The landing page says it explicitly: "Visits.report gives you a public page anyone can open, and a daily hash chain they can recompute themselves — so your numbers stop being a claim." The mechanism is four pieces, in the founder's own words:

- "Counted server-side. Hits are recorded by us, on our infrastructure. You never touch the numbers, which is what makes them worth showing anyone."
- "Sealed every day. Each completed day is hashed together with the day before it. Edit any past number and every digest after it changes — visibly, for anyone who kept an old one."
- "Domain ownership proved. A DNS TXT record on the domain itself proves the traffic belongs to whoever is publishing it. Until it is there, the page says so in plain language."
- "Nothing to install, nothing to consent to. One script tag. No cookies, no fingerprinting, no cross-site identifiers, and IP addresses are never written to disk."

A visitor is identified by a hash of a daily salt + site + IP + browser string; the IP itself is never stored, the salt is destroyed after two days. That is what lets the tag run with no cookie banner. The trade-off is explicit: "the same person on the same machine is a different visitor tomorrow, and there is no way to follow anybody across days or across sites."

The founder posts as `@nadermx` on X; the site points at itself as a public report (`visits.report/r/507de85247a64071f4e5583f9ba2583b/`), and shows two other live reports — `anyonecanbuy.com` and `flinch.auction` — as evidence the system is in production.

## Objective

Replace "screenshot of a dashboard" with a public page anyone can recompute, so a site owner can prove to a counterparty that the numbers they publish are the numbers that happened.

## Target Users

1. **Site owners selling attention** — anyone running a publication, indie project, or small marketplace who wants to show an advertiser or sponsor real numbers without giving them dashboard access.
2. **Buyers and sponsors** — the counterparty. The product's stated audience is "an advertiser, a buyer, a sponsor, an acquirer" who is being shown a public page and can verify it themselves.
3. **Operators of small standalone sites** — anyone who already runs a static site or one-page product and doesn't want Google Analytics, Plausible, or Fathom's pricing tier; the script tag is one line, the analytics is server-side, the public page is the product.

## MVP Scope

- Public analytics page per site, with rolling daily numbers and a date-range selector.
- One-line script tag that drops a daily-salted hash of (site, IP, browser) and writes no cookies.
- Daily hash chain: each day's digest includes the previous day's digest; the chain is recomputable by anyone who holds a copy of an old digest.
- DNS TXT ownership check: until the owner places the TXT record, the public page says so in plain language.
- Server-side counting (no client-side dashboard the owner could edit).
- Free public report for the operator's own site, visible at `visits.report/r/[site_id]/`.
- Out of scope for MVP: per-page funnels, event tracking, custom events, paid dashboards — the product's surface is the public page, not an analytics console.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- No cookies, no fingerprinting, no cross-site identifiers, no stored IPs. The product's claim depends on this posture being literally true; a single fingerprinting line breaks it.
- Visitor identity resets daily. The product is honest about this limitation; "it is what lets the tag run with no cookie banner".
- Free at the entry tier — the landing page shows `Start free`. Pricing tiers above free are not specified in the source.
- The site runs on itself; the public report for `visits.report` is visible at `visits.report/r/507de85247a64071f4e5583f9ba2583b/`. Eating your own dogfood is the visible product mechanic.
