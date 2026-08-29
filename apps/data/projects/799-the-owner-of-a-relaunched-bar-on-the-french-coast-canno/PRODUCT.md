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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A first-impression and audience-reach surface for a relaunched bar on the French coast: a venue page that states the current format explicitly, an events surface that pushes each event to the audience the isolated location prevents from walking in, and an audience-measurement view the owner can open after each event to see whether the event brought a new audience or repeated the same one.

The venue page is the source of truth for the format. Google Business Profile and Instagram stay in sync from that source, so a French-coast visitor who searches or scrolls gets the same current-format statement everywhere. The RSVP confirmation reinforces the format and the address at every touchpoint.

**One-liner:** A venue page and an events surface for a relaunched bar on the French coast that make the current format unmistakable and push each event to the audience the isolated location prevents from walking in, with an audience-measurement view so the owner can tell whether each event brings a new audience.

## Target Users

| Stakeholder | Why they care |
|---|---|
| The bar owner | Needs a single place to publish the venue's current format and the events schedule. |
| French-coast residents and visitors | Need to know whether the venue is still a nightclub before driving out. |
| Returning customers from the nightclub era | Need the format and the events surface to confirm the change. |
| French-coast tourists | Need to find the venue without driving to it and discovering it has changed. |
| Local businesses and hotels | Need a link they can send to recommend an evening venue. |
| Press and bloggers covering the coast | Need a clear format statement and a stable events feed. |

## Jobs To Be Done

1. **Functional job** — Land on the venue's page and see in five seconds that this is a bar and not the nightclub it used to be.
2. **Functional job** — Find the next event and RSVP without creating an account, get a confirmation email with the format and the address, and arrive knowing what to expect.
3. **Functional job** — Open the owner console after an event and see how many RSVPs came from the venue page versus Instagram versus a referral, and how many were first-time versus returning.
4. **Emotional job** — Stop the feeling that the venue is stuck in the nightclub's shadow.
5. **Social job** — Be the bar that the coast recommends rather than the bar the coast avoids.

## Success Metrics

- **First-time RSVP rate** — share of RSVPs that come from a first-time visitor (an email or handle the system has not seen before). The signal the venue is reaching a new audience.
- **RSVP-to-attendance rate** — share of confirmed RSVPs that the venue marks as attended, so the owner can read the difference between interest and actual visits.
- **Format-statement reach** — share of confirmed RSVPs whose confirmation email was opened, since the format statement is the reinforcement that arrives in the inbox.
- **Instagram-to-venue-page click rate** — share of Instagram event posts that produced a click to the venue page, so the owner can read whether the channel is doing the work.
- **Returning-visitor ratio** — share of RSVPs that come from a returning visitor, with the venue aiming for a healthy mix of returning and new — not all returning, not all new.
- **Google Business Profile sync health** — share of events that propagated to Google Business Profile within a stated window. The listing is the surface a French-coast visitor finds first.

## Pricing & Monetization

The source names no fee, no rate and no tier. What the architecture fixes is the cost shape: the venue could pay a flat monthly fee for the venue page and the events surface, pay per ticketed event, or pay nothing (with the service monetised by an institutional partner). The source does not pick one, so the plan does not invent a number. Any future monetization has to be evaluated against the first-time RSVP rate and the RSVP-to-attendance rate, because both metrics depend on the venue actually using the surface rather than reverting to a personal Instagram profile.

## Competitive Landscape

- **A personal Instagram profile plus a Facebook event (the de-facto incumbent for a small bar)** — works for the regulars, leaves the casual visitor guessing about the format, and offers no audience-measurement view.
- **A Google Business Profile alone** — keeps the listing current but does not push events to the audience the isolated location prevents from walking in.
- **A general-purpose event platform (the names the source does not provide)** — handles the RSVP surface but does not carry the format statement through to Google and Instagram.

The post names no specific incumbent, so no further comparison is claimed here.

## Risks & Open Questions

- [ ] Confirm the Google Business Profile API terms permit the events surface to push events from the owner's console, so the listing stays the source of truth and the owner's console stays in control.
- [ ] Define the audience-measurement view's first-time-versus-returning boundary (a cookie, an email, a phone number) so the signal is honest and not gamed by repeat signups.
- [ ] Decide how the venue page handles a season when the venue is closed (the French coast has a strong off-season for many towns), so the page does not read as an active venue when it is not.
- [ ] Validate with the bar owner that the audience-measurement view is the signal they actually use, or whether they prefer a simpler one.
- [ ] Confirm French data-protection rules (CNIL) for the RSVP list, with a visitor-initiated deletion path that is honoured end to end.
- [ ] Establish a documented escalation path for a visitor who disputes the venue's format statement (the venue says "bar" but the visitor experiences something closer to the old nightclub), so a format-disagreement does not become a brand-trust problem.
