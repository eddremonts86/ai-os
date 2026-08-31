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

## Problem

Startup teams running customer-development interviews cannot find participants who match the target persona. The available channels — freelance respondent platforms and personal-network recruiting — degrade in opposite ways. Freelance platforms pay uniformly, so professional respondents dominate the supply; personal-network channels produce participants who will not say no to the team, which makes the feedback useless.

This is the second capture of the same ProblemHunt problem statement filed earlier in the same period, with the same one-line problem statement and the same country tag (Russia). The post does not name a specific startup, a specific persona, an incentive level, a respondent platform, or a failure rate. What the source names is the actor (a startup team running custdev interviews), the pain (no place to find relevant participants who are not professional-respondent hunters and not already in the team's network), and the missing thing (a way to test early ideas and prototypes without overpaying for biased feedback).

This second capture sits alongside another near-identical capture from three weeks later in the same month; the two are duplicates filed in the same ProblemHunt period, and the corpus carries both because the upstream platform did not deduplicate. The plan treats the source as ground truth and scopes a different concrete MVP angle than the duplicate: a screener-discovery and participant-pool surface that does not pay participants at all, on the assumption that the cost-shape of paying is the structural reason professional respondents dominate the supply. This is an open hypothesis from the framing, not a fact the source establishes.

## Objective

Build a screener-discovery and open participant-pool surface where a startup team can publish a screener, browse participants who match the target persona from a public pool, and book an interview via a self-hosted calendar — without paying the participant at all, with the team's own incentive (a small gift, a thank-you, or nothing) replacing the per-interview fee.

## Target Users

- Early-stage startup teams running 5–30 custdev interviews per validation cycle who would rather not introduce money into the participant relationship.
- UX research teams running concept tests with a target persona on a tight timeline.
- Independent product teams at established companies who want to test a new feature with a target persona they cannot reach internally.
- Participants who would be willing to be interviewed for the conversation alone, or for a small thank-you gift, and who specifically do not want to be on a paid-respondent platform.
- Independent researchers who study customer development as a practice and want a participant pool that is not professional-respondent dominated.
- Returning teams that ran one cycle and want a refreshed pool for a second cycle.

## MVP Scope

- A screener-builder surface where the team defines the target persona (role, industry, seniority, geography, current tool usage) and three to five screener questions that produce a written answer the team can read.
- A public participant-pool surface where people opt in to being interviewed, declare persona fields, and answer screener questions on the screeners they find interesting.
- A team-facing match surface with faceted search (role, industry, geography, language, current tool usage) so the team can filter the public pool without paying the platform to do the matching.
- A self-hosted Cal.com booking integration so the participant receives a calendar invite from the team's own booking surface, and the platform does not become a calendar vendor.
- An optional thank-you-gift path (a small gift card, a coffee, a public thank-you on the team's page) the team can offer after the interview, kept outside the platform's payment path.
- An interview-completion record the team fills in after each interview (interview happened, interview cancelled, no-show), so the platform learns which matches produced usable signal.
- A per-team ratings view: low-rating participants drop out of the recommended pool over time, so the platform's recommendation is calibrated on real interview outcomes.
- Russian and English copy on team and participant surfaces, since the post's example geography is Russia and the source does not pick a primary language.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The platform does not pay participants. Money is not in the loop at MVP, on the structural hypothesis that the per-interview fee is what makes the supply professional-respondent dominated.
- Participants are reached from a public pool. The platform does not index a team's existing contacts or invite the team's colleagues to the pool.
- The optional thank-you-gift is offered by the team after the interview, not by the platform. The platform does not process the gift; the team does.
- The screening record is what the team reads to pick a participant, not a star rating. The record carries the persona fields and the screener answers, with no implicit scoring the team cannot inspect.
- Russian and English copy are both in scope. The MVP surfaces both; the post does not pick a primary language.
- The MVP does not promise a specific professional-respondent filtering rate. The interview-completion record and the per-team ratings view are the signals the platform uses to calibrate its recommendation; specific rates are measured, not asserted.
- The MVP does not run the interview itself. The team conducts the interview on whatever channel they prefer; the platform owns the screener, the public pool, the search, the booking integration, and the outcome record.
