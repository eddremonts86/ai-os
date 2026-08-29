---
id: "796"
slug: solar-installation-companies-lack-a-platform-for-end-to
title: "Solar installation companies lack a platform for end-to-end tracking of a customer's project — from sale to official approval, causing complaints and dissatisfaction"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/business/ldt9cicmy1-solar-installation-companies-lack-a-plat"
category: business
date: "2026-01-10"
tags: [Business, Marketing, Other]
country: Brazil
tech: [Elixir, Phoenix LiveView, PostgreSQL, TimescaleDB extension, Oban (background jobs), S3-compatible object storage, CPF / CNPJ validation library, Pix / Brazilian payment integration, WhatsApp Business API, Coolify]
---
# Solar installation companies lack a platform for end-to-end tracking of a customer's project — from sale to official approval, causing complaints and dissatisfaction

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A project-tracking platform for Brazilian solar installation companies where each customer's project is a state machine the customer can see from sale to official approval, with a chronological timeline of stage transitions, a per-stage owner, and WhatsApp notifications on every transition so the customer experiences a single shared view rather than a series of status calls.

The install company moves projects through the stages from one console, attaches every document (survey, design, install photos, utility filing, inspection certificate) against the project, and sees per-project SLA timers that surface stalling work. The customer sees the project without calling the installer; the install company has a single place to update each stage.

**One-liner:** A per-customer project-tracking platform for Brazilian solar installation companies where every stage from sale to official approval is visible to the customer, owned by the install company, and timestamped on a chronological timeline.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Brazilian solar installation companies | Need a single place to track projects across five-plus stages without scattering updates across WhatsApp and spreadsheets. |
| Customers of Brazilian solar installation companies | Want to see where their project stands without calling the installer for a status update. |
| Brazilian solar installation sales teams | Want a clean handoff to operations without losing project context after the sale. |
| Brazilian solar installation operations managers | Need to coordinate survey, install, utility filing and inspection across multiple active projects. |
| Brazilian solar installation field crews | Need a per-project view of what they own and when. |
| Brazilian utilities and inspection authorities | Whose filings the install company manages on behalf of the customer. |

## Jobs To Be Done

1. **Functional job** — See where my solar project stands and what the next stage is, without calling the installer.
2. **Functional job** — Receive a WhatsApp notification when a stage transitions, so I do not have to keep checking.
3. **Functional job** — Move a project through the stages from one console, attach the documents, and stop tracking stages in spreadsheets.
4. **Emotional job** — Stop the anxiety of not knowing whether the utility filing has been submitted.
5. **Social job** — Be the installation company whose customer satisfaction is visible in the tracking experience rather than buried in complaint logs.

## Success Metrics

- **Project completion rate** — share of projects that reach the official approval stage within the install company's stated SLA. This is the satisfaction lever.
- **SLA-timer visibility** — share of projects whose current-stage SLA is currently green (within target) versus yellow (approaching) versus red (over). The install company's operations signal.
- **Stage-transition timestamp coverage** — share of stage transitions that carry a timestamp and an owner. A transition without provenance is the failure mode the platform is built to prevent.
- **Customer support volume per project** — inbound status-call count per active project, measured against a baseline before launch. The direct inverse of the pain the source names.
- **WhatsApp notification delivery rate** — share of stage transitions that produced a delivered WhatsApp notification, since a notification the platform sent but the customer did not receive is the same as no notification.
- **Document vault completeness** — share of closed projects that have every required document attached. A project without the document trail is the gap that complaints come from.

## Pricing & Monetization

The source names no fee, no rate and no tier. What the architecture fixes is the cost shape: the platform could charge per active project, per install company per month, or per closed project. The source does not pick one, so the plan does not invent a number. Any future monetization has to be evaluated against the SLA-timer visibility and the customer support volume per project, because both metrics depend on the install company actually using the platform rather than reverting to spreadsheets.

## Competitive Landscape

- **Spreadsheets plus WhatsApp threads (the de-facto incumbent the source describes)** — work for a handful of projects, fall apart at scale, and produce the complaints the source names.
- **Generic CRM tools (the names the source does not provide)** — track customers but do not model the solar-installation state machine, so the install company still has to do the project tracking outside the CRM.
- **Solar-installation-specific ERP tools (the names the source does not provide)** — exist for large installers but are priced and shaped for enterprise customers, not for the small and mid-sized Brazilian installers the post implies.

## Risks & Open Questions

- [ ] Define the stage machine so concretely that two install companies using the platform agree on the same stage names and transitions, since the published stage model is the contract the customer-facing page depends on.
- [ ] Confirm the regulatory path (LGPD data-protection, Brazilian utility filing rules) before launch with real customer data.
- [ ] Decide how the platform handles an install company that does not move a project for several days — SLA timer red, but does the platform escalate, notify the operations manager, or stay passive.
- [ ] Confirm Brazilian-Portuguese copy alone is sufficient, or whether a Spanish surface is needed for cross-border installers.
- [ ] Validate with five Brazilian solar installation companies that the per-stage SLA timer shape matches how they actually measure their own operations.
- [ ] Establish a documented escalation path for a customer who disputes a stage transition (the install company marked the install done but the customer says it is not), so a status dispute does not become a brand-trust problem.
