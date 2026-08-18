---
id: "254"
slug: solar-installation-companies-lack-a-platform-for-end-to
title: "Solar installation companies lack a platform for end-to-end tracking of a customer's project — from sale to official approval, causing complaints and dissatisfaction"
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/business/ldt9cicmy1-solar-installation-companies-lack-a-plat"
category: business
date: "2026-01-10"
tags: [Business, Marketing, Other]
country: Brazil
---
# Solar installation companies lack a platform for end-to-end tracking of a customer's project — from sale to official approval, causing complaints and dissatisfaction

## Problem

In Brazil, a residential or commercial solar installation is a multi-month journey: sale, site survey, engineering, permitting at the local distributor (ANEEL-registered utility), hardware procurement, installation, inspection, and final approval (the "homologação" that connects the system to the grid and unlocks net-metering credits). The customer sees long silences between milestones and has no consistent way to know what stage their project is in, what is blocking it, or when the next visible action will happen. The poster frames the missing piece as an end-to-end tracking platform.

The pain is asymmetric information: the installer knows exactly what is happening (a permit is sitting at the distributor, a panel shipment is delayed, a homologação inspection is queued); the customer knows only that they are still waiting. Complaints accumulate not because the work is bad but because the work is invisible.

The post is short. It does not quote specific timelines, utility names, complaint rates, or installation costs. The framing is structural.

## Objective

Build a project-tracking platform that the installer can use to record every milestone and every blocker for a customer's installation, and that the customer can read in plain Portuguese to see exactly where the project is. The deliverable is the visible chain of milestones, not the installer's internal workflow.

The MVP focuses on the customer-facing view and the milestone events the installer records. The MVP does not replace the installer's CRM or the distributor's permitting system; it is a thin layer that translates the installer's workflow into a customer-readable timeline.

## Target Users

- Brazilian residential and commercial customers who have signed a solar installation contract and want to know where the project stands.
- Solar installation companies in Brazil that want to reduce inbound "where is my installation?" calls and improve post-sale satisfaction.
- Project managers and field engineers at those companies who currently track projects in spreadsheets and WhatsApp groups.
- Local solar-install associations or cooperatives that want a shared customer-comms template across their member installers.

The source frames the user as the solar installation company. The customer is named as the recipient of the visible chain.

## MVP Scope

- A per-project timeline view the customer can read: sale → survey → engineering → permit submitted → permit approved → hardware procurement → installation → inspection → homologação. Each milestone shows its date and a one-line status note.
- A small set of milestone templates per project type (residential rooftop, commercial rooftop, ground-mount) so the installer does not have to design the timeline each time.
- A milestone-event log the installer records against the project: a status note ("permit submitted to Enel SP on 12/03"), an attachment (the permit receipt), a blocker ("distributor request: updated art").
- A customer-facing status page, linked from the installer's contract email or WhatsApp message, that the customer opens without logging in.
- A weekly digest email to the customer summarising what changed this week, what is blocked, and what the next milestone is expected to be.

The MVP does not include permit submission, distributor integration, or hardware procurement. It is a status surface, not a workflow engine.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/business/ldt9cicmy1-solar-installation-companies-lack` follows the constraints in `254-.../SPEC.md` and the chosen stack (the chosen stack). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Brazil.

For Brazil, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Status updates must come from the installer, not from inference. The MVP cannot scrape distributor portals or guess at permit status; it must let the installer record the milestone and the customer see it.
- Brazilian Portuguese is the primary language. The MVP's copy and the email digest are in pt-BR; the post does not ask for English or Spanish variants.
- Timeline honesty: a milestone that is overdue must show as overdue. Pretending the project is on track erodes the trust the MVP exists to build.
- Installer-side friction is the binding constraint. If the installer has to do real work to keep the customer page updated, the page will go stale. The MVP must keep the milestone-entry flow under one minute per milestone.
- The MVP is a status surface, not a CRM. Building installer-side workflow tools is out of scope; the MVP integrates with whatever the installer already uses by sitting alongside it.
