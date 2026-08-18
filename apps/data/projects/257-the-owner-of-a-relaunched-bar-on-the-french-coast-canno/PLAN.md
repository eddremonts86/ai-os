---
id: "257"
slug: the-owner-of-a-relaunched-bar-on-the-french-coast-canno
title: The owner of a relaunched bar on the French coast cannot attract an audience in the evening due to the legacy of its past format (nightclub) and its isolated location
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/business/tuolr4jo61-the-owner-of-a-relaunched-bar-on-the-fre"
category: business
date: "2026-01-07"
tags: [Business, Travel, Other]
country: France
---
# The owner of a relaunched bar on the French coast cannot attract an evening audience due to the legacy of its past format (nightclub) and its isolated location

## Tech Stack

- A static-first Astro site for the venue page; chosen because the surface is a single page with a hero image, opening hours, location, and the next three events — Astro's HTML-first output fits the "load fast even on weak coastal 4G" requirement.
- A Notion (or Sanity) headless CMS for the owner to update photos, opening hours, and the weekly events list without engineering help; the owner — not the developer — is the one keeping the page accurate.
- Cloudflare R2 (or self-hosted MinIO) for the weekly short-form videos; the videos are 60 seconds and stay small.
- Mapbox (or OpenStreetMap with MapLibre) for the venue map; the location story is part of the product.
- A small Node.js API (Express) for the referral-page request flow: a holiday-rental manager or surf school submits a request and gets the one-page handout by email.
- Self-hosted on Coolify; the workload is per-visit, low-throughput, and predictable.

## Architecture

Three pieces:

1. **Venue page** — server-rendered Astro page with hero image, format description, opening hours, location, and the next three events. SEO-sensitive (the venue is a real place, search is how visitors find it).
2. **CMS console** — owner-only area to update the page (photos, hours, events) and upload the weekly video.
3. **Referral handout flow** — a small request form on the venue page that emails the requester a one-page PDF handout (or a hosted page equivalent) they can keep on a counter or send to guests.

There is no multi-venue curation, paid promotion, or marketplace in the MVP. The site is the venue's surface.

## Milestones

- **M1 — Venue page.** Astro site with hero, format description, photos, opening hours, location, and the next three events pulled from the CMS.
- **M2 — CMS console.** Owner can update photos, hours, and events without engineering help.
- **M3 — Weekly video loop.** A repeatable upload path: 60 seconds, phone-shot, published on the venue page and queued to the venue's social channels.
- **M4 — Referral handout.** A request form that emails the requester a one-page handout (PDF or hosted page) with the venue's details and a referral code.
- **M5 — First-season review.** A retrospective after one season measuring first-time visits, repeat-visit rate, and content cadence; honest reporting even if numbers are modest.

## Risks

- Reputational legacy takes months to overwrite. The MVP must set expectations: a one-season commitment to the weekly video loop, not a launch-week spike.
- Content production must stay cheap. A 60-second phone-shot video per week is the ceiling; the upload path must keep the technical overhead under five minutes per clip.
- Local-collaborator outreach depends on personal relationships, not platform features. The handout is a tool for the conversation, not a substitute.
- Seasonality: the French coast is busy in summer, quiet in winter. The MVP must plan around shoulder seasons and not overstate year-round demand.
- Single-venue scope is the design choice. If the MVP drifts into a multi-venue marketplace, it loses focus on the audience-acquisition plan the owner actually needs.
