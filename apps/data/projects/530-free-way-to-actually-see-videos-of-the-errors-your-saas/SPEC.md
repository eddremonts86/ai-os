---
id: "530"
slug: free-way-to-actually-see-videos-of-the-errors-your-saas
title: Free way to actually see videos of the errors your SaaS users are running into
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo1r5j/free_way_to_actually_see_videos_of_the_errors/"
category: saas
date: "2026-08-14"
---
# Free way to actually see videos of the errors your SaaS users are running into

## Problem

I set up the free tier of posthog on my saas. I told AI to rig it all up so I can watch videos of user errors. Now for all users that sign up but don't interact with the app, I just ask posthog's AI to find the users videos and now I can see exactly where they are getting stuck. Invaluable info since when I typically email users for feedback, no one ever responds. Very cool feature submitted by /u/estagingapp [link] [comments]

---

## Objective

Ship a thin wrapper around PostHog's free session-replay tier that makes the workflow described in the source (find sessions of users who signed up but never interacted, watch where they got stuck) discoverable and repeatable, so a solo founder can install it in 10 minutes instead of asking AI to "rig it all up".

## Target Users

- Primary: solo SaaS founder with <100 MAU who wants session replay without a $300/month Hotjar bill.
- Secondary: a small team (2-5) that wants the same workflow without the per-seat pricing.

## MVP Scope

- A 1-page setup guide that walks the founder through PostHog free tier + the AI prompt the source describes, copy-paste ready.
- A small PostHog query template that lists users who signed up but did not trigger any custom event in their first session.
- A "watch their last session" button that opens the PostHog replay for that user.
- No new SaaS; this is a guide + PostHog query templates, hosted as a static site.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Must not compete with PostHog; this is a guide + query templates on top of it.
- All advice must be reproducible from PostHog's free tier; no hidden paid features.
- No proprietary replay storage; founders keep their data in PostHog.
