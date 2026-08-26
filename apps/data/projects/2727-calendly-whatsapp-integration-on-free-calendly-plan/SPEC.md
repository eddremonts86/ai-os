---
id: "2727"
slug: calendly-whatsapp-integration-on-free-calendly-plan
title: Calendly WhatsApp integration on free Calendly plan
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49430145"
category: ask-hn
date: "2026-08-25"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Calendly WhatsApp integration on free Calendly plan

## Problem

I built an unofficial Whatsapp message (only outbound) service for indie sellers/marketers who have small scale (daily under 50 messages to send) & might not have bandwidth to spend time onboarding to official Whatsapp Business API.A friend pointed me to his Calendly calendar & asked me if I can build an integration with Calendly where his prospect gets a Whatsapp message when they book a meeting with him. I was like - this can easily be done with Zapier. Only after building the entire Zap, I figured that Calendly expose webhooks ONLY in their paid plans.Since I had committed to my friend, I built a complete offline integration. The integration relied on capturing javascript event where the calendar is embedded. Most folks embed Calendly on their own website so this looked like a plausible work around for lack of webhook exposure from Calendly.I also had to build an oAuth app as the Calendly event payload contained only inviteeUrl & then I had to query the user's Calendly to get phone number from the Calendly form answers. Lastly, I decided to store the user's access & refresh token on the server, the same zero knowledge encryption way (by using user's auth token as encryption key), that I do for storing their Whatsapp creds. This ensure that not only the unauthorized breach of the server gets attacker access to user's confidential data, but even I as server owner can't access any of those details.I am thinking of publishing official integration on Zapier, Make & n8n, for more people to use the automation to send Whatsapp message for free, but. I am not sure if there is going to be a favourable closure as the app violates Whatsapp ToS, although it is NOT illegal to use. I also feel with all the safety checks (using Residential IP to create connection to Whatsapp), the app does a decent job to prevent banning your number unless you go overboard with sending & a lot of people start to report your messages.

---

## Objective

_Not written yet — `ai-os plans enrich` fills this section._

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## MVP Scope

_Not written yet — `ai-os plans enrich` fills this section._

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

_Not written yet — `ai-os plans enrich` fills this section._
