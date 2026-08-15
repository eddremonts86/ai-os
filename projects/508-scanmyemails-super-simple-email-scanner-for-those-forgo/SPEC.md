---
id: "508"
slug: scanmyemails-super-simple-email-scanner-for-those-forgo
title: Scanmyemails - super simple email scanner for those forgotten important emails.
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SideProject/comments/1vny8mw/scanmyemails_super_simple_email_scanner_for_those/"
category: sideproject
date: "2026-08-14"
tech: [Next.js, TypeScript, Gmail API, PostgreSQL, Resend, Vercel]
---
# Scanmyemails - super simple email scanner for those forgotten important emails.

## Problem

Source: [reddit.com/r/SideProject/comments/…]([reddit.com/r/SideProject/comments/…]([reddit.com/r/SideProject/comments/…]([reddit.com/r/SideProject/comments/…]([reddit.com/r/SideProject/comments/…](https://www.reddit.com/r/SideProject/comments/1vny8mw/scanmyemails_super_simple_email_scanner_for_those/)))))

Original post:

> Hey All, Made this really simple web app that I thought about after discovering I've missed some very important emails in my Gmail. Wanted to get some feedback and ideas to improve. Thanks, B submitted by /u/Specificx [link] [comments]

---

What this plan addresses: Scanmyemails: a super-simple email scanner that surfaces forgotten important emails in Gmail.

## Objective

A super-simple Gmail scanner that surfaces forgotten important emails in a daily digest, with a per-email importance score based on sourced rules. When I keep missing important emails in Gmail, I want a tool that sends a daily digest of forgotten important emails, so I stop finding critical messages weeks later.

## Target Users

- Gmail users who miss important emails in a noisy inbox
- Freelancers tracking client replies
- Small business owners managing customer email

## MVP Scope

- OAuth connect to Gmail
- Daily digest of "forgotten important emails"
- Per-email importance score (sourced rules, not invented AI)
- No auto-archive in MVP

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/SideProject/comments/1vny8mw/scanmyemails_super_simple_` follows the constraints in `508-.../SPEC.md` and the chosen stack (Next.js, TypeScript, Gmail API). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body mentions Scanmyemails and the poster's frustration with missing important Gmail emails
- Plan keeps the forgotten-email framing
- Source did not name a price
