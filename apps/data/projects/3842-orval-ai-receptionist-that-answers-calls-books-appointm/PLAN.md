---
id: "3842"
slug: orval-ai-receptionist-that-answers-calls-books-appointm
title: "Orval – AI receptionist that answers calls, books appointments, and captures leads"
status: enriched
source:
  name: BetaList
  url: "https://betalist.com/startups/orval?utm_campaign=startup-163518&utm_medium=atom&utm_source=newsfeed"
category: beta
date: "2026-08-29"
tags: [BetaList, Beta, Product]
tech: [Voice AI call answering, Telephony integration, Live calendar availability checks, SMS confirmation gateway, CRM and helpdesk routing with context, Subscription billing]
---
# Orval – AI receptionist that answers calls, books appointments, and captures leads

## Tech Stack

- **Voice AI call answering:** speech-to-text, dialogue policy and text-to-speech for live calls.
- **Telephony integration:** number provisioning, call control and media handling.
- **Live calendar availability checks:** read and write against Outlook and Calendly before booking.
- **SMS confirmation gateway:** booking confirmations by SMS after a successful slot.
- **CRM and helpdesk routing with context:** hand off to Freshdesk, Zendesk and Jobber with conversation context.
- **Subscription billing:** plans from £19.99/month with no setup fees or contracts.

## Architecture

- **Telephony layer:** inbound numbers, call control, audio streaming into the assistant.
- **Conversation engine:** natural-language dialog with intents for booking, questions and handoff.
- **Calendar adapter:** availability checks and writes across Outlook and Calendly.
- **Routing layer:** complex inquiries packaged with context into Freshdesk, Zendesk or Jobber.
- **Billing:** subscription management for the £19.99 entry plan.

## Milestones

1. **M0 — Answer and transfer.** Calls answered naturally; basic Q&A and team handoff work.
2. **M1 — Booking.** Live availability checks, appointment creation and SMS confirmations.
3. **M2 — Integrations.** Outlook, Calendly, Freshdesk, Zendesk and Jobber connected end to end.
4. **M3 — Billing.** Subscription from £19.99/month with no setup fees, matching the stated pricing.

## Risks

- **Call quality is the product:** telephony and speech-recognition failures surface directly to paying customers.
- **Booking integrity:** live availability checks must be race-free against human edits.
- **Cost per call versus the £19.99/month pricing** needs explicit modeling.
- **The named integrations are a fixed maintenance surface:** the capture names no expansion path.
