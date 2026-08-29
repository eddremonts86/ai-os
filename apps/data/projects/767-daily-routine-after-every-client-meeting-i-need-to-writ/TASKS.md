---
id: "767"
slug: daily-routine-after-every-client-meeting-i-need-to-writ
title: "Daily routine: after every client meeting, I need to write a structured report for colleagues. Existing corporate tools (Microsoft 365) are inefficient and slow for this."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/productivity/goxzmndvc1-daily-routine-after-every-client-meeting"
category: productivity
date: "2026-02-10"
tags: [Productivity, Business, Other]
country: UK
tech: [SvelteKit, TypeScript, Postgres, Drizzle ORM, OpenAI Whisper + GPT-4o-mini, Tiptap, Coolify]
---
# Daily routine: after every client meeting, I need to write a structured report for colleagues. Existing corporate tools (Microsoft 365) are inefficient and slow for this.

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/767-daily-routine-after-every-client-meeting-i-need-to-writ/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Stand up SvelteKit with TypeScript, Postgres, Drizzle, and Coolify
- [ ] Build the Microsoft Graph OAuth flow scoped to meeting recordings with tenant-consent handling
- [ ] Implement the per-tenant template configuration (section names, order, per-section instructions)
- [ ] Add the three ingest paths: Teams recording URL, audio upload, and pasted transcript
- [ ] Wire Whisper transcription with speaker labels where the input supports them
- [ ] Build the extraction pipeline that takes the transcript plus the template and produces a structured draft
- [ ] Add a Tiptap editor that renders the draft with the template's headings
- [ ] Implement the export path to .docx for Word and to a Markdown body for Outlook and Teams chat
- [ ] Build the report-history index by date, attendee set, and section content for cross-meeting recall
- [ ] Implement the privacy surface: where the transcript lives, retention, and tenant-visible access controls
- [ ] Add the recording-announcement respected live-meeting bot that produces the report at meeting end
- [ ] Write an integration test that runs a recorded meeting end to end, generates a draft, exports to .docx, and links a new report to the right previous one

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
