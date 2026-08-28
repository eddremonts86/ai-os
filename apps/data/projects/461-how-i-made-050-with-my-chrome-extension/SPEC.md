---
id: "461"
slug: how-i-made-050-with-my-chrome-extension
title: How I made $0.50 with my Chrome extension
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vntsbi/how_i_made_050_with_my_chrome_extension/"
category: saas
date: "2026-08-14"
tech: [Next.js, TypeScript, Manifest V3, Chrome Web Store API, PostgreSQL, Stripe, Resend, Vercel]
---
# How I made $0.50 with my Chrome extension

## Problem

Source: https://www.reddit.com/r/SaaS/comments/1vntsbi/how_i_made_050_with_my_chrome_extension/

Original post:

> Yep. $0.50. Try not to get jealous. I launched my first Chrome extension recently and technically I've already made money from it lol. The only problem is that the person who paid was a friend of mine who probably bought it because he felt bad for me. And to make things even better, I gave him such a massive discount that I ended up making something like 50 cents from the sale. So yeah, I guess I'm officially a profitable SaaS founder now. Jokes aside, this is the first thing I've actually built and put out there for random people to use. I honestly thought getting it finished and published would be the hard part, but now I'm just sitting here trying to figure out how the hell you're supposed to get people to actually use it. My extension is called DistractLock. Basically it lets you remove the addictive parts of sites like YouTube, Reddit, Instagram etc. without having to block the whole website. So you can still open YouTube to watch something useful without somehow ending up 40 minutes deep into Shorts. At least thats the idea lol. I've been trying to get the first few users mostly by posting in places where it actually seems relevant, but honestly I have no idea what I'm doing marketing-wise yet. For people here who actually went from basically 0 users to getting their first paying customers: what worked for you in the very beginning? And I don't mean "run ads once you have product-market fit" or some $10k/month marketing strategy. I mean when basically nobody was using your thing, nobody knew who you were and you were just trying random stuff to see what works. Would genuinely love some advice, especially from people who started with no audience. Here's the extension if anyone wants some context: https://chromewebstore.google.com/detail/distractlock-bloquear-sit/bfphddhedehfipakhaohidokgfdcfjce Next milestone: $1 revenue. submitted by /u/Negative_Attempt_874 [link] [comments]

---

What this plan addresses: A Chrome extension (DistractLock) that removes the addictive parts of sites (YouTube Shorts, Reddit feeds) while keeping the useful parts.

## Objective

A Chrome extension that selectively blocks the addictive parts of sites (Shorts, feeds, Reels) while keeping the useful parts. When I want to use YouTube or Reddit for a specific purpose, I want a tool that hides the addictive parts without blocking the whole site, so I stop losing 40 minutes to Shorts.

## Target Users

- Knowledge workers who want to use YouTube / Reddit without falling into Shorts / infinite feeds
- Students trying to study without being sucked into social
- Anyone who has tried full-site blockers and found them too blunt

## MVP Scope

- Selective blocker: hide Shorts, hide Reddit feed, hide Instagram Reels
- Per-site rules (keep YouTube videos, hide Shorts)
- Sync rules across devices
- No "AI focus coach" in MVP

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/SaaS/comments/1vntsbi/how_i_made_050_with_my_chrome_ext` follows the constraints in `461-.../SPEC.md` and the chosen stack (Next.js, TypeScript, Manifest V3). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body mentions DistractLock specifically and $0.50 from a friend
- Plan keeps the selective-blocker framing
- Source did not name a price beyond the $0.50 anecdote
