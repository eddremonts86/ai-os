---
id: "772"
slug: an-indie-hacker-spends-20-30-hours-manually-cold-launch
title: "An indie hacker spends 20-30 hours manually «cold launching» each new product in directories, Reddit, and blogs. There is no tool that fully automates this and proves its effectiveness."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/ai/1trzcj1cz1-an-indie-hacker-spends-20-30-hours-manua"
category: ai
date: "2026-01-29"
tags: [AI, Media, Marketing, Startups, Other]
country: UK
tech: [TypeScript, Bun, Postgres, Drizzle ORM, Playwright (browser automation), Reddit OAuth, Resend]
---
# An indie hacker spends 20-30 hours manually «cold launching» each new product in directories, Reddit, and blogs. There is no tool that fully automates this and proves its effectiveness.

## Tech Stack

- **TypeScript** end-to-end, because the brief-to-surfaces mapping and the per-blog personalisation drafts are easier to keep consistent in a typed schema.
- **Bun** as the runtime, chosen because the launch pipeline is a sequence of I/O-bound operations (form submission, API call, page render) and Bun's runtime matches the workload with low overhead.
- **Postgres** as the primary store, because the launch archive (brief, activities, drafts, outcomes, attribution) is relational and benefits from a queryable record.
- **Drizzle ORM** as the data layer, because the schema includes per-launch configuration and per-activity outcomes that benefit from typed query builders.
- **Playwright (browser automation)** for the directory submission path, because real directory submission forms are not API-shaped and a headless browser is the only honest way to fill them.
- **Reddit OAuth** for posting to Reddit communities, because the platform must respect the community's published rules and OAuth is the only path that produces a post the community does not auto-remove.
- **Resend** for the blog outreach email surface, chosen because the source names no email-vendor preference and Resend is the cheapest transactional-email API for a launch workload.

## Architecture

The indie hacker submits a brief: product name, one-paragraph description, target audience, a tracking-link target. The launch service composes a launch surface list from the platform's curated directory and subreddit data, matched by the brief's stated audience and the product's category. The directory submission path runs in a headless browser per directory, fills the form using the brief, and saves the submission artefact for the record. The Reddit path queues posts per subreddit, with per-subreddit rule checks, and the indie hacker approves each post before it lands.

The blog outreach path runs personalisation over the indie hacker's blog list. For each blog, the draft is personalised against the blog's recent content (a short hook about a recent post the indie hacker read), and the draft lands in the indie hacker's send queue, with a one-click send step. The architecture intentionally keeps the human in the loop on every blog send: the post names 'fully automates' but a tool that sends unapproved emails burns the indie hacker's reputation in a way the proof-of-effectiveness metric does not recover from.

Each launch activity is tied to a unique tracking URL the indie hacker can attach to the submission's text and the blog email's link. The platform's analytics layer ingests click events and signup events (with the indie hacker's source-of-truth integration in their product), and the post-launch view aggregates clicks, signups, and paying customers per activity over a configurable window. The win is the attribution: a launch becomes a dataset the indie hacker uses to inform the next launch surface list, not just a one-off event.

The launch archive is exportable as JSON without a paid tier; the indie hacker owns the record of every submission, every post, every draft, and every attribution row. A blog that no longer exists or a subreddit that has changed rules is visible in the export, because the archive is a record of what happened, not just what succeeded.

## Milestones

1. **M1 — Brief and surface matching** — Brief ingest; curated surface list with metadata per directory, subreddit, and blog; matching by audience and category.
2. **M2 — Directory submission** — Headless browser submission path with per-directory form filling; CAPTCHA respect; submission artefact saved per activity.
3. **M3 — Reddit path** — Per-subreddit rule checks; queued posts; indie hacker approval gate; submission artefact saved per activity.
4. **M4 — Blog outreach** — Per-blog personalisation drafts based on recent blog content; queued sends; indie hacker one-click send.
5. **M5 — Tracking and analytics** — Per-activity tracking URLs; click and signup event ingestion; attribution rows per activity.
6. **M6 — Post-launch view** — Aggregations of clicks, signups, and paying customers per activity over the post-launch window; per-product launch history.
7. **M7 — Export and archive** — JSON export of every launch activity's submission and draft; launch archive per product.

## Risks

- **Directory rule drift** — directory submission forms change silently; the platform's form-filler has to maintain per-directory adapters, and a directory that changes shape breaks the launch.
- **Reddit auto-removal** — posts that miss a community's rule trip the auto-mod; the rule check has to be honest about what it cannot determine, not optimistic.
- **Blog email reputation** — a tool that sends unapproved emails burns the indie hacker's domain reputation in a way that the proof-of-effectiveness metric cannot recover from; the human-in-the-loop is non-negotiable.
- **CAPTCHA handling** — bypassing CAPTCHA is the wrong path; the platform must surface CAPTCHA as a manual action to the indie hacker.
- **Tracking transparency** — a tool that tracks users without disclosure to the indie hacker's visitors is a privacy failure; tracking URLs have to be honest.
- **Attribution accuracy** — clicks and signups tied to the wrong activity mislead the next launch; the tracking layer has to be audited per integration.
- **Launch archive retention** — the indie hacker's launch history grows indefinitely; retention has to be configurable without losing the per-product archive shape.
- **Surface-list edit latency** — a directory or subreddit whose rules change has to update in the platform within hours, not weeks, because a launch that posts to a now-banned community is a launch that fails.
