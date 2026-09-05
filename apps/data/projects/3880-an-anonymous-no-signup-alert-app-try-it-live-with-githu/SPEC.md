---
id: "3880"
slug: an-anonymous-no-signup-alert-app-try-it-live-with-githu
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

## Problem

The capture is a URL-only Show HN post, but the author's own comment on the thread carries the pitch. Harold, founder of The Notifier, built it after a few problems: he gets so many scam texts that he now hates promotional texts even from organizations he likes; events and organizations ask him to download their app mainly so they can push notifications to his phone, when the information he needs is already on their website; and when his sons played sports, the coach's group-chat messages about gym changes got lost in the noise, or went out by email which players rarely check. The Notifier is two things: a SaaS platform that broadcasts alerts and messages to groups of people, and a personal alert app with no signup, no phone number and no PII, where a user can create personal alerts and reminders or join a group anonymously and pause, resume or leave with one tap. The demo page (thenotifier.app/developers/see-it-work) runs two live groups on the same infrastructure customers use: GitHub Incidents, alerting when GitHub's status page reports an incident, and Indie Hackers Case Studies.

## Objective

Build The Notifier into the one-way, no-signup alert channel the author describes: organizations broadcast updates to groups without asking for an app download or personal data, and individuals get only the alerts they chose. The MVP is the working SaaS platform plus the anonymous personal app, proven by two live demo groups (GitHub Incidents and Indie Hackers Case Studies) running on production infrastructure.

## Target Users

- Event organizers, coaches and community leaders who need one-way updates to reach people without group-chat noise or email.
- Privacy-conscious individuals who want alerts and reminders without handing over a phone number or creating an account.
- Teams that monitor a status page and want incident notifications without building their own polling.

## MVP Scope

- SaaS broadcast platform: create a group and send one-way alerts to all members.
- Personal alert app: no signup, no phone number, no PII; create personal alerts or reminders.
- Anonymous group membership with one-tap pause, resume and leave.
- Live demo groups: GitHub Incidents (status-page incident alerts) and Indie Hackers Case Studies.

## Constraints

- No PII by design: no signup, no phone number — the anonymity model is the product boundary.
- One-way communication only; replies are deliberately out of scope.
- The demo groups must run on the same infrastructure as paying customers, per the author.
- Pricing is not stated anywhere in the capture.

## Design Direction

See `DESIGN.md` for this project's design tokens.
