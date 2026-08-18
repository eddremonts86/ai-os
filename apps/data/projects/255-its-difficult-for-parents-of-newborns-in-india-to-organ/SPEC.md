---
id: "255"
slug: its-difficult-for-parents-of-newborns-in-india-to-organ
title: "It's difficult for parents of newborns in India to organize vaccination: there is no service for easy doctor search and a «turnkey» process provision."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/health/o94v8yjuj1-its-difficult-for-parents-of-newborns-in"
category: health
date: "2026-01-09"
tags: [Health, Other]
country: India
---
# It's difficult for parents of newborns in India to organize vaccination: there is no service for easy doctor search and a «turnkey» process provision.

## Problem

In India, parents of newborns must navigate a fragmented vaccination landscape: government hospitals, private paediatricians, and private hospital vaccination clinics each offer different vaccines (national immunisation schedule vaccines plus optional ones like rotavirus, influenza, pneumococcal), on different schedules, at different prices. Finding a doctor who stocks the vaccine the parent wants, on a date that fits the schedule, near home or work, is a coordination task that the parent currently does by phone and WhatsApp.

The poster frames the missing piece as a "turnkey" service — easy doctor search plus a process the parent can follow from booking to completion. The pain is operational, not medical: the parent knows *what* vaccines the child needs (the Indian Academy of Paediatrics schedule is broadly known) but cannot find *where and when* to get them without a runaround.

The post is short. It does not quote specific cities, doctor counts, vaccine prices, or completion rates. The framing is structural.

## Objective

Build a service that lets an Indian parent search for paediatricians and vaccination clinics near them, see which vaccines each one stocks, book an appointment, and track the child's vaccination schedule across visits. The deliverable is the booking and tracking layer; the medical decision stays with the doctor and the parent.

The MVP focuses on a small number of cities (the post does not specify which) and a curated set of paediatricians and clinics that the service has confirmed stock the vaccines they list.

## Target Users

- Parents of newborns in India who need to book and track vaccinations across multiple visits in the first 24 months.
- Parents who are moving between cities (relocation, grandparents helping) and need to find a new paediatrician who stocks the same vaccines their child has already started.
- Paediatricians and vaccination clinics in India that want a steady inbound flow of parents booking vaccinations.
- New mothers (post-delivery, often at home with limited mobility) who need a low-friction booking flow that does not require a phone call.

The source frames the user as the parent. The doctor is named as the recipient of the booking, not a buyer of the service.

## MVP Scope

- A doctor search page: parent enters city and (optionally) vaccine needed; the result list shows paediatricians and clinics with the vaccines they stock, distance, next available slot, and a price band.
- A booking flow: parent picks a slot, enters the child's name and date of birth, and confirms. The clinic receives the booking and confirms or proposes an alternative slot.
- A vaccination schedule tracker: the parent enters the vaccines already given; the service shows what's next, with the date the next vaccine is due.
- A reminder: an SMS or WhatsApp reminder the day before each booked appointment and a reminder when the next vaccine is due.
- A post-visit confirmation: the parent confirms the vaccine was given; the schedule updates.

The MVP does not include tele-consultations, prescription handling, or inventory-of-stock-at-clinic in real time. Stock information is curated, not live.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/health/o94v8yjuj1-its-difficult-for-parents-of-newbor` follows the constraints in `255-.../SPEC.md` and the chosen stack (the chosen stack). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in India.

For India, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Medical scope is narrow. The MVP is a booking and tracking surface, not a medical-advice product. The schedule is sourced from the Indian Academy of Paediatrics (IAP) recommendation and clearly attributed; the doctor remains the clinical decision-maker.
- Clinic-side friction is the binding constraint. A clinic that has to log into a portal to confirm bookings will not use it. The MVP must keep the clinic-side flow to SMS or WhatsApp confirmations.
- Vaccine stock is curated, not live. A clinic listing a vaccine today may be out of stock tomorrow; the MVP must publish this honesty on the listing ("last confirmed: 12 March") rather than imply live inventory.
- Personal data: a child's name, date of birth, and vaccination history is sensitive. The MVP must define a retention policy and a parent-controlled deletion path.
- India is multilingual. The MVP's primary language is English with Hindi as a secondary option; the post does not specify, so both are kept in scope.
