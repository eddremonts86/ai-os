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

## Phase 0: Scaffold

- [x] Capture the BetaList listing and its stated feature surface
- [ ] Laravel app with per-shop tenancy and Postgres schema for customer, vehicle, quote, job, bay, tech, inventory
- [ ] Tenant rate tables for film, materials and labour
- [ ] Write DESIGN.md (job board, quote builder, bay schedule, client portal)
- [ ] Responsive shell with bay-usable touch targets on mobile
- [ ] Provision Twilio, Stripe, Square and QuickBooks sandbox credentials

## Phase 1: Core

- [ ] CRM: customer with multiple vehicles, vehicle-level job history
- [ ] Quote builder: service type, vehicle, coverage area, priced from the tenant's own rates
- [ ] AI-assisted quote line items proposed for owner review, never auto-issued
- [ ] Bays and techs as bookable resources with working hours, cure time occupying capacity
- [ ] Scheduling: allocate an approved quote to a bay and a tech, with double-booking prevented at the resource level
- [ ] Job board with intake, prep, install, cure, QC and ready stages; one-handed stage updates on a phone
- [ ] Inventory movements written on stage transitions so material cost accrues to the job
- [ ] Invoicing from a completed job, with a `PaymentGateway` interface over Stripe and Square
- [ ] Client portal: quote approval, job status, invoice payment
- [ ] Call routing from the shop's existing number via Twilio, with per-location recording-consent configuration
- [ ] Call recording, transcription and automatic lead creation, including for unanswered calls
- [ ] Automated follow-up queued on unanswered calls, attributed when it produces a booking
- [ ] QuickBooks Online OAuth per tenant, idempotent invoice and payment sync with stored QBO ids
- [ ] Analytics: margin per job and per service type, bay and tech utilization, with a staleness signal when job stages stop moving
- [ ] End-to-end test: unanswered call becomes a lead, lead becomes a quote, quote books a bay, job completes, invoice pays via Square, entry lands in QuickBooks

## Phase 2: Deploy

- [ ] Submit and clear the QuickBooks Online app review
- [ ] Move Stripe and Square to live mode
- [ ] Onboard the BetaList waitlist shops as the beta cohort
- [ ] Verify in production
