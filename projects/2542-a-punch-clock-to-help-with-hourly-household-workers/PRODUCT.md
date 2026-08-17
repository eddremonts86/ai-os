---
id: "2542"
slug: a-punch-clock-to-help-with-hourly-household-workers
title: A punch clock to help with hourly household workers
status: draft
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49321046"
category: show-hn
date: "2026-08-16"
tags: [Show HN, Product, Problem]
---
# A punch clock to help with hourly household workers

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ My wife & I have a housekeeper who works flexible days and hours during the week. She has other commitments, so she comes to our house when it works best for her, within “agreed reasonable hours” (she doesn’t come on the weekends, or before 8am).Both of us are usually working in our home offices when she shows up, so I needed a way to track her hours so I could pay her every 2 weeks. I was afraid of losing a piece of paper (especially to our dog as he is fond of those), so I started keeping track of her hours in a spreadsheet. At the end of each day, I’d scrub the driveway video from our security system to pick up the timestamps. Then for payday I’d add the hours, multiply by 60, add minutes, divide by 60, and multiply by her hourly rate. Then mark it paid in the spreadsheet.That worked OK, but it was a bit of a pain to use. There would be days when I would forget this process and the source-of-truth video would have aged out of the security system history. Then doing the base 60 math required a few re-verify steps as I didn’t want to risk a mistake that would be in our favor financially. As a precaution I’d always round the timestamps up/down in her favor (which ends up being real money over a month).So I grabbed Claude (my first serious AI use) and built something to simplify my life: a small web app (Spring Boot + React on AWS), with an old iPad by the door as a kiosk. She punches in and out on it, and I have an “admin” view that lets me see the time logs and compute pay automatically. It grew some legs because there's a few extra features I realized I needed after weeks of using it (like notifications when she punches in or out, or the ability to leave her a message when I'm stuck in a meeting).This was a fun side project, and since it was already on AWS I figured I could make it public and the extra cost wouldn't be too much to bear. It actually took a lot of effort to do that (more than I wanted: email deliverability alone was a saga), but it's there now, and it's free.Happy to answer anything about the stack, the hosting, or whatever. I don’t have Android devices to test, so I’m not sure how well it works in that world (any feedback appreciated).

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## Jobs To Be Done

_Not written yet — `ai-os plans enrich` fills this section._

## Success Metrics

_Not written yet — `ai-os plans enrich` fills this section._

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_Not written yet — `ai-os plans enrich` fills this section._

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [ProblemHunt](https://news.ycombinator.com/item?id=49321046) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
