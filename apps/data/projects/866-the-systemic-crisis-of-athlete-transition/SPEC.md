---
id: "866"
slug: the-systemic-crisis-of-athlete-transition
title: The systemic crisis of athlete transition
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/fitness/jovbc4bek1-the-systemic-crisis-of-athlete-transitio"
category: fitness
date: "2025-10-29"
tags: [Fitness, Health, Career]
country: USA
tech: [Elixir, Phoenix LiveView, PostgreSQL, Oban, S3-compatible object storage, Fly.io]
---
# The systemic crisis of athlete transition

## Problem

The capture names a problem and a country and nothing else: the systemic crisis of athlete transition, filed from the USA under fitness with career and health tags. It is a category-level statement from ProblemHunt, so there is no poster narrative, no sport, no level of competition and no quoted figure to build on. What follows reasons from the named problem only.

Athlete transition is the move out of competitive sport into whatever comes next, and the word the poster chose is systemic rather than personal. That framing is the useful part. A personal crisis is addressed with counselling; a systemic one implies the exit is predictable, arrives on a schedule nobody plans for, and strands people who spent their formative years inside an institution that had a role for them and then did not. An athlete leaving competition loses at once the daily structure, the coaching relationship, the peer group, the identity that answered the question of what they do, and in many cases the income and the healthcare that came attached to a roster spot.

The transition also has an information asymmetry at its centre. The skills built over a competitive career — sustained training discipline, performance under observation, coachability, recovery from measurable failure — are real and transferable, but they are not legible on a resume, and the athlete is usually the person least equipped to translate them, because inside the sport those traits were unremarkable. Meanwhile the people who could translate them are scattered: former athletes who already made the crossing, coaches who watched dozens do it, and employers who have hired athletes before and would again.

What the capture does not tell us is decisive for scoping and must stay an open question rather than an assumption: which population this is about. A collegiate athlete whose eligibility ends on a known date, a professional whose contract is not renewed, and an athlete forced out by injury are three different problems with three different clocks. The honest MVP therefore addresses what is common to all three — the structured translation of a competitive career into a next step, and access to people who have already done it — rather than picking a population the source never named.

## Objective

Build a transition workspace for an athlete leaving competition that does three things and no more: turns a competitive record into evidence an employer or admissions reader can evaluate, routes the athlete to people who have already made the same crossing in their sport, and holds a plan with dates against the exit clock they are actually on. The translation step is the product; the network and the plan exist to make it act on something.

## Target Users

- Athletes inside the last season or two of competition, who know the exit is coming and have no structure for it because everything about their calendar was built by somebody else.
- Athletes already out, including those forced out by injury, who are further along and lack the vocabulary to describe what their career actually taught them.
- Former athletes who made the crossing successfully and are willing to be the person the next one talks to, which is the supply side without which the routing is empty.
- Coaches and athletic support staff who watch this happen every year to people they are responsible for and currently have only informal help to offer.
- Employers who have hired athletes before and know the profile is good, but cannot find candidates because the signal is invisible on a normal resume.

## MVP Scope

- Career record intake: sport, level, years, role, injuries where the athlete chooses to disclose them, and the concrete responsibilities a roster position carried.
- Translation worksheets that convert that record into claims with evidence attached, in the language of the destination rather than the sport.
- A directory of former athletes filtered by sport and by destination field, with a request-to-talk flow rather than open messaging.
- A dated plan tied to the athlete's own exit date, with the steps that must happen before it and the ones that can only happen after.
- A document workspace holding the outputs — a resume, a written narrative, references — versioned so the athlete can see the drafts improve.
- Consent-scoped visibility: nothing about an injury, a contract or a departure reason is visible to anyone the athlete did not explicitly share it with.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The source names neither sport nor competitive level, so the data model must not assume a season structure, an eligibility rule or a contract shape. Anything sport-specific belongs in configuration.
- This population is being asked to describe a loss while it is happening. Every prompt has to be answerable by someone who is not yet ready to call the career over.
- Health and injury information is the most sensitive field in the system and the most tempting to use for matching. It stays disclosure-only and never becomes a filter.
- The mentor side is volunteer labour and will not survive an unbounded inbox; request rate limits are a design requirement, not a later setting.
- Nothing here is clinical care. Where an athlete's need is mental health support, the product's job is to hand off, not to counsel.
- The exit clock is the one hard deadline in the product and it differs per athlete, so no default schedule can be assumed.
