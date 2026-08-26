---
id: "714"
slug: idea-validation-how-do-you-manage-decisions-on-slack
title: "[Idea validation] How do you manage decisions on slack ?"
status: draft
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vpxql5/idea_validation_how_do_you_manage_decisions_on/"
category: saas
date: "2026-08-16"
---
# [Idea validation] How do you manage decisions on slack ?

## Tech Stack

Not specified by the source. A minimal Slack-decision-log needs:

- Slack app (Bolt SDK or equivalent) with OAuth scopes for reading channel messages and posting responses.
- A durable store for captured decisions (Postgres + a `permalink` and `captured_at` column).
- A trigger surface: configurable channel allowlist + a slash command (e.g. `/decision-log add`) and/or a reaction-based trigger.
- A read surface: slash command to search by channel / date / keyword.

## Architecture

```
   message posted in Slack (configured channels)
              │
              ▼
   trigger fires (slash command, reaction, or pattern)
              │
              ▼
   app fetches the message permalink + metadata
              │
              ▼
   decision row written to durable store
   (permalink, author, channel, captured_at, body)
              │
              ▼
   user runs /decision-log search ...
              │
              ▼
   app returns matching decisions
```

## Milestones

- [ ] Week 1: Slack app scaffold, OAuth scopes settled, slash command `/decision-log add` working in a test workspace.
- [ ] Week 2: durable store + capture pipeline; reaction-based trigger (e.g. `:white_check_mark:`) working alongside the slash command.
- [ ] Week 3: `/decision-log search` slash command with channel / date / keyword filters.
- [ ] Week 4: install flow + pricing page; post the validation outcome to the original r/SaaS thread.

## Risks

- **Slack OAuth scope friction.** Reading messages from channels the app is not a member of requires elevated scopes (`channels:history`, `groups:history`) that Slack reviews carefully.
- **Compliance scope.** Capturing decisions creates a data store with its own retention rules (GDPR right-to-erasure, SOC 2 audit surface).
- **Decision-is-a-loaded-word.** What counts as a decision? A reaction-based trigger is permissive (anything anyone reacts to) but noisy; a slash command is precise but requires the team to remember to use it.
- **Retention clock.** If capture is async and Slack deletes the message before the app reads it, the capture fails; capture must be near-real-time.
