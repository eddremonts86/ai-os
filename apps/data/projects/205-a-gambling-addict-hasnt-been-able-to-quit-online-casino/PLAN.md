---
id: "205"
slug: a-gambling-addict-hasnt-been-able-to-quit-online-casino
title: "A gambling addict hasn't been able to quit online casinos for years. All known methods have failed. Need a long-term accountability system that adapts to relapse."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: health
date: "2026-04-20"
tags: [Health, Habits, Mental Health]
country: USA
tech: [Swift, Kotlin, Firebase, Cloud Functions, Twilio, GPT-4-class]
---
# A gambling addict hasn't been able to quit online casinos for years. All known methods have failed. Need a long-term accountability system that adapts to relapse.

## Tech Stack

Swift and Kotlin for the mobile clients (cross-platform-via-dual-native for reliability). Firebase Auth and Cloud Functions for the orchestration. Twilio for SMS. Plaid for transaction monitoring. GPT-4-class for the chat-style check-in prompts. PagerDuty-style escalation handled by a small on-call rota.

## Architecture

Daily scheduler triggers SMS check-ins → user replies → state machine updates streak. Plaid webhook fires on transaction → flagged merchant path triggers a heightened prompt. Geofence fires when user enters a casino coordinate → SMS prompts user. Three strikes in a row trigger escalation to a designated contact via a human on-call agency.

## Milestones

M0 — SMS check-in loop with streak state. M1 — Plaid integration with gambling merchant flag list. M2 — late-night geofence. M3 — third-strike escalation with a small human on-call agency. M4 — pilot with 100 self-referred users in three US states.

## Risks

Risk of liability if the system fails to escalate and a user has a serious incident. Risk of being seen as a substitute for clinical treatment. Plaid data access is regulated and expensive. SMS-based flows must respect TCPA opt-in carefully.

## Data Model

## Integrations

Swift and Kotlin for the mobile clients (cross-platform-via-dual-native for reliability). Firebase Auth and Cloud Functions for the orchestration. Twilio for SMS. Plaid for transaction monitoring. GPT-4-class for the chat-style check-in prompts. PagerDuty-style escalation handled by a small on-call rota.
