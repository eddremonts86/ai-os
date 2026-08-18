---
id: "3010"
slug: sacredcal-a-13-month-364-day-calendar-built-around-seve
title: "SacredCal – A 13-month, 364-day calendar built around seven-day cycles"
status: enriched
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49340221"
category: show-hn
date: "2026-08-18"
tags: [Show HN, Product, Problem]
---
# SacredCal – A 13-month, 364-day calendar built around seven-day cycles

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

**One-liner:** A 13-month, 28-day-per-month calendar where every month starts on Monday, every date falls on the same weekday year-round, and a personal event you mark "third Tuesday" stays a Tuesday in every month.

The product leans into the structural property of the 364-day year: because each month is exactly four weeks, the day-of-week for any given date never shifts across months. A user who schedules "third-Tuesday-of-the-month" once has it stay a Tuesday in month 4, month 7, and month 12. The same property means recurring events can be specified by date rather than by weekday-offset rule. The MVP exists for people who find that property more useful than the Gregorian calendar's irregularity.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Show HN readers who want a usable implementation | Found the post interesting and want to actually try the calendar, not just read about it |
| People whose practice cycles on seven days (religious, training, payroll) | Want a calendar that mirrors the cycle instead of forcing them to translate |
| Historically-curious users | Curious about the Cotsworth / International Fixed Calendar tradition and want a working artifact |

## Jobs To Be Done

1. **Functional job** — Navigate dates in a 13 × 28 structure, convert to/from Gregorian, and add personal recurring events that stay on the same weekday forever.
2. **Emotional job** — Feel that the calendar's structure is honest about its own rules (no hidden month-length exceptions).
3. **Social job** — Be able to print a paper calendar and put it on a wall without the user having to manually align weekday columns.

## Success Metrics

- **Activation:** A user lands on the year view, clicks "today," and adds one event within their first session, with at least 60% of weekly visitors doing so.
- **Return usage:** Of users who add at least one event, 30% return within seven days to add another.
- **Converter sanity:** The Gregorian-to-SacredCal converter round-trips a 1,000-date random sample with zero off-by-one errors in CI.
- **Print export:** At least 10% of users click the print-PDF button within 30 days.
- **No metric for "calendar adopted over Gregorian."** That outcome is not assumed and is not measured.

## Pricing & Monetization

Free in v1. No monetization path is assumed.

## Competitive Landscape

Source gives no competitive signal. The Cotsworth / International Fixed Calendar is the most directly related historical proposal, and other Show HN-style calendar projects have appeared on HN over the years, but the source post itself does not name a comparable product and naming one without warrant would be invention.

## Risks & Open Questions

- **Audience size is unknown.** A calendar built around a non-Gregorian structure serves a niche audience and the source gives no signal about demand.
- **External calendar sync is the obvious next ask.** Mitigation: ship the personal-event MVP first; defer sync until the demand is documented.
- **Date math edge cases.** Leap days, the Year Day slot, and conversions across long date ranges all have known pitfalls. Mitigation: a regression test suite that covers a 200-year Gregorian span and asserts SacredCal conversion invariants.
- **The product reads as a curiosity unless it solves a recurring pain.** Mitigation: focus on the recurring-event-by-date property as the headline value; let that carry the use case.

---

_Source:_ [ProblemHunt](https://news.ycombinator.com/item?id=49340221) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
