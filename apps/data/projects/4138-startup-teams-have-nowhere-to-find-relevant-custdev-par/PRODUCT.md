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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A screener-discovery and open participant-pool surface where a startup team can publish a screener, browse participants from a public pool that matches the target persona, and book an interview via a self-hosted calendar — without the platform paying the participant at all, on the structural hypothesis that the per-interview fee is what makes the supply professional-respondent dominated.

The team picks a participant from the screening record, sends a booking invite through the self-hosted Cal.com integration, conducts the interview outside the platform, and records whether the interview happened. The optional thank-you-gift is the team's choice after the interview. The platform learns from the outcome; low-rating participants drop from the recommended pool.

**One-liner:** A screener-discovery and open participant-pool surface where a startup team publishes a screener, browses a public pool that matches the target persona, and books via a self-hosted calendar — without the platform paying participants, on the hypothesis that the fee is the structural cause of professional-respondent dominance.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Early-stage startup teams (pre-seed to Series A) | Would rather not introduce money into the participant relationship. |
| UX research teams at later-stage companies | Need to filter a public pool quickly on tight timelines. |
| Independent product teams at established companies | Need to test a new feature with a target persona they cannot reach internally. |
| Participants | Willing to be interviewed for the conversation or a small thank-you, and specifically do not want to be on a paid-respondent platform. |
| Independent researchers | Need a participant pool that is not professional-respondent dominated. |
| Returning teams | Want a refreshed pool for a second cycle of interviews. |

## Jobs To Be Done

1. **Functional job** — Browse a public pool of participants who match the target persona without paying a per-interview fee.
2. **Functional job** — Read each matched participant's screening record (persona fields plus screener answers) before picking who to interview.
3. **Functional job** — Send a booking invite from a self-hosted calendar the participant can confirm, and conduct the interview outside the platform.
4. **Emotional job** — Stop the feeling that the interview is contaminated by money.
5. **Social job** — Be the team whose customer-development signal came from a real conversation rather than a paid slot.

## Success Metrics

- **Match-to-interview rate** — share of matched participants who book and complete an interview. This is the platform's primary calibration signal.
- **Interview-completion record coverage** — share of booked interviews where the team records whether the interview happened. A booking without an outcome record is a calibration gap.
- **Per-team repeat rate** — share of teams that run a second cycle of interviews within 90 days. The platform's value compounds only if the first cycle's signal was real.
- **Participant pool diversity** — share of matched participants whose persona fields do not match the dominant pattern in the pool. A pool that converges on one persona is the signal the platform is reaching the same audience twice.
- **No-show rate** — share of booked interviews where the participant no-shows. A high rate is the signal the platform's booking flow is not surfacing commitment, or the participant pool is not engaged.
- **Pool growth rate** — number of new participants joining the public pool per week, since a pool that is not growing produces the same matches twice.
- **Per-team ratings coverage** — share of completed interviews where the team fills in the post-interview rating. A rating without coverage is the signal the team's feedback loop is incomplete.

## Pricing & Monetization

The source names no fee, no rate and no tier, and the MVP takes a deliberate stance: the platform does not pay participants and does not charge teams per interview. What the architecture fixes is the cost shape: the platform could charge teams a subscription for advanced search filters, charge participants nothing at all, or stay free and be institutionally funded. The source does not pick one, so the plan does not invent a number. Any future monetization has to be evaluated against the match-to-interview rate and the pool growth rate, because both metrics depend on the no-money-in-the-loop hypothesis actually filtering out the professional-respondent supply.

## Competitive Landscape

- **Generic respondent platforms (the names the source does not provide)** — broader supply, but professional respondents dominate because the incentive is uniform and the participants are professionally interviewed.
- **Personal-network recruiting (LinkedIn, founder communities, Slack channels)** — works once, does not scale, and produces participants who will not say no to the team.
- **Open user-research communities (the names the source does not provide)** — sometimes host a public pool of participants willing to be interviewed for the conversation, but rarely with the screening-record surface the source names.

The post names no specific incumbent, so no further comparison is claimed here.

## Risks & Open Questions

- [ ] Confirm the no-money-in-the-loop hypothesis holds in practice: does removing the per-interview fee actually filter out the professional-respondent supply, or does the pool simply shrink without changing its composition? This is the load-bearing bet of the MVP.
- [ ] Define the screening record's persona fields so concretely that two teams measuring the same target persona reach the same participant pool.
- [ ] Decide how the platform handles a participant whose persona fields do not match the dominant pool — keep them listed, surface them as a low-priority match, or remove them from the pool.
- [ ] Validate with five startup teams that the public-pool-without-payment model actually produces the signal they want, or whether they will quietly start offering thank-you gifts that drift toward the per-interview fee the MVP was designed to avoid.
- [ ] Confirm Russian and English copy alone is sufficient for the MVP, or whether a regional-language surface is needed for the geography the platform serves.
- [ ] Establish a documented escalation path for a team that disputes a participant's persona fields or screener answers, so a screening disagreement does not become a brand-trust problem.
