---
id: "799"
slug: the-owner-of-a-relaunched-bar-on-the-french-coast-canno
title: The owner of a relaunched bar on the French coast cannot attract an audience in the evening due to the legacy of its past format (nightclub) and its isolated location
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/business/tuolr4jo61-the-owner-of-a-relaunched-bar-on-the-fre"
category: business
date: "2026-01-07"
tags: [Business, Travel, Other]
country: France
tech: [Astro, TypeScript, Cloudflare Pages, Cloudflare D1 (SQLite at the edge), Resend or Postmark for transactional email, Instagram Graph API, Google Business Profile API, Stripe for ticketed events, Coolify]
---
# The owner of a relaunched bar on the French coast cannot attract an audience in the evening due to the legacy of its past format (nightclub) and its isolated location

## Tech Stack

- **Astro with TypeScript** for the venue page and the events surface, since the public surface is content-heavy (format statement, event listings, address) and Astro's island architecture keeps the venue page fast on slow connections at the coast.
- **Cloudflare Pages** for the public venue surface, with edge caching so a French-coast visitor on a slow mobile connection loads the format statement and the next event in under a second.
- **Cloudflare D1 (SQLite at the edge)** for the venue record, the event record, the RSVP record, and the audience-measurement view — small dataset, read-heavy workload, edge-local queries.
- **Resend or Postmark** for transactional email — RSVP confirmation carrying the format statement and the address, and event-reminder email the day before each event.
- **Instagram Graph API** for the per-event post that pushes each event to the venue's existing channel, with the venue page as the link in bio.
- **Google Business Profile API** for the listing sync, so the venue's hours, format and events surface stay in sync with the listing a French-coast visitor would find first.
- **Stripe** for ticketed events where the venue chooses to charge, kept separate from the free-RSVP surface so the MVP is not a payment-processor integration.
- **Docker** for local and staging runs, and **Coolify** for self-hosted production of the owner console, matching the per-plan deployment shape used across this corpus.

## Architecture

The service has three planes — a public venue surface, an owner console, and a sync plane — and one venue record underneath. The venue record carries the format statement, the hours, the address, the description of the relaunch, and the current event list. The record is the source of truth; the sync plane pushes changes to Google Business Profile and Instagram, and the public surface renders the venue page from the record.

The public venue surface is a single per-venue page with three sections: the format statement (a short paragraph and a one-line label the visitor reads first), the next event (date, time, short description, RSVP button), and the past events list (so the visitor sees the venue is active). The page is server-rendered with Astro, cached at the Cloudflare edge, and updates within the cache-invalidation window when the venue record changes.

The events surface is a per-event page the visitor reaches from the venue page or from a link in the Instagram bio. The page carries the event name, the date, the format statement, the address, the capacity, and the RSVP form. The RSVP form takes an email address and a name and writes an RSVP record; the venue does not require account creation. The confirmation email carries the format statement, the address, and the start time, so the visitor has everything they need to attend.

The owner console is a small authenticated surface where the owner edits the venue record, publishes events, marks RSVPs as attended, and reads the audience-measurement view. The console is gated behind a single-owner password and lives on the self-hosted Coolify instance, separate from the public Cloudflare Pages surface. The console writes to the same venue record the public surface reads, so the sync plane picks up changes immediately.

The sync plane reads changes to the venue record and the event list, and pushes them to Google Business Profile (hours, format, events list) and to Instagram (each event as a post with the venue page as the link in bio). The Instagram integration respects the venue's existing posting cadence and does not flood the channel. The Google Business Profile integration uses the API terms the venue has agreed to.

The audience-measurement view reads the RSVP source (venue page, Instagram, referral) and the first-time-versus-returning signal (an email the system has not seen before), and produces the post-event summary the owner opens after each event. The view is a proxy, not footfall — the MVP does not promise footfall and the README states this explicitly.

## Milestones

1. **M1 — Venue record and venue page** — the format statement, the hours, the address, the relaunch description, the server-rendered page on Cloudflare Pages.
2. **M2 — Events surface** — per-event page, the RSVP form without account creation, the confirmation email with the format statement and the address.
3. **M3 — Google Business Profile sync** — the API integration, the hours and format propagation, the events-list propagation.
4. **M4 — Instagram sync** — the Graph API integration, the per-event post, the venue-page-as-link-in-bio pattern.
5. **M5 — Owner console** — venue record edit, event publish, RSVP-as-attended mark, the audience-measurement view.
6. **M6 — Audience-measurement and reporting** — the RSVP source breakdown, the first-time-versus-returning signal, the post-event summary.
7. **M7 — Off-season handling and CNIL sign-off** — the closed-venue surface state, the documented RSVP retention and deletion path.

## Risks

- **Format statement drift** — the owner edits the format statement and the visitor reads something that contradicts the Google or Instagram surface. Mitigation: the venue record is the source of truth, and the sync plane pushes every format change to both Google and Instagram.
- **Instagram channel fatigue** — the venue floods its Instagram with event posts and the audience scrolls past. Mitigation: the sync plane respects the venue's existing posting cadence and does not post every event automatically where the cadence would break.
- **Google Business Profile API terms drift** — Google changes the API terms and the sync path breaks. Mitigation: API terms reviewed before each quarterly sync update.
- **RSVP-to-attendance rate collapse** — RSVPs confirm but attendance is low, because the visitor misread the format or the address was hard to reach. Mitigation: the confirmation email carries the format statement and the address; the venue can mark RSVPs as attended to read the gap.
- **First-time-vs-returning boundary gaming** — the venue creates multiple signups to inflate the first-time rate. Mitigation: the boundary is the email the system has seen before, with no per-venue override.
- **Off-season read** — the page reads as an active venue when the venue is closed. Mitigation: a documented closed-venue surface state the owner can switch on during off-season.
- **CNIL regulatory gate** — French data-protection rules can block the RSVP list. Mitigation: regulatory review is its own milestone before live RSVPs, with a documented deletion path the visitor can use.
