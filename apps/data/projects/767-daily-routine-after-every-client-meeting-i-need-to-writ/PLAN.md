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

## Tech Stack

- **SvelteKit** for the web app, chosen because the report editor is a structured-document surface that benefits from Svelte's granular reactivity over a full SPA rewrite on every keystroke.
- **TypeScript** end-to-end, because the report schema and the action-item extraction are easier to keep typed across front-end and back-end.
- **Postgres** as the primary store, because the report-history index is queryable on meeting date, attendee, and section content rather than just append-only.
- **Drizzle ORM** as the data layer, because the schema includes user-configured templates and per-tenant settings that have to be versioned.
- **OpenAI Whisper + GPT-4o-mini** for the transcription and extraction pipeline, chosen because Whisper handles the noise profile of a typical Teams call and a small instruction-tuned model is sufficient for the structured sections.
- **Tiptap** as the structured-document editor for the report draft, so the user edits a real document and the export to .docx is a direct formatting conversion.
- **Coolify** for the host, because the source capture is one short paragraph with no preference on hosting and Coolify is the framework's existing self-hostable option for this kind of small service.

## Architecture

The user connects Microsoft 365 through a Microsoft Graph OAuth flow that scopes to meetings and recordings with tenant-level consent where required. The user configures a report template once: section names, order, and any per-section instructions ('action items must have an owner and a deadline'). The template is stored per tenant and the editor binds to it for every report so structural drift is impossible by construction.

The meeting ingest accepts three paths: a Teams meeting recording URL (the platform reads the recording through Graph), an uploaded audio file, or a pasted transcript. The path is recorded so a draft can be cross-referenced to its source. Whisper produces the transcript with speaker labels when the input supports them, and a model call takes the transcript plus the template and produces the structured draft. The extraction step is instruction-prompted against the user's template, so the headings are the ones the user defined, and the action-items pass produces an owner-attributed list with a deadline field that is null if the meeting did not mention one.

The draft lands in a Tiptap editor with the template's sections rendered as headings. The user edits any section; the editor's content is the report. On export, the platform converts the Tiptap document to .docx for Word and to a Markdown body for Outlook and Teams chat, with the same heading structure. Every past report is indexed by meeting date, attendee set, and section content, so a new report can refer to a previous one by phrase ('as discussed last Tuesday') and the cross-reference resolves to the right document.

The privacy surface is visible. The settings panel shows where the transcript is stored, who can see the report in the user's tenant, how long the source audio is retained, and what the live-meeting mode announces. A live-meeting attendee who has not consented to transcription is the platform's own warning, not the user's, because the legal exposure is around the recording announcement policy, not around who runs the tool.

## Milestones

1. **M1 — Tenant and template** — Microsoft Graph OAuth flow scoped to meetings; per-tenant template configuration with section names and per-section instructions.
2. **M2 — Ingest paths** — Recording URL, audio upload, and pasted-transcript ingest paths each producing a single source-attributed transcript.
3. **M3 — Structured draft generation** — Whisper transcription, GPT-4o-mini extraction against the template, and a structured draft in the Tiptap editor.
4. **M4 — Editor and export** — Tiptap editor, .docx export for Word, and Markdown export for Outlook and Teams chat.
5. **M5 — History and recall** — Indexed report history with cross-meeting references that resolve to the correct older report.
6. **M6 — Live meeting mode** — Bot that joins a Teams meeting, transcribes live, and produces the report at meeting end with a recording announcement respected.
7. **M7 — Privacy and residency** — Per-tenant data residency settings, retention configuration, and a tenant-visible privacy surface.

## Risks

- **Tenant consent friction** — Microsoft Graph consent for meeting recordings is a per-tenant admin action; a user without admin rights is a stuck user, and the workflow has to surface that without losing the user.
- **Live-meeting announcement** — joining a client meeting as a transcription bot must respect the recording announcement, otherwise the platform creates a surveillance path for the user's own client.
- **Action-item mis-attribution** — extraction that misattributes an action item to the wrong participant is the kind of report defect that loses trust and is hard to spot in a draft.
- **Template drift** — if the template can be edited per report, structural consistency collapses; the architecture has to make template edits a per-tenant setting change, not a per-report override.
- **Cross-meeting recall accuracy** — past-meeting indexing has to point to the right document; a confident-sounding cross-reference to a wrong older report is worse than no cross-reference.
- **GDPR and UK-specific data rules** — transcripts are personal data of third parties (meeting attendees); data residency, retention, and access controls have to be configurable per tenant.
- **Whisper latency** — live transcription has a latency floor that affects whether the report can be ready at meeting end; degradation to a non-live path has to be the user-visible fallback.
- **Tiptap .docx fidelity** — Word's heading and list rendering is opinionated; a document that exports cleanly to Markdown but loses structure in Word is a usability failure for the user's actual destination.
