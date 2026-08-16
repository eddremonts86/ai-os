---
id: "656"
slug: how-much-manual-crm-cleanup-is-normal
title: How much manual CRM cleanup is normal?
status: draft
source:
  name: manual
category: other
---
#

## Tech Stack

Next.js, Gmail API (read metadata, not bodies), Google Calendar API, a lightweight contact store, an LLM for the meeting-summary prompt, Postgres.

## Architecture

Google Calendar webhook → meeting-end event → LLM prompt for one-line summary → user confirms → contact upsert + thread attach. Daily digest surfaces "you missed this" gaps.

## Milestones

- [ ] Google OAuth + Calendar event hook
- [ ] Meeting-end summary prompt
- [ ] Contact create / update
- [ ] Email thread auto-attach (by participant match)
- [ ] Daily "you missed this" digest
- [ ] Pricing page (if monetising)

## Risks

- Google API scope + ToS.
- LLM mis-classification of which email belongs to which contact.
- Founder-market pricing sensitivity: this category is hard to monetise because the buyer is busy.
