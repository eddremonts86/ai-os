---
id: "626"
slug: every-dashboard-i-use-added-the-same-quotask-aiquot-but
title: "Every dashboard I use added the same \"Ask AI\" button this year"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vozdqc/every_dashboard_i_use_added_the_same_ask_ai/"
category: saas
date: "2026-08-15"
---
# Every dashboard I use added the same "Ask AI" button this year

## Problem
 I've spent the last year or so building a trading tool. Somewhere in the middle of that I started noticing the same thing everywhere. AWS has it. GCP has it. Firebase, Supabase, Hostinger, Cloudflare. They've all quietly put an "Ask AI" button in their dashboard. And it isn't a chatbot that links you to docs. You ask for something and it does it. "Give Priya the same access as Jamie but read only on production." "Add a redirect from /pricing to /plans." It goes and does that, shows you what it's about to change, and you say yes. Makes sense for them. They've got the engineers. What I keep thinking about is everyone else. If you run a five person SaaS, your users have already been trained by Supabase and Vercel to expect that button. They're going to go looking for it in your product. And you are not spending two quarters and three engineers building one. So that's what I've been building. The same thing, for products that can't afford to build it themselves. I'm not going to pitch it here. Honestly I don't know yet whether it's useful to anyone other than me, which is most of why I'm posting. I'm looking for 15 to 20 founders with a real SaaS and real users who want to be first. If that's you, DM me and I'll send you the link. Happy to answer anything below. submitted by /u/Southern_Kitchen3426 [link] [comments]

---

## Objective

The author is exploring a small embeddable "Ask AI" action button for SaaS products that cannot afford to build their own — the same kind of natural-language dashboard action that AWS, GCP, Firebase, Supabase, Hostinger and Cloudflare have rolled out this year. The product is being built by one person (the author) and is currently being offered to 15–20 founder-design partners to validate whether the use case generalises beyond their own trading tool.

## Target Users

- Primary: founders of small (≈ 5-person) SaaS products whose users now expect an "Ask AI" action in the dashboard because Supabase / Vercel have trained them to.
- Secondary: solo / two-person SaaS teams with the same UX gap and no engineering runway to build an internal action model.
- Not a target in the source: enterprise teams that already have in-house platform engineers (per the author, "they've got the engineers").

## MVP Scope

Per the source, the product is the same idea the big platforms ship: a natural-language prompt in the dashboard that, instead of linking to docs, executes an admin action (e.g. "Give Priya the same access as Jamie but read only on production", "Add a redirect from /pricing to /plans"), shows the user the diff it is about to apply, and waits for an explicit "yes" before persisting. The author is recruiting 15–20 design partners to test the first build; no pricing, no distribution channel, and no go-to-market is specified in the source.

## Design Direction

See `DESIGN.md` for this project's design tokens (Vercel-inspired: minimal, Inter / Geist Mono, black/white with a single accent).

## Constraints

- The author explicitly says they do not yet know whether the product is useful to anyone other than themselves — that is the main reason for the post.
- The author is not pitching in the thread; recruitment is via DM and only the link is shared off-thread.
- No statements about pricing, target revenue, or scale targets appear in the source.
