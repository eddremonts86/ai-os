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

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/799-the-owner-of-a-relaunched-bar-on-the-french-coast-canno/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Model the venue record, the event record, the RSVP record, and the audience-measurement view in Cloudflare D1.
- [ ] Build the venue page on Astro + Cloudflare Pages with the format statement, the hours, the address, the relaunch description, and the next-event section.
- [ ] Build the per-event page with the RSVP form (no account creation), the confirmation email carrying the format statement, the address and the start time.
- [ ] Wire the Google Business Profile API to sync the venue record (hours, format) and the event list to the listing.
- [ ] Wire the Instagram Graph API to post each event to the venue's existing channel, with the venue page as the link in bio.
- [ ] Build the owner console on the self-hosted Coolify instance: venue record edit, event publish, RSVP-as-attended mark, audience-measurement view.
- [ ] Add the RSVP source breakdown (venue page, Instagram, referral) and the first-time-versus-returning signal to the audience-measurement view.
- [ ] Add the closed-venue surface state the owner can switch on during the French-coast off-season.
- [ ] Add the documented RSVP retention policy and the visitor-initiated deletion path, with CNIL sign-off before live RSVPs.
- [ ] Add the optional Stripe ticketed-events integration, kept separate from the free-RSVP surface.
- [ ] Wire French-language copy throughout the public surface and the owner console; keep English out of scope at MVP.
- [ ] Run an end-to-end test: the owner edits the venue record, publishes two events, RSVPs come from the venue page and from Instagram, the confirmation emails arrive with the format statement and the address, the owner opens the audience-measurement view after the first event and sees the RSVP source breakdown and the first-time-versus-returning signal.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
