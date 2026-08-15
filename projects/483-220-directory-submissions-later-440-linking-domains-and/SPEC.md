---
id: "483"
slug: "220-directory-submissions-later-440-linking-domains-and"
title: "220 directory submissions later: 440 linking domains and DR 54"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/indiehackers/comments/1vfcwbx/220_directory_submissions_later_440_linking/"
category: indiehackers
date: "2026-08-04"
tech: [Next.js, TypeScript, PostgreSQL, Stripe, Resend, Vercel]
---
# 220 directory submissions later: 440 linking domains and DR 54

## Problem

Source: https://www.reddit.com/r/indiehackers/comments/1vfcwbx/220_directory_submissions_later_440_linking/

Original post:

> [preview.redd.it/kkdp9mayfdhh1.png…]([preview.redd.it/kkdp9mayfdhh1.png…]([preview.redd.it/kkdp9mayfdhh1.png…]([preview.redd.it/kkdp9mayfdhh1.png…]([preview.redd.it/kkdp9mayfdhh1.png…]([preview.redd.it/kkdp9mayfdhh1.png…](https://preview.redd.it/kkdp9mayfdhh1.png?width=2080&format=png&auto=webp&s=defe456f000323d6accd92a1eef92504d8507592)))))) That's a client domain, few weeks after we wrapped 200+ submissions. The thing I got wrong early on is that I treated this as a volume game. It isn't. Submitting to 220 random directories and 220 chosen ones look identical on day one and nothing alike a month later. Three things that actually decide it: Relevance. A SaaS product listed across SaaS and AI directories builds one coherent signal. The same product scattered across generic business listings just builds noise. Google and the LLMs both read the neighborhood you're in, not the count. Whether the site is alive. Most directory lists getting passed around are half dead pages and unindexed junk. Knowing which ones still get crawled is most of the actual work, and it shifts constantly. Approvals, not submissions. Submitting takes a minute. Getting approved needs a square logo at the right size, a demo link that loads cold with no login wall, and a description written for a tired reviewer instead of an investor. That's where DIY runs usually lose half their listings. You can see in the screenshot: that's normal for directory profiles and it isn't the mechanism. The value is that you now exist everywhere people and models look. Search your product name plus "alternatives" before and after and it's obvious. Same reason the products ChatGPT keeps recommending in a category are always the ones listed across a lot of overlapping sites. One mention is marketing. Forty consistent ones read as consensus. If you're doing this yourself, the one thing I'd insist on: keep your description identical everywhere. Consistency beats placement quality, and it's what everyone loses by submission 60 when they start improvising. I run StartupSubmit[.]app, we do these by hand because the picking and the approval chasing is where the result actually comes from. Happy to get into specific directories in the comments. submitted by /u/startupsubmit [link] [comments]

---

What this plan addresses: A directory-submission tracker for SaaS founders, with outcome data (DR lift, linking domains) per directory.

## Objective

A directory-submission tracker for SaaS founders with sourced outcome data (DR lift, linking domains) per directory. When I want to do directory submissions for SEO, I want a tracker with outcome data so I can prioritise directories that actually move DR, instead of submitting to 220 and hoping.

## Target Users

- Solo SaaS founders running their own SEO
- Indie hackers who want to know which directories actually moved DR
- Bootcamp / accelerator participants comparing distribution notes

## MVP Scope

- Directory database (220+ entries)
- Submission tracker with date / status / outcome
- Outcome data: DR lift, linking domains (sourced)
- No auto-submission

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/indiehackers/comments/1vfcwbx/220_directory_submissions` follows the constraints in `483-.../SPEC.md` and the chosen stack (Next.js, TypeScript, PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body mentions "220 directory submissions later: 440 linking domains and DR 54"
- Plan uses those numbers as anchors
- Source did not name a price
