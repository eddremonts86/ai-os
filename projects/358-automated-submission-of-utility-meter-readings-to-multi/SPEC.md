---
id: "358"
slug: automated-submission-of-utility-meter-readings-to-multi
title: Automated submission of utility meter readings to multiple management companies
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/utilities/tp6dgyysf1-automatic-submission-of-readings-of-counters"
category: utilities
date: "2025-10-10"
tags: [Utilities]
country: Russia
---
# Automated submission of utility meter readings to multiple management companies

## Problem

In Russia, a tenant or owner of a flat typically deals with several management companies (управляющие компании, UK) and resource suppliers: water, heat, electricity, sometimes gas. Each wants the monthly meter readings submitted through its own portal, app, or web form, and each has a different deadline and a different layout. The submission window is short (often 20–25 days into the month), the consequence of missing it is a bill calculated on a regional norm that is consistently higher than the actual reading, and the user is left to click through the same two-minute form on five different websites every month. The source post on ProblemHunt captures the problem as "automated submission of utility meter readings to multiple management companies." The post does not name the specific UK portals it is targeting, the number of meters, or the city — it identifies the recurring chore and the looming penalty for missing it.

## Objective

Provide a single interface where a Russian user records the meter readings once a month and the system submits them to each of the user's UK / resource-supplier portals on the user's behalf, with a record of what was submitted and confirmation receipts. The MVP should produce one full end-to-end cycle: the user enters the readings for all meters linked to the flat, the system submits them to each target portal within the submission window, and the user receives a confirmation summary showing what was submitted where, with timestamps. The objective is to remove the monthly click-through while keeping the user in control of the actual readings.

## Target Users

- **Russian flat owners or tenants** who deal with 2–5 UK / resource-supplier portals each month and consider the manual submission a recurring chore.
- **Owners of multiple flats** (parents helping adult children, small landlords) who have to repeat the same submission for several addresses.
- **Older users** who find the various UK portals confusing and would rather enter numbers once in a familiar interface.
- **Users who travel often** and do not have a fixed place to log in to each portal by the deadline.

## MVP Scope

- A user account that lists the user's flats and the UK / resource-supplier portals each flat reports to.
- A once-a-month intake screen that asks for the current reading of each meter (the system pre-fills the previous reading so the user only types the delta).
- A submission service that, for each portal, logs in with the user's stored credentials and submits the reading through the portal's web form.
- A confirmation summary that lists every submission: portal name, submitted reading, timestamp, and a screenshot of the resulting confirmation page.
- A log of skipped submissions (e.g., the portal was down, the credentials were rejected) with a clear next-step for the user.
- A reminders flow that pings the user three days before each portal's deadline.

## Constraints

- **Credential storage**: storing the user's portal credentials is a security liability; the MVP must encrypt them at rest, scope them to the single tenant, and let the user revoke them at any time.
- **Portal brittleness**: each UK portal can change its form layout or its CAPTCHA without notice; the system must degrade gracefully (skip the submission, surface the error) rather than submit a wrong reading.
- **Legal**: the user is the one submitting, and the platform is acting as a user agent; the user is responsible for the accuracy of the readings they enter, and the platform must keep a record of what was submitted on the user's behalf.
- **No reading estimation**: the system must not invent a reading; if the user has not provided one, the portal must be skipped, not auto-filled.
- **Russian-specific**: the MVP is Russia-only because the problem is specific to the UK's billing model and the deadlines it imposes; a multi-country scope would dilute the MVP.
