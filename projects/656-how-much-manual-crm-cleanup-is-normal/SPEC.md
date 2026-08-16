---
id: "656"
slug: how-much-manual-crm-cleanup-is-normal
title: How much manual CRM cleanup is normal?
status: draft
source:
  name: manual
category: other
---
## Objective

A tool that reduces the manual CRM cleanup that early-stage founders do after every call — logging notes, creating contacts, attaching emails, scheduling follow-ups. The poster reports spending "almost as long cleaning up the CRM afterwards as I did in the meetings" and is trying to figure out whether this is normal.

## Target Users

Early-stage founders doing sales themselves (the poster's profile fits) using Google Calendar + email as their CRM substrate. The pain is the gap between the call ending and the CRM reflecting what happened on the call.

## MVP Scope

- Calendar event → post-call summary prompt.
- One-click create / update contact from the meeting.
- Email thread auto-attach to the right contact.
- Follow-up reminder based on what was said in the call.
- A single dashboard that surfaces "things I forgot to log" rather than the full CRM.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The poster is not asking for a new CRM; they use Google Calendar + email. Any solution has to layer on top, not replace.
- "I don't need anything fancy" — the bar is relief, not a new system to learn.
- Single founder; cannot onboard a 20-step workflow.
