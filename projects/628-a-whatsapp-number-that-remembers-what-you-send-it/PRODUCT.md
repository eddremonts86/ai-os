---
id: "628"
slug: a-whatsapp-number-that-remembers-what-you-send-it
title: A WhatsApp number that remembers what you send it
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1voz93y/a_whatsapp_number_that_remembers_what_you_send_it/"
  captured: "2026-08-15"
category: saas
date: "2026-08-15"
tags: [b2c, whatsapp, memory, open-source, retrieval]
scores:
  money: 3.5
  learn: 5
  fun: 6
tech: [NestJS, TypeScript, MongoDB Atlas, Atlas Vector Search, Hugging Face Inference API, WhatsApp Cloud API, Vercel, Jest]
---
# A WhatsApp number that remembers what you send it

> Product brief — auto-generated then authored.

## Value Proposition

**One-liner:** A WhatsApp number that remembers everything you send it and answers back when you ask, with no app, no folders, and no tags.

The post frames Keepr against three failure modes the user already lives with:

- Captures go into a chat the user never reopens. Keepr replaces "search your scrollback" with a plain-English question.
- Notes die because nothing on the receiving end knows how to file them. Keepr skips the filing step entirely.
- Voice memos and forwarded content are abandoned because they do not type themselves. Keepr stores what the user sent, even when it is not text.

The wedge is that Keepr lives where the user already is (WhatsApp), not at the end of a download.

## Target Users

- **"Send-to-self" power users** who already use a personal WhatsApp chat as a scratchpad and have lost a meaningful piece of content inside it before. They know the failure mode personally; Keepr is the fix they wanted.
- **Half-thought users** who capture 2am ideas, voice memos, forwarded quotes, and photos of receipts and never organise them. They will not adopt an app that asks them to tag.
- **Privacy-sensitive users** for whom "your message leaves your phone" is a deal-breaker. The README's "media never stored, phone numbers never logged" stance is a feature for this audience, not a footnote.

## Jobs To Be Done

1. **Functional — capture without friction.** Drop anything into the chat and trust it will be there later, whether it is text, a link, a forwarded quote, a document, an image, a video, or a voice note.
2. **Functional — recall in natural language.** Ask "what was that article about X I sent last week?" and get the right thing back, scoped to the user, not to the whole system.
3. **Emotional — replace the guilt of unread saves.** The "send to self" pile stops being a graveyard. The user feels lighter because the chat is no longer a deferred task list.
4. **Social — keep a clean chat.** No folders, no tags, no coloured stars. Friends who see the chat see a normal conversation with one contact.

## Success Metrics

- **Activation.** Time from first inbound message to first `Saved ✓` reply. The README's intended behaviour is that the very first message the user sends produces a confirmation, so this metric is a sanity check on the webhook + classifier path.
- **Recall precision.** Of the messages Keepr surfaces in response to a recall query, how many would the user accept as the right answer. Per-user, evaluated against the user's own history.
- **Recall coverage.** Of memories the user would have wanted to find, how many the vector search actually surfaces. The README's mandatory `user_id` pre-filter is there to keep recall *personal*, not to make it broad.
- **Recall latency.** Wall time from the user's recall message to the first quoted reply. The README pins Vercel function `maxDuration: 60`; whatever sits under that budget is the operating ceiling.
- **Storage growth per user.** Memories added per user per week. A flat or zero curve means the user has stopped capturing; a spike followed by recall silence means the inbox is filling without being used.

The post and the repo do not name a revenue number, a paid tier, or a customer count. None of those are stated, so none are invented here.

## Pricing & Monetization

Not stated. The Reddit post calls Keepr "open source" and links to a public GitHub repo, but the repo's `LICENSE` file reads "All rights reserved. This repository and its contents are made publicly viewable for portfolio and demonstration purposes only." There is no price, no tier, no paid path, and no mention of one. `wtp` is left absent from frontmatter.

## Competitive Landscape

The post and the repo do not name competitors. The "save for later" category is broad (read-later apps, note apps, personal CRM tools, second-brain apps), and within WhatsApp itself the closest behaviours are "send to self" chats, broadcast lists, and starred messages. None of these are positioned in the post, so none are named here.

What the README does say, and what differentiates the shipped product, is that the entire system is a chat conversation with no organising layer. That is the wedge the post makes explicit; it is also the claim that would have to be defended against any tool that *does* add folders and tags.

## Risks & Open Questions

- **License vs "open source."** The post says open source; the repo's license is "All rights reserved" with a portfolio/demonstration clause. Until the author clarifies the license, "open source" should be read as "the code is visible," not "the code is reusable."
- **Voice note coverage gap.** The README states voice notes are not transcribed. Without accompanying text, the saved context is the minimal placeholder `Voice note, no additional context given`. A user who captures mostly voice memos will get a thin memory.
- **Media is captured, not stored.** The README says media IDs may appear in inbound payloads but are never persisted or fetched. A user who expects to see their photos and videos later will be surprised; the product explicitly does not promise this.
- **WTP unknown.** No pricing signal in the post. Multi-user + WhatsApp Business API + Hugging Face + Atlas all have unit costs that scale with usage, so any future monetisation model has to reckon with that.
- **Per-user scoping is load-bearing.** The README emphasises that every read starts from the sender's WhatsApp ID and that there is no unscoped recall method. Any future feature that exposes a shared view across users (e.g., a team plan) has to re-derive the scoping rule instead of inheriting it.
- **Webhook delivery noise.** WhatsApp delivery-status webhook events contain no `messages` array and are acknowledged without entering the memory flow. If the service ever treats those as real messages it will create phantom saves.