---
id: "747"
slug: a-gambling-addict-hasnt-been-able-to-quit-online-casino
title: "A gambling addict hasn't been able to quit online casinos for years. All known methods have failed. He has three hypotheses for solving his own problem. Willing to pay $15–30/month."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/psychology/dopyur7701-a-gambling-addict-hasnt-been-able-to-qui"
  captured: "2026-04-20"
category: psychology
date: "2026-04-20"
tags: [Psychology, Other]
country: USA
wtp:
  raw: $15–30/month
  currency: USD
  period: month
  min: 15
  max: 30
  mrrMid: 22.5
tech: [Mobile (iOS + Android via React Native or Flutter), bank/card linking via Plaid, AI relapse-detection on device screenshots or app usage, end-to-end encryption of all journal data]
---
# A gambling addict hasn't been able to quit online casinos for years. All known methods have failed. He has three hypotheses for solving his own problem. Willing to pay $15–30/month.

## Problem

A recovering online-casino gambler (David, USA) has been stuck for several years despite blockers, self-restrictions, a psychologist, and Gamblers Anonymous — every existing method fights the consequences, not the dopamine loop that fires in the moment of relapse. He has spent thousands chasing the same pattern and identifies three concrete hypotheses for a tool that would actually help: (1) a "safe casino simulator" with tiny cent-stakes and algorithms that taper dopamine (mandatory pauses, slowdowns, reduced brightness) — a nicotine-patch analogue for gambling; (2) an AI coach that intercepts the user at the moment of relapse (detecting a casino app launch or a screenshot of one) and instantly offers a breathing exercise, a balance check, or a one-tap call to a trusted person — a "panic button" for addiction; (3) a financial barrier that links bank cards and crypto wallets to a rule that any transfer to a casino requires confirmation from a friend or relative, blocking transactions that bypass it. He is willing to pay $15–30/month for any of the three and ready to test anonymously.

## Objective

Ship a mobile app that combines the three hypotheses into one product surface — a tapered-dose simulator, an AI "panic button" that intercepts relapse in the moment, and a friend-or-relative-confirmed financial barrier — so the user has the right tool at the right moment instead of choosing between blockers, therapy, and willpower, with end-to-end encrypted journal data and a $15–30/month subscription that the author has stated willingness to pay.

## Target Users

- Primary: online-casino gambling addicts in the US (and similar regulated markets) who have tried blockers, self-exclusion, and therapy without lasting effect and need an in-the-moment intervention.
- Secondary: families and partners of addicts who want to act as the trusted confirmer on financial barriers and panic-button calls.
- Tertiary: addiction clinicians and Gamblers Anonymous sponsors who would recommend a tool that handles the "moment of relapse" gap their existing methods leave open.

## MVP Scope

- **Tapered simulator:** a casino-style app with cent-stakes, mandatory pauses, brightness reduction, and visible "dose" tapering over weeks; lets the user satisfy the urge without escalating the spend.
- **AI panic button:** on-device screenshot / app-launch detector that fires when a casino app or site is opened and offers a one-tap breathing exercise, a balance check, or a call to a trusted person.
- **Friend-confirmed financial barrier:** link bank cards and crypto wallets via Plaid; any transfer matching a casino counterparty requires confirmation from a designated friend/relative, blocking transactions that bypass it.
- Anonymous signup (no email required), end-to-end encrypted journal, and a 30-day usage dashboard that shows triggers, interventions, and dollars blocked.
- Single-user subscription at $19/month (mid-point of the $15–30 author-stated range) with annual discount.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Must be anonymous-by-default — no email, no phone number at signup; the trusted-confirmer identity is the only shared identifier and it is held only by the friend.
- Panic-button detection must run on-device for screenshots (no cloud upload of screenshots); the journal and panic events are end-to-end encrypted with a key only the user holds.
- The financial barrier must not be bypassable by the user alone in a moment of weakness — friend confirmation is the whole point; if the user can revoke the friend unilaterally, the product is not the financial barrier the author asked for.
- Simulator must taper, not remove — the user is still "playing" at cent stakes, with mandatory pauses and brightness reduction; a hard-block simulator would defeat the nicotine-patch analogy and re-trigger the user.
