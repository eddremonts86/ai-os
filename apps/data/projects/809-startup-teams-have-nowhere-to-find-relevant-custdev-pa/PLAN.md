---
id: "809"
slug: startup-teams-have-nowhere-to-find-relevant-custdev-pa
title: Startup teams have nowhere to find relevant custdev participants (people for interviews) to test early ideas and prototypes without overpaying for biased feedback
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/startups/u3yh16ty81-startup-teams-have-nowhere-to-find-relev"
  captured: "2026-01-03"
category: startups
date: "2026-01-03"
tags: [Startups, Research, Other]
country: Russia
tech: [SvelteKit, TypeScript, PostgreSQL with row-level security, Drizzle ORM, Rust screening-verifier service, Calendly integration for booking, Resend for transactional email, Plausible for privacy-respecting analytics, Coolify]
---
# Startup teams have nowhere to find relevant custdev participants (people for interviews) to test early ideas and prototypes without overpaying for biased feedback

## Tech Stack

- **SvelteKit with TypeScript** for the team-facing screener builder, the participant-facing pool, and the booking flow — server-rendered for fast first paint on the team's surface.
- **PostgreSQL with row-level security** for participants, screeners, matches, bookings, escrow events, and ratings, with RLS enforcing the team's per-screener privacy boundary.
- **Drizzle ORM** for the schema and migrations, with the same SQL running in dev and prod.
- **A Rust screening-verifier service** for the persona-field validation step (where the platform checks declared fields against the screener's required fields and produces a match signal), keeping the match path's latency predictable.
- **Calendly integration (or an equivalent booking link surface)** for the calendar invite that goes to the participant, kept separate from the platform's booking flow so the team can use its existing scheduling tool.
- **Resend** for transactional email — screener confirmation, match notification, booking invite, escrow release.
- **Plausible** for privacy-respecting analytics on team and participant surfaces, since the post's geography is Russia and the team's first instinct on a heavy-tracker surface is to walk away.
- **Docker** for local and staging runs, and **Coolify** for self-hosted production on a single VPS, matching the per-plan deployment shape used across this corpus.

## Architecture

The platform has three surfaces — a team-facing surface, a participant-facing surface, and an admin surface — and one matching model underneath. The matching model carries the team's screener (persona fields and screener questions), the participant's declared persona fields and screener answers, the match event (which participant was surfaced against which screener), the booking event, the interview-completion record, and the escrow-release event.

The team-facing surface is the screener builder, the match view, the booking flow, and the post-interview ratings. The team defines the target persona (role, industry, seniority, geography, current tool usage) and three to five screener questions. The screener is stored with the persona-fields contract the team agreed to. The match view shows matched participants with their persona fields and their screener answers, so the team reads the screening record rather than a star rating. The team picks a participant, the platform produces a booking invite via the Calendly integration, and the interview is held outside the platform on whatever channel the team prefers.

The participant-facing surface is the persona declaration, the screener-question answer surface, and the booking confirm. The participant signs up with a verified email or phone, declares persona fields, and answers the screener questions for any screener the platform routes to them. The participant sees the booking invite and confirms a slot; the interview fee is held in escrow from the team side and released on the team's interview-completion record.

The matching path runs through the Rust verifier. The verifier takes a screener's persona-field requirements and the participant's declared persona fields and produces a match signal (in-scope, out-of-scope, partial) without storing the screener's or participant's private fields outside the row-level security boundary. The verifier's signal is the gate on whether the participant is surfaced to the team; the team then reads the record and decides.

The interview-completion record is the calibration signal. The team records whether the interview happened; the platform uses the record to release escrow, to update the participant's per-team rating, and to recalibrate the recommendation. A team that never records an outcome is a calibration gap, and the platform surfaces this on the team-facing surface rather than letting the gap grow silently.

The escrow-release event is the platform's commitment to the participant: payment is released only on the team's interview-completion record, never before. A no-show is not paid; the team is not charged for a no-show. The escrow path is auditable: every release event carries the interview-completion record ID and the team's identifier.

The platform does not run the interview itself. The team conducts the interview on whatever channel they prefer (a video call, a phone call, an asynchronous written exchange). The platform owns the screener, the match, the booking, the escrow and the outcome record — the conversation itself is the team's.

## Milestones

1. **M1 — Screener builder and persona model** — schema, the screener-builder surface, the persona-fields contract.
2. **M2 — Participant pool and declaration** — sign-up flow, verified email or phone, persona-field declaration, screener-question answer surface.
3. **M3 — Matching and verification** — Rust verifier, the persona-field validation step, the match-signal output.
4. **M4 — Match view and booking** — team-facing match view with screening record, the Calendly-integrated booking invite.
5. **M5 — Escrow and interview-completion record** — escrow hold on the team side, release on the interview-completion record, the no-show policy.
6. **M6 — Ratings and recommendation recalibration** — per-team ratings view, low-rating-participant drop from the recommended pool.
7. **M7 — Russian and English copy** — both languages on team and participant surfaces.
8. **M8 — Regulatory confirmation** — sign-off on Russian and EU personal-data and payment-processor rules before live interviews.

## Risks

- **Interview-completion record starvation** — the team skips the outcome record and the platform's calibration degrades. Mitigation: the record is one tap, surfaced inline after each booking, with the calibration dashboard showing which teams are recording and which are not.
- **Screening-record gaming** — a participant copies persona fields and screener answers from a previous match and the team reads a record that looks plausible but is fabricated. Mitigation: the screener-question answers are time-stamped at entry; the persona fields are validated by the verifier against the team's requirements, with mismatches surfaced.
- **Escrow drift** — the escrow path releases payment despite a no-show, or fails to release despite a recorded interview. Mitigation: the release event is gated on the team's interview-completion record, with the no-show policy explicit and tested in CI.
- **Pool convergence** — the matched pool converges on a single persona pattern and the team is reaching the same audience twice. Mitigation: the per-team pool-diversity metric is surfaced, and the platform's recommendation recalibrates on real interview outcomes.
- **Personal-network boundary leak** — a team invites their own colleagues to the pool and the platform's outside-network guarantee breaks. Mitigation: the pool is reachable only through public sign-up, and the team's existing contacts are never indexed.
- **Per-interview cost creep** — the platform's per-interview price rises to a level at which professional respondents become the dominant supply, and the source's gap reappears. Mitigation: the per-interview cost is monitored as a calibration metric, with the cost-shape reviewed when the pool-diversity metric degrades.
- **Regulatory gate** — Russian and EU personal-data and payment-processor rules can block the launch. Mitigation: regulatory review is its own milestone before live interviews, not a launch-day scramble.
