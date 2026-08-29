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

## Problem

Startup teams — at any geography, with the post listing Russia as the example — running customer-development interviews cannot find participants who actually match their target persona, and the available channels all degrade in different ways. Freelance respondent platforms pay uniformly, so professional respondents dominate the supply and any team willing to pay the going rate is interviewing people whose full-time job is to be interviewed. Personal-network recruiting gives the opposite failure: warm intros produce participants who will not say no to the team, which makes the feedback useless. Both channels cost the team weeks of failed recruiting and an interview slot that turns out to be unusable.

The capture is a one-line problem statement from ProblemHunt, with country listed as Russia and no further detail. The post does not name a specific startup, a specific persona, a specific incentive level, a specific respondent platform, or a specific failure rate. What the source names is the actor (a startup team running custdev interviews), the pain (no place to find relevant participants who are not professional-respondent hunters and not already in the team's network), and the missing thing (a way to test early ideas and prototypes without overpaying for biased feedback). The plan treats those bare facts as the ground truth.

What follows from those bare facts is the shape of the problem: any solution has to reach participants outside the team's personal network, has to filter professional respondents in a way the participants themselves cannot easily game, has to keep the participant pool readable to a startup team that does not have a researcher on staff, and has to do this without the per-interview cost of the incumbent platforms. The plan scopes the narrowest honest MVP that addresses exactly those four pieces, without inventing a specific persona, an incentive level or a failure rate.

## Objective

Build a custdev-participant matching surface where a startup team posts a screener for a target persona, the surface reaches participants outside the team's personal network, and each matched participant carries a documented screening record so the team can read the match without trusting the platform on faith — keeping the per-interview cost below the level at which professional respondents become the dominant supply.

## Target Users

- Early-stage startup teams (pre-seed to Series A) running 5–30 custdev interviews per validation cycle who need real-persona signal rather than professional-respondent noise.
- UX research teams at later-stage companies running concept tests on tight timelines who need vetted respondents fast.
- Independent product teams at established companies who want to test a new feature with a target persona they cannot reach internally.
- A startup team's target participant — a person outside the team's personal network who would buy the product — who signs up to be interviewed and gets paid only when the interview completes.
- Independent researchers who study customer development as a practice and need a participant pool that is not professional-respondent dominated.
- A returning team that ran one cycle of interviews and wants to run another with a refreshed pool.

## MVP Scope

- A screener-builder surface where the team defines the target persona (role, industry, seniority, geography, current tool usage) and three to five screener questions that produce a written answer the team can read.
- A participant-pool surface where people outside the team's personal network sign up with a verified email or phone, declare their persona fields, and answer the team's screener questions.
- A match surface where the team sees matched participants with the screening record (persona fields plus the screener answers) and can pick who to interview.
- A booking flow with a calendar invite that goes to the participant, so the team and the participant share a confirmed slot.
- An interview-completion record the team fills in after each interview (interview happened, interview cancelled, no-show), so the platform learns which matches produced usable signal.
- A payment path that holds the interview fee in escrow and releases it to the participant on the team's interview-completion record, not before.
- A per-team ratings view: low-rating participants drop out of the recommended pool over time, so the platform's recommendation is calibrated on real interview outcomes.
- Russian and English copy on team and participant surfaces, since the post's example geography is Russia and the source does not pick a primary language.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/startups/u3yh16ty81-startup-teams-have-nowhere-to-find-relev` follows the constraints in `809-.../SPEC.md` and the chosen stack (React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM). The visual language follows `DESIGN.md`: neutral surface, single primary accent, dense table-driven screener builder and respondent pool.

For Russia, the defaults lean toward Cyrillic + Latin bilingual UI, RUB currency glyph where relevant, DD.MM.YYYY date format, and Russian + English as launch languages. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface, one accent for primary actions, one muted accent for inconsistency flags. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for screener codes and consistency scores. Type scale is small (4 steps).

**Density** — table-driven screener builder and respondent pool; generous spacing on the interview-note editor.

**Motion** — minimal: page transitions only when the user explicitly navigates.

## Constraints

- The platform is a matching and screening surface, not a survey tool. The screener is the screening instrument; the team conducts the interview outside the platform.
- Participants are reached from outside the team's personal network. The platform does not index a team's existing contacts or invite the team's colleagues to the pool.
- Payment is held in escrow and released on the interview-completion record. A participant who no-shows is not paid; the team is not charged for a no-show.
- The screening record is what the team reads to pick a participant, not a star rating. The record carries the persona fields and the screener answers, with no implicit scoring the team cannot inspect.
- Russian and English copy are both in scope. The MVP surfaces both; the post does not pick a primary language.
- The MVP does not promise a specific professional-respondent filtering rate. The interview-completion record and the per-team ratings view are the signals the platform uses to calibrate its recommendation; specific rates are measured, not asserted.
- The MVP does not run the interview itself. The team conducts the interview on whatever channel they prefer; the platform owns the screener, the match, the booking, the escrow, and the outcome record.
