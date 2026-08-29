---
id: "3701"
slug: wrapstart-manage-wrap-and-detail-jobs-with-crm-quoting-
title: "Wrapstart – Manage wrap and detail jobs with CRM, quoting, scheduling, and AI"
status: enriched
source:
  name: BetaList
  url: "https://betalist.com/startups/wrapstart?utm_campaign=startup-181423&utm_medium=atom&utm_source=newsfeed"
  captured: "2026-08-28"
category: beta
date: "2026-08-28"
tags: [BetaList, Beta, Product]
tech: [Laravel, Postgres, Livewire, Twilio Voice with call transcription, Stripe and Square payments, QuickBooks Online API]
---
# Wrapstart – Manage wrap and detail jobs with CRM, quoting, scheduling, and AI

## Tech Stack

- **Laravel + Postgres:** the domain is transactional and relational — customer, vehicle, quote, job, bay assignment, invoice, inventory movement — and every one of those needs consistency more than it needs scale. Laravel also brings the queue, scheduler and webhook plumbing that the Twilio, Stripe, Square and QuickBooks integrations all require.
- **Livewire:** the shop's screens are dense forms and a live job board, used by one or two people at a time. Server-rendered reactive components avoid maintaining a separate API and SPA for an audience of a handful of concurrent users per tenant.
- **Twilio Voice + transcription:** call forwarding from the shop's existing number, recording, transcription and programmable follow-up. The shop keeps its published number; Twilio sits behind it.
- **Stripe and Square SDKs side by side:** shops already have one. Both are first-class payment surfaces behind a single `PaymentGateway` interface so invoices do not care which one a tenant uses.
- **QuickBooks Online API:** invoice and payment sync, OAuth per tenant, with a mapping table between platform invoices and QBO entities so re-sync is idempotent.
- **Mobile web, not a native app:** techs update job stages from a phone in a bay. A responsive PWA with large touch targets ships in weeks and installs with a link; a native app adds store review to the critical path for a feature whose whole value is that nobody skips it.

## Architecture

The spine is a single job record that every other surface writes to. A call arrives at the shop's number, Twilio forwards it, and whether or not it is answered the platform stores the recording, the transcript and a lead. An unanswered call schedules a follow-up job on the queue. The lead becomes a quote: service type plus vehicle plus coverage area, priced from the tenant's own material and labour rate table, with the AI assist proposing line items that the owner edits rather than accepts blindly.

An approved quote books capacity. Bays and techs are modelled as resources with working hours, so scheduling is an allocation against real availability rather than a calendar entry — and cure time is a resource-occupying stage, which is where generic field-service scheduling breaks for this trade. The job then moves through intake, prep, install, cure, QC and ready, each transition writing an inventory movement for consumed film and consumables so material cost accrues to the job as it happens.

Completion produces an invoice. The `PaymentGateway` interface settles it through the tenant's Stripe or Square account, and a queued sync writes the invoice and payment to QuickBooks Online, recording the QBO id for idempotent retries. Analytics read from the accrued cost and the resource allocations: margin per job and per service type, utilization per bay and per tech. The client portal is a scoped read of the same job record plus quote approval and invoice payment — no separate customer-facing data model.

## Milestones

1. **M0 — Domain and tenancy.** Customer, vehicle, quote, job, bay, tech, inventory schema; per-shop tenancy; rate tables. End of week 3.
2. **M1 — Quote to job.** Quoting from tenant rates with AI-assisted line items, quote approval, scheduling against bay and tech availability including cure time. End of week 6.
3. **M2 — Job tracking on a phone.** The six-stage job board, one-handed stage updates, per-stage inventory movements. End of week 8.
4. **M3 — Money.** Invoicing, Stripe and Square behind one gateway interface, client-portal payment. End of week 10.
5. **M4 — Calls.** Number forwarding, recording with per-location consent config, transcription, lead creation, automated follow-up on unanswered calls. End of week 13.
6. **M5 — Accounting and analytics.** QuickBooks Online sync after app review, per-job margin, bay and tech utilization. End of week 16.
7. **M6 — Beta cohort.** Onboard the BetaList waitlist shops, weekly review of call capture and quote conversion. End of week 19.

## Risks

- **Call recording consent is a legal gate, not a setting.** Two-party-consent jurisdictions require announced recording, and a shop that records without it carries the liability. Per-location consent configuration must exist before the call feature is enabled anywhere, and the announcement itself may reduce the warmth that made the phone the preferred channel.
- **QuickBooks app review sits outside the team's control.** Production sync cannot ship until Intuit approves, so the accounting promise that convinces the bookkeeper is on someone else's timeline.
- **AI quoting is only as good as the tenant's rate data.** A new shop has no rate table, so the first quotes are either the owner's manual numbers or a plausible fiction. Onboarding has to extract real material and labour costs before quoting is trustworthy, and that is friction at exactly the moment a trial is won or lost.
- **Two payment gateways doubles the reconciliation surface.** Stripe and Square disagree about refunds, disputes, partial captures and settlement timing. A single `PaymentGateway` interface hides the API differences but not the accounting ones, and QuickBooks sees whatever the differences produce.
- **Job-stage updates decay silently.** If techs stop moving jobs through stages, the job board, the inventory movements and the margin analytics all quietly become fiction while still rendering. Utilization figures need a staleness signal, not just a value.
- **Feature breadth versus a beta shop's patience.** The listing promises CRM, quoting, scheduling, job tracking, invoicing, inventory, client portals, call handling, two payment providers, QuickBooks sync and analytics. A shop adopts one workflow at a time; shipping all of it half-working is the failure mode, and the call-to-lead path is the piece with no incumbent worth keeping.
- **Unvalidated demand.** The source is the makers' own listing. No shop count, price or waitlist size is stated, so every milestone here is scoped against a described product rather than a measured need.
