---
id: "652"
slug: bots-attacking-my-saas-app
title: Bots attacking my SaaS App
status: draft
source:
  name: manual
category: other
---
## Objective

A research-grade playbook of anti-bot systems that hold up against attackers who already passed email verification. The poster has been developing a SaaS app for a year, has been hit by bot attacks "a couple of times", added Resend-based email verification, and watched bots pass that wall. They are asking the community what other people use or build.

## Target Users

Indie SaaS developers running early-stage products (the poster's "slow and strong, one year" cadence fits this profile) who are getting their first serious bot traffic and need layered defences without hiring a security team.

## MVP Scope

- Threat-model template for indie SaaS: signup, login, form submission, content scraping.
- Layered defences: rate limiting, behavioural signals (mouse/keyboard cadence), device fingerprinting, CAPTCHA escalation, IP reputation.
- Decision flow for when to escalate (e.g. from invisible CAPTCHA to interactive challenge).
- Logging surface that distinguishes humans, sophisticated bots, and credential-stuffing attempts.
- A reference architecture the poster can apply without building every layer themselves.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The poster already has email verification and bots passed it — cannot rely on verification alone.
- Indie budget: cannot pay for enterprise bot-mitigation vendors; needs a stack that is mostly free or pay-as-you-go.
- False positives are a product risk: blocking real users is worse than letting some bots in.
