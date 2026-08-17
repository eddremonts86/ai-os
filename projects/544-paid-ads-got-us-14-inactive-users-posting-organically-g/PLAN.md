---
tags: ["saas", "growth", "reddit", "indie"]
tech: ["Next.js", "TypeScript", "Reddit API", "Anthropic Claude", "Supabase", "Stripe"]
id: "544"
slug: paid-ads-got-us-14-inactive-users-posting-organically-g
title: Paid ads got us 14 inactive users. Posting organically got us 800. Here’s what changed
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo9mo7/paid_ads_got_us_14_inactive_users_posting/"
category: saas
date: "2026-08-14"
---
# Paid ads got us 14 inactive users, posting organically got us 100

## Tech Stack

- **Web app:** Next.js + TypeScript + Tailwind CSS.
- **Subreddit-parser:** Reddit JSON API + a sidebar parser that surfaces the self-promotion rule.
- **Post-drafter:** Claude, with a per-subreddit prompt that fits the room.
- **Storage:** Supabase (auth, the subreddit list, the post drafts, the cadence tracker).
- **Payments:** Stripe.

## Architecture

Single web app. The subreddit-parser runs on demand; the post-drafter is a Claude call with a per-subreddit system prompt; the cadence tracker is a Postgres table.

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + a single-subreddit draft demo. End of week 1.
2. **M1 — Subreddit-parser + rule surfacing.** Sidebar + mod-post rules per subreddit. End of week 3.
3. **M2 — Post-drafter with per-subreddit prompt.** End of week 5.
4. **M3 — Cadence tracker + weekly review.** End of week 7.
5. **M4 — Stripe paywall + Pro tier.** End of week 9.

## Risks

- **Auto-posting risk** — the tool must never post on behalf of the founder; a "Copy to clipboard" CTA is the only output path.
- **Subreddit rule drift** — rules change; the parser must re-fetch on every visit.
