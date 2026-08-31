---
id: "3880"
slug: "an-anonymous-no-signup-alert-app-try-it-live-with-githu"
title: "An anonymous, no-signup alert app – try it live with GitHub incidents"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49498867"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Web push delivery, Anonymous group channels, No-PII identity model, Status-page incident polling, One-way broadcast platform, PWA client]
---
# An anonymous, no-signup alert app – try it live with GitHub incidents

## Tech Stack

- **Web push delivery:** alerts reach phones without an installed app.
- **Anonymous group channels:** membership and delivery work without accounts or PII.
- **No-PII identity model:** nothing personal is collected at signup because there is no signup.
- **Status-page incident polling:** the GitHub Incidents demo group is fed by polling GitHub's status page.
- **One-way broadcast platform:** the SaaS layer organizations use to send alerts.
- **PWA client:** the personal alert app users keep on their phone.

## Architecture

- **Broadcast layer:** SaaS platform where a sender composes a one-way alert and a group receives it.
- **Personal layer:** the no-signup alert app with personal alerts, reminders and anonymous group joins.
- **Integration layer:** demo groups are fed by live sources — GitHub's status page for incidents, Indie Hackers for case studies.
- **Delivery layer:** push delivery to phones without any app install or personal identifier.

## Milestones

1. **M0 — Broadcast platform.** A group can be created and one-way alerts delivered to its members.

2. **M1 — Anonymous personal app.** Personal alerts, reminders, and one-tap pause, resume and leave ship without PII.

3. **M2 — Live demo groups.** GitHub Incidents and Indie Hackers Case Studies run on production infrastructure.

4. **M3 — Sender onboarding.** Organizations run their own groups and replace app-download demands with alert links.

## Risks

- **Anti-abuse:** an anonymous broadcast channel is attractive to spammers; the author hates spam and the platform must defend against it.
- **Delivery without identifiers:** web push without accounts needs a durable device handshake that survives browser evictions.
- **Reliability expectations:** incident alerts are time-sensitive; a missed push during an outage is a visible failure.
- **Thin capture:** everything beyond the author's comment is unverified.
