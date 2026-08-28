---
id: "714"
slug: idea-validation-how-do-you-manage-decisions-on-slack
title: "[Idea validation] How do you manage decisions on slack ?"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vpxql5/idea_validation_how_do_you_manage_decisions_on/"
category: saas
date: "2026-08-16"
---
# [Idea validation] How do you manage decisions on slack ?

## Problem
 Hii guys, I work at a large conglomerate and we use slack a lot! All of our decisions seem to be on slack but they get deleted in like 3 months. How do you guys maintain these decisions in one place so you can refer to it later (protect you a** from people flipping around and saying they never decided this). Copying and pasting in a common google doc adds an extra step. Do you think a slack app that does this for you could add value? submitted by /u/CoupleEven3580 [link] [comments]

---

## Objective

Capture the founder's idea-validation probe: a Slack app that captures decisions made in Slack before Slack's 3-month message-retention window deletes them, in a single place teams can refer back to. The post frames the pain explicitly (decisions get deleted, copying to a Google Doc adds friction, people flip-flop on what was decided) and asks the community whether a Slack-native app would solve it.

## Target Users

- Slack-first teams at large organisations where decisions live in chat and survive only as long as the message-retention window.
- Operations / PMO leads who need an audit trail of decisions without forcing teams to switch tools.

## MVP Scope

- A Slack app that watches designated channels (or message patterns like "decision:" / reactions like ✅) and copies decision messages to a durable store before Slack deletes them.
- A read surface (Slack command, slash command, or sidebar app) to retrieve past decisions by channel, date, or keyword.
- A simple way to mark a message as a decision (a reaction, a slash command, or a configurable trigger).
- The post frames the value explicitly around audit (so people cannot later claim they never decided something) — the MVP should make every capture linkable and time-stamped.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Slack-native only — the founder explicitly contrasts against "copying to a Google Doc" because that adds an extra step.
- Must work inside Slack's 3-month retention window; the capture must happen before Slack deletes the message.
- Audit-trail framing: every captured decision needs a stable permalink + timestamp.
