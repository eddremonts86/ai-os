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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A custdev-participant matching surface where a startup team posts a screener for a target persona, the platform reaches participants outside the team's personal network, each matched participant carries a documented screening record the team can read, and the interview fee is held in escrow and released on the team's interview-completion record — keeping the per-interview cost low enough that professional respondents do not become the dominant supply.

The team picks a participant from the screening record, books a slot, conducts the interview outside the platform, and records whether the interview happened. The platform learns from the outcome; low-rating participants drop from the recommended pool. No star ratings; the screening record and the interview-completion record are what the team reads.

**One-liner:** A custdev-participant matching surface where every matched participant carries a documented screening record the team can read, the interview fee is held in escrow until the team records the interview happened, and the per-interview cost stays below the level at which professional respondents become the dominant supply.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Early-stage startup teams (pre-seed to Series A) | Need real-persona signal rather than professional-respondent noise. |
| UX research teams at later-stage companies | Need vetted respondents fast on tight timelines. |
| Independent product teams at established companies | Need to test a new feature with a target persona they cannot reach internally. |
| A startup team's target participant | Wants to be interviewed for a fee without becoming a professional respondent. |
| Independent researchers | Need a participant pool that is not professional-respondent dominated. |
| Returning teams | Want a refreshed pool for a second cycle of interviews. |

## Jobs To Be Done

1. **Functional job** — Reach a participant outside my team's personal network who matches the persona I am testing, without paying the going rate on a generic respondent platform.
2. **Functional job** — Read each matched participant's screening record (persona fields plus screener answers) before picking who to interview.
3. **Functional job** — Book a slot, conduct the interview, and record whether the interview happened, with the payment released only on the interview-completion record.
4. **Emotional job** — Stop the feeling that the interview slot I just paid for is going to be wasted on a participant who is gaming the system.
5. **Social job** — Be the team whose customer-development signal was real, not the team that talked to 30 paid respondents.

## Success Metrics

- **Match-to-interview rate** — share of matched participants who book and complete an interview. This is the platform's primary calibration signal.
- **Interview-completion record coverage** — share of booked interviews where the team records whether the interview happened. A booking without an outcome record is a calibration gap.
- **Per-team repeat rate** — share of teams that run a second cycle of interviews within 90 days. The platform's value compounds only if the first cycle's signal was real.
- **Participant pool diversity** — share of matched participants whose persona fields do not match the dominant pattern in the pool. A pool that converges on one persona is the signal the platform is reaching the same audience twice.
- **No-show rate** — share of booked interviews where the participant no-shows. A high rate is the signal the platform's booking flow is not surfacing commitment, or the participant pool is dominated by respondents whose incentive is the booking confirmation rather than the interview itself.
- **Per-team ratings coverage** — share of completed interviews where the team fills in the post-interview rating. A rating without coverage is the signal the team's feedback loop is incomplete.

## Pricing & Monetization

The source names no fee, no rate and no tier. What the architecture fixes is the cost shape: the platform could charge the team per completed interview, take a percentage of the interview fee, or charge the participant a small listing fee. The source does not pick one, so the plan does not invent a number. Any future monetization has to be evaluated against the match-to-interview rate and the per-team repeat rate, because both metrics depend on the per-interview cost staying below the level at which professional respondents become the dominant supply — which is the structural reason the source names the gap.

## Competitive Landscape

- **Generic respondent platforms (the names the source does not provide)** — broader supply, but professional respondents dominate because the incentive is uniform and the participants are professionally interviewed.
- **Personal-network recruiting (LinkedIn, founder communities, Slack channels)** — works once, does not scale, and produces participants who will not say no to the team.
- **UX testing platforms (the names the source does not provide)** — focused on UX tests with screen recording, not on custdev conversations with a target persona.

The post names no specific incumbent, so no further comparison is claimed here.

## Risks & Open Questions

- [ ] Define the screening record's persona fields so concretely that two teams measuring the same target persona reach the same participant pool.
- [ ] Confirm the interview-completion record is recorded reliably by the team, since the platform's calibration depends on it and a low record rate is a calibration gap.
- [ ] Decide how the platform handles a participant whose persona fields do not match the dominant pool — keep them listed, surface them as a low-priority match, or remove them from the pool.
- [ ] Validate with five startup teams that the documented screening record (persona fields plus screener answers) is the signal they actually read when picking a participant.
- [ ] Confirm Russian and English copy alone is sufficient for the MVP, or whether a regional-language surface is needed for the geography the platform serves.
- [ ] Establish a documented escalation path for a team that disputes a participant's persona fields or screener answers, so a screening disagreement does not become a brand-trust problem.
