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
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Startup teams have nowhere to find relevant custdev participants (people for interviews) to test early ideas and prototypes without overpaying for biased feedback

## Problem

A Russia-based (or any early-stage) startup team running customer-development interviews has no reliable way to find participants who actually match their target persona, aren't being paid professional-survey-incentive hunters, and don't already know the team. Freelance respondent platforms pay everyone uniformly so professional respondents dominate; recruiting in personal networks gives biased responses from people who won't say no. The post names the cost: weeks of failed recruiting, interviews that turn out to be unusable, and overpayment to professional respondents who game the incentive.

## Objective

Ship a customer-development participant network where startup teams post a screener for a target persona, vetted non-professional respondents apply, and the team pays only for completed interviews that pass a basic consistency check — so the team gets real signal instead of professional-incentive-hunter noise.

## Target Users

- Primary: early-stage startup teams (pre-seed through Series A) running 5–30 custdev interviews per validation cycle.
- Secondary: UX research teams at later-stage companies running concept tests on tight timelines.

## MVP Scope

- Screener builder: persona fields (role, industry, seniority, geography, current-tool usage), open-text question, and a 3-question consistency screen (e.g. "describe the last time you used X" — answers are checked for plausibility).
- Vetted respondent pool: respondents verify their identity (phone or email + reference) and pass an initial screening interview before joining the pool.
- Interview booking: respondent picks a slot, the team gets a calendar invite with the screener summary.
- Payment on completion, not on signup: $25–$150 per interview based on persona seniority, released only after a basic consistency check on the open-text answer.
- In-platform interview notes (optional) and a post-interview satisfaction rating from both sides.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/startups/u3yh16ty81-startup-teams-have-nowhere-to-find-relev` follows the constraints in `809-.../SPEC.md` and the chosen stack (React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM). The visual language follows `DESIGN.md`: neutral surface, single primary accent, dense table-driven screener builder and respondent pool.

For Russia, the defaults lean toward Cyrillic + Latin bilingual UI, RUB currency glyph where relevant, DD.MM.YYYY date format, and Russian + English as launch languages. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface, one accent for primary actions, one muted accent for inconsistency flags. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for screener codes and consistency scores. Type scale is small (4 steps).

**Density** — table-driven screener builder and respondent pool; generous spacing on the interview-note editor.

**Motion** — minimal: page transitions only when the user explicitly navigates.

## Constraints

- Payment is held in escrow and released only after a basic consistency check on the open-text answer; a flagged answer means the team gets a rebook, not a refund cliff.
- Respondent verification is mandatory for the first 500 respondents; no anonymous-pool shortcuts.
- Screener fields must be explicit — no hidden disqualifiers that drive respondent gaming.
- Must run on a $5/month VPS via Coolify + Docker; no managed services that would push infra cost above that ceiling.
