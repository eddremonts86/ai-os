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

## Problem

A Telegram channel owner in Georgia is losing their audience without understanding why people are unsubscribing, and there is no simple tool for automatically collecting feedback from departed subscribers. The ProblemHunt capture is the title plus the country Georgia and the tags Media, AI and Other; nothing further — so the actor is a Telegram channel owner, the pain is silent audience loss, the missing piece is a simple tool for collecting feedback from the people who left.

The implied problem is feedback asymmetry. A channel owner can measure audience size today and again next week, and the difference is a number; what the number cannot tell them is which subscribers left and why. Without the why, the owner is tuning by guess: posting more, posting less, posting at different times, none of which is informed by the lived reason the people who left had. The simple tool the post asks for is one that closes the feedback loop by reaching out to unsubscribed users and asking a short, structured question.

Beyond that title the source names no channel size, no niche, no unsubscription rate, no language for the subscribers, and no periodicity. The plan reasons from the actor (Telegram channel owner in Georgia), the silent loss (audience shrinking without a why), and the missing piece (a simple automated feedback tool for departed subscribers), without inventing a subscriber count, a content niche, or an unsubscription rate.

## Objective

Ship a Telegram channel feedback tool that automatically sends a short, structured message to a subscriber who just left a channel, collects the response, and aggregates the reasons into a view the channel owner can act on. The tool is opt-in for the owner, low-friction for the leaver, and produces aggregations a single owner can scan in minutes.

## Target Users

- A Telegram channel owner in Georgia whose audience is shrinking without a visible reason and who needs a feedback loop with the people who left.
- A channel owner in any post-Soviet or multilingual market whose subscriber base includes Russian, Georgian, Armenian, and English readers, and whose current unsubscription message is a one-line 'bye'.
- A solo channel owner whose total weekly work is content plus a few hours of community maintenance and who would not run a multi-step feedback system themselves.
- A small team running multiple Telegram channels that want a single dashboard of unsubscription reasons across channels.
- A channel owner who has tried a manual DM-outreach to leavers and found it unscalable beyond a few dozen conversations.

## MVP Scope

- A Telegram bot that the channel owner adds to the channel as an admin, configured once with a short feedback message in the owner's language.
- A trigger on Telegram's chat-member update event (a subscriber leaves the channel) that records the leaver's id, the channel id, and the timestamp.
- A personalised DM to the leaver within minutes of leaving, asking a single short question the channel owner has chosen (with optional follow-up questions).
- A response collector that captures the leaver's reply, anonymises it for the channel owner's view, and stores the question-and-answer pair.
- A reason field with a short set of canned reasons plus an open-text fallback, because the leaver's first reaction is a category, not a paragraph.
- A dashboard that aggregates responses by reason, by week, and by channel, so the owner can scan and act.
- A per-channel trigger toggle so the bot can be paused on a noisy channel without removing the bot entirely.
- A explicit opt-out for the leaver after the first message, so the tool respects the leaver's preference not to be contacted again.
- A weekly summary delivered to the channel owner's Telegram inbox, summarising the week's departures and the top reason.
- A export of anonymised responses as CSV for the channel owner who wants to dig into the raw data.

## Design Direction

See DESIGN.md for this project's design tokens.

## Constraints

- The capture is one sentence plus the country Georgia and three tags; nothing beyond that is invented here, including channel size, niche, language of the subscriber base, or unsubscription rate.
- Telegram's Terms of Service and Bot API rate limits constrain unsolicited DMs; the bot has to defer to Telegram's rules and rate limits rather than send messages aggressively.
- The leaver has just chosen to leave; a feedback DM that feels coercive is the opposite of what the channel owner wants long-term, because the leaver's block list is the worst feedback of all.
- The leaver's first interaction is one short question, not a survey; anything longer than one round produces almost no responses and burns the leaver's patience.
- The Telegram bot requires the owner's explicit consent for it to act on the channel; the bot cannot attach itself silently to a channel and start sending DMs.
- Multi-language subscriber bases (the tags and the country imply this) require the feedback message and the canned reasons to be available in multiple languages without forcing the owner to author them all.
- Personal data handling for leavers (their Telegram id and the response text) is regulated under GDPR for EU residents and under Georgia's personal-data law for residents there; the architecture has to support retention controls.
