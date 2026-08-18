---
id: "635"
slug: starting-outreach-at-a-local-ai-law-startup-i-will-not-
title: "Starting outreach at a local AI law startup, I will not promote"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/startups/comments/1vp00z2/starting_outreach_at_a_local_ai_law_startup_i/"
category: startups
date: "2026-08-15"
---
# Starting outreach at a local AI law startup, I will not promote

## Tech Stack

- **App:** Rails. This is CRUD over segments and messages with a lot of small admin views, which
 is the shape Rails is fastest at and needs no argument beyond that.
- **DB:** PostgreSQL, with the audience table as the single source of truth for who saw what.
- **Email:** an existing transactional provider. Deliverability to a lapsed list is a reputation
 problem that is not worth solving in-house, and it is the one part of this that can fail
 silently.
- **No queue in v1.** Waves are deliberately slow and human-triggered; the poster is already
 sending them by hand.

## Architecture

One audience table with a `first_touch` column recording what each person saw — signup, article
referral, thread comment — and a messages table recording what was sent to which segment and what
came back. Segments are queries over `first_touch` plus activity, not stored lists, so a segment
can be redefined after the first wave teaches you something.

Sending is a loop over a segment with a rate limit. There is nothing here that a diagram would
clarify.

## Milestones

1. **M0** — the audience table, and importing previous users.
2. **M1** — `first_touch` for the other two sources: article referrals and thread participants.
3. **M2** — segments as queries, with counts, so the founder can see how big each conversation is.
4. **M3** — per-segment drafts built around what changed, and sending in waves with a recorded
 response per wave.
5. **M4** — the report the poster cannot currently produce: which segment came back, and which
 did not.

## Risks

- **The premise may not hold.** It assumes the earned audience is still reachable and still
 cares. The poster reports that emailing previous users is working — "people are coming over" —
 which is the only evidence for it, and it is one founder's anecdote.
- **This is a one-time job dressed as a product.** A second launch happens once. Whether anyone
 pays for software to do it once is the central commercial doubt, and the post gives no
 indication either way.
- **The hardest part is the writing, not the tooling.** The blocker in the source is what to say
 now that the young-founder story is gone. Software can segment the audience; it cannot solve
 that.
- **Near-duplicate of plan 634** — the same founder posted twice within minutes. 635 is scoped to
 reactivating the earned audience; 634 to buying new reach. One signal, two plans.
