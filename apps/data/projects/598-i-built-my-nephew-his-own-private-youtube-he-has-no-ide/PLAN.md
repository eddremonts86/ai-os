---
id: "598"
slug: i-built-my-nephew-his-own-private-youtube-he-has-no-ide
title: I Built My Nephew His Own Private YouTube (He Has No Idea)
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1voxk19/i_built_my_nephew_his_own_private_youtube_he_has/"
category: saas
date: "2026-08-15"
tags: [saas, consumer, parenting, video]
tech: [Next.js, TypeScript, YouTube IFrame API, Supabase, Stripe]
---
# I built my nephew his own private YouTube (he has no idea what YouTube is)

## Tech Stack

- **Web app:** Next.js + TypeScript + Tailwind CSS, tablet-first.
- **Backend:** Supabase (auth, per-child playlists, watch-time tracking).
- **Video playback:** the YouTube IFrame Player API in the child view; the parent's view uses YouTube's embed for preview.
- **PIN protection:** the parent sets a PIN at signup; the child view prompts for it on every cold start.
- **Payments:** Stripe.

## Architecture

Single web app with two views (parent / child), separated by a PIN gate. The child view is a separate route with no edit affordances.

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + a single-child playlist demo. End of week 1.
2. **M1 — Parent playlist manager + YouTube link paste.** End of week 3.
3. **M2 — Child view + PIN gate.** End of week 5.
4. **M3 — Watch-time tracking + Pro tier + Stripe.** End of week 7.

## Risks

- **YouTube policy** — the product depends on YouTube links; a policy change is the biggest external risk.
- **PIN protection** — the child view must be PIN-protected on every cold start; a session-only PIN is insufficient.
