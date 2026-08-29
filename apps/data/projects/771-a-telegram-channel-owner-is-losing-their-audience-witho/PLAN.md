---
id: "771"
slug: a-telegram-channel-owner-is-losing-their-audience-witho
title: A Telegram channel owner is losing their audience without understanding the reasons for unsubscriptions. There is no simple tool for automatically collecting feedback from departed subscribers.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/media/dkr31xnko1-a-telegram-channel-owner-is-losing-their"
category: media
date: "2026-01-29"
tags: [Media, AI, Other]
country: Georgia
tech: [TypeScript, Node.js, Fastify, grammY (Telegram bot framework), PostgreSQL, Plausible]
---
# A Telegram channel owner is losing their audience without understanding the reasons for unsubscriptions. There is no simple tool for automatically collecting feedback from departed subscribers.

## Tech Stack

- **TypeScript** for the bot service, because the feedback state machine and the per-channel configuration are easier to keep typed across the bot's run paths.
- **Node.js with Fastify** for the HTTP service that handles the bot's webhook and the dashboard's API, chosen because Fastify is small, fast, and a natural fit for a webhook-driven service.
- **grammY** as the Telegram bot framework, because grammY's middleware composition matches the trigger pipeline (chat-member update event → record leaver → send feedback message → collect response) cleanly.
- **PostgreSQL** as the primary store, because the leaver record, the response record, and the channel configuration are all relational and need a queryable audit trail.
- **Redis** is not introduced because the workload (event-driven DM per leaver) does not benefit from a separate cache; the Postgres record is the source of truth.
- **Plausible** for product analytics, because the source names no analytics preference and a meta-only analytics vendor avoids ingesting personal data on either side of the feedback loop.

The architecture surfaces only Node.js + Fastify + grammY + Postgres as the durable surface area. Telegram's Bot API rate limits govern the bot's sending schedule; everything else is a single small service.

## Architecture

The channel owner adds the bot to a Telegram channel as an admin and runs a one-time /setup command that records the channel id, the owner's preferred feedback message, the owner's preferred canned reasons, and the languages the leaver can be addressed in. The bot starts watching for chat-member update events: when a user's status moves from member to 'left' (or 'kicked'), the bot records the event with the user id, the channel id, and the timestamp, and queues a personalised feedback DM.

The DM is sent within minutes, not seconds. A burst of unsubscriptions (a viral controversy, a content pivot) would otherwise produce a flurry of DMs in a small window, and the leaver experience is what determines whether the leaver replies. The DM contains a single short question (default: 'why did you leave?') and three or four canned reasons plus an 'other' option the leaver can type into. The leaver can reply with a category number or free text; the bot handles both. A follow-up question (the leaver's optional second reply) is supported but never assumed, because one round of feedback is the cost the post names as 'simple'.

The response collector parses the leaver's reply into a category when possible and a free-text reason when not, and stores both against the leaver id and the channel. The dashboard aggregates by category, by week, and by channel, and a weekly summary is delivered to the channel owner's Telegram inbox rather than only to the web dashboard. The owner can pause the trigger per channel without removing the bot, because noisy channels can have legitimate reasons for being paused (a temporary dispute, a moderation topic).

Personal-data handling is sized for the trust the tool is asking for. The leaver has just chosen to leave; the platform holds the leaver id and the response text only for as long as the channel's retention setting allows, and the leaver can opt out of further contact after the first message. The retention setting defaults to 90 days, which covers the typical feedback cycle without indefinite storage of a leaver's data.

## Milestones

1. **M1 — Bot install and /setup** — Owner adds bot to a channel; /setup records channel id, default feedback message, canned reasons, and languages.
2. **M2 — Leave-event ingest** — Listen for chat-member update events; record leaver id, channel id, and timestamp; queue a feedback DM.
3. **M3 — Feedback DM and reply** — Personalised DM with one short question and a small set of canned reasons plus free-text reply support.
4. **M4 — Dashboard and aggregations** — Aggregation by reason, by week, by channel; per-channel pause toggle.
5. **M5 — Weekly summary** — Telegram-inbox weekly summary with top reason and a count of departures.
6. **M6 — Multi-language** — Default feedback message and canned reasons in multiple languages, addressed in the leaver's Telegram language when detectable.
7. **M7 — Opt-out and retention** — Leaver opt-out after first message, with persistence across leavers with the same id; configurable retention; CSV export of anonymised responses.

## Risks

- **Telegram anti-spam trigger** — a feedback bot that triggers Telegram's anti-spam filter is a public-relations failure for the channel owner, and the rate of DMs has to be schedule-paced, not instant burst.
- **Leaver hostility** — a leaver who just left is in a different emotional state than a customer; a DM that lands as harassment is the worst possible outcome, and the opt-out surface must be immediate.
- **Multi-language coverage** — the tags and the country imply Russian, Georgian, Armenian, English; canned reasons in only one language lock the platform out of multilingual channels.
- **Response rate decay** — feedback fatigue is real; if every leaver gets the same canned question, response rate drops; per-channel variation is a real product feature.
- **Retention compliance** — GDPR and Georgian personal-data law both govern retention of leaver data; a default of 90 days is a workable choice but has to be visible to the channel owner.
- **Telegram API change** — Telegram changes its Bot API and its chat-member event semantics; the integration must have tests that catch silent breakage.
- **Free-tier abuse** — a free tier is the lowest-friction entry point but also the easiest to abuse for spammy channels; per-channel verification is part of the free-tier path.
- **Dashboard lock-in for one bot** — a small team running multiple channels should not have to maintain multiple bots; one bot per account is the design constraint.
