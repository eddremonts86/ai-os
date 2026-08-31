---
id: "4138"
slug: startup-teams-have-nowhere-to-find-relevant-custdev-par
title: Startup teams have nowhere to find relevant custdev participants (people for interviews) to test early ideas and prototypes without overpaying for biased feedback
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/startups/frug7pmx31-startup-teams-have-nowhere-to-find-relev"
category: startups
date: "2025-12-15"
tags: [Startups, Other]
country: Russia
tech: [Next.js, TypeScript, PostgreSQL, Drizzle ORM, Meilisearch, Cal.com integration (open-source self-hosted booking), Resend, Coolify]
---
# Startup teams have nowhere to find relevant custdev participants (people for interviews) to test early ideas and prototypes without overpaying for biased feedback

## Tech Stack

- **Next.js with TypeScript** for the team-facing screener builder, the participant-facing pool, and the public match surface — server-rendered so a screener is indexable on the open web.
- **PostgreSQL with Drizzle ORM** for screeners, participants, screening answers, match queries, and the interview-completion record.
- **Meilisearch** for the faceted search on the public participant pool (role, industry, geography, language, current tool usage), so the team can filter the pool without paying the platform to do the matching.
- **Cal.com integration (self-hosted)** for the booking invite that goes to the participant, kept separate from the platform's booking flow so the team owns the calendar and the platform does not become a calendar vendor.
- **Resend** for transactional email — screener confirmation, match notification, booking invite, optional thank-you reminder.
- **Docker** for local and staging runs, and **Coolify** for self-hosted production on a single VPS, matching the per-plan deployment shape used across this corpus.

## Architecture

The platform has three surfaces — a team-facing surface, a participant-facing surface, and a public pool surface — and one matching model underneath. The matching model carries the team's screener (persona fields and screener questions), the participant's declared persona fields and screener answers, the interview-completion record, and the per-team rating.

The team-facing surface is the screener builder, the public-pool search, the booking invite, and the post-interview ratings. The team defines the target persona and three to five screener questions. The screener is published on the public pool surface so participants can opt in. The match surface lets the team filter the pool by persona facets. The team picks a participant, sends a booking invite through the self-hosted Cal.com integration, and conducts the interview outside the platform.

The participant-facing surface is the persona declaration, the screener-question answer surface, and the booking confirm. The participant joins the public pool by declaring persona fields and opting in to a few of the active screeners. The participant sees the booking invite and confirms a slot. The participant is not paid; an optional thank-you-gift is offered by the team after the interview, kept outside the platform's payment path.

The matching path runs through Meilisearch, with the participant record indexed by persona facets. The team filters on those facets and gets the shortlist; PostgreSQL stays as the source of truth — Meilisearch is rebuilt from it on a short interval and on every participant update. The match is a facet-filter, not a paid-platform-side algorithm.

The interview-completion record is the calibration signal. The team records whether the interview happened; the platform uses the record to update the participant's per-team rating and to recalibrate the recommended pool. A team that never records an outcome is a calibration gap, and the platform surfaces this on the team-facing surface rather than letting the gap grow silently.

The optional thank-you-gift is a separate path the team runs outside the platform. The platform does not process the gift, hold the gift money, or release the gift; the team buys the gift themselves. The platform's only role on the gift path is to surface the option in the post-interview surface, so the team remembers to offer it if they want to. This is a deliberate non-feature: bringing the gift into the platform would re-introduce money into the loop and erode the no-money-in-the-loop hypothesis the MVP is built on.

The platform does not run the interview itself. The team conducts the interview on whatever channel they prefer (a video call, a phone call, an asynchronous written exchange). The platform owns the screener, the public pool, the search, the booking integration, and the outcome record — the conversation itself is the team's.

## Milestones

1. **M1 — Screener builder and persona model** — schema, the screener-builder surface, the persona-fields contract.
2. **M2 — Public participant pool** — sign-up flow, persona-field declaration, opt-in to active screeners, the public-pool surface.
3. **M3 — Meilisearch index and faceted search** — the persona-facet index, the rebuild cadence, the team-facing filter surface.
4. **M4 — Booking integration** — self-hosted Cal.com, the booking invite that goes to the participant, the calendar handoff.
5. **M5 — Interview-completion record and ratings** — outcome record on the team-facing surface, per-team rating, low-rating-participant drop from the recommended pool.
6. **M6 — Thank-you-gift path (kept outside the platform)** — the post-interview reminder the team sees, the explicit non-feature surface, no payment processing.
7. **M7 — Russian and English copy** — both languages on team and participant surfaces.
8. **M8 — Regulatory confirmation** — sign-off on Russian and EU personal-data rules before live screeners.

## Risks

- **No-money-in-the-loop hypothesis failure** — removing the fee does not filter out professional respondents, or it filters them out but the pool simply shrinks. Mitigation: the pool growth rate and the match-to-interview rate are the two metrics that test the hypothesis; the platform surfaces them weekly.
- **Thank-you-gift drift** — the team quietly starts offering thank-you gifts that drift toward the per-interview fee the MVP was designed to avoid. Mitigation: the platform documents the non-feature explicitly and the gift is a reminder, not a payment.
- **Interview-completion record starvation** — the team skips the outcome record and the platform's calibration degrades. Mitigation: the record is one tap, surfaced inline after each booking.
- **Screening-record gaming** — a participant copies persona fields and screener answers from a previous match and the team reads a record that looks plausible but is fabricated. Mitigation: the screener-question answers are time-stamped at entry; the persona fields are validated against the team's requirements.
- **Pool convergence** — the matched pool converges on a single persona pattern and the team is reaching the same audience twice. Mitigation: the per-team pool-diversity metric is surfaced, and the pool growth rate is the second-derivative signal.
- **Booking integration drift** — Cal.com's API or self-hosted contract changes and the booking invite breaks. Mitigation: the integration is a thin layer with the platform's own data model intact; a Cal.com regression does not block the outcome record.
- **Regulatory gate** — Russian and EU personal-data rules can block the launch. Mitigation: regulatory review is its own milestone before live screeners.
