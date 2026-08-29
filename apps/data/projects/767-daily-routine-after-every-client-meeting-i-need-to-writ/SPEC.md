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

## Problem

After every client meeting, the poster (a UK-based professional whose firm uses Microsoft 365) has to write a structured report for colleagues. The existing corporate tools — described as Microsoft 365 in the title — are inefficient and slow for this routine task. The ProblemHunt capture is the title plus the country UK and the tags Productivity, Business and Other; nothing further — so the actor is the poster, the pain is the time lost in writing the same kind of structured summary after every meeting, and the missing piece is a tool that produces the structured report quickly and consistently.

The implied problem is a recurring post-meeting ritual, repeated daily, that each time requires the same structural decisions (what headings to use, how to attribute who-said-what, how to surface action items, how to phrase the next step) and the same editorial work (paraphrasing voice notes and email follow-ups into a coherent narrative). Microsoft 365 tools can hold the meeting (Teams) and hold the writing (Word, Outlook) but the bridge between a recorded meeting and a polished structured report is left to the user to build each time.

Beyond that title the source names no specific Microsoft product, no meeting length, no report template, no colleagues' consumption surface, and no profession. The plan reasons from the actor (a UK professional), the routine (every meeting produces a structured report), the current stack (Microsoft 365), and the missing piece (a tool that does not make them inefficient for this task), without inventing a persona, a meeting frequency, or a document template.

## Objective

Ship a tool that turns a client meeting into a structured report for colleagues in the time it currently takes to write a rough first draft manually. The tool reads the meeting transcript (or live-joins it), extracts structured sections under consistent headings, surfaces action items with attribution, and produces a report the user can drop into Microsoft 365 with minimal editing.

## Target Users

- A UK-based professional (consultant, account manager, lawyer, recruiter) who has a daily client meeting and writes a structured report to colleagues after each one.
- A team lead at a small UK firm whose colleagues consume a daily summary of each client call rather than the call itself.
- An individual contributor who wants the structured output to look consistent across days so colleagues do not have to relearn the report each morning.
- A new joiner who, on the first day, writes their first client-meeting report and needs the structural decisions pre-made.
- A user whose current routine is Microsoft 365 plus a notes app plus a manual Word draft, and who would replace the manual draft with a single structured step.

## MVP Scope

- A meeting ingest that accepts a Teams meeting recording URL, an audio file upload, or a pasted transcript, and produces a structured draft.
- A report template that the user configures once: section names (e.g. 'Summary', 'Discussion', 'Decisions', 'Action items', 'Next meeting'), in their own words.
- An extraction step that pulls action items with an attributed owner and a deadline if mentioned, surfaced in their own section.
- A speaker-attribution pass that ties each quoted or paraphrased line in the report to the meeting participant, sourced from the transcript.
- A live-meeting mode that joins a Teams meeting, transcribes it in near real time, and produces the structured report at the meeting's end.
- An export to Word (.docx) and to a Markdown body that drops cleanly into Outlook or Teams chat.
- A draft-edit step where the user can adjust any section before exporting, with the changes remembered for the next report.
- A report history that indexes past meetings so a future report can refer to the last one ('as discussed last Tuesday').
- A glossary of client-specific terms (project codenames, product names, organisation-specific jargon) so the extraction pass does not mis-transcribe them.
- A privacy surface that explains where the transcript is stored, who can see the report, and how long the source audio is retained.

## Design Direction

See DESIGN.md for this project's design tokens.

## Constraints

- The capture is one sentence plus the country UK and three tags; nothing beyond that is invented here, including specific Microsoft products in use, a profession, or a report template.
- Microsoft 365 is named as the existing inefficient stack, and Microsoft Graph access for meeting recordings requires tenant-level consent; the tool has to handle consent flows rather than pretend the integration is automatic.
- Live meeting transcription on Teams is itself subject to tenant settings and bot permissions; the tool has to detect what's allowed and fall back to an upload path.
- Speaker attribution depends on a transcript that identifies speakers; an upload without speaker labels is a degraded input and the tool has to say so.
- The structural consistency the post asks for depends on the template being configured once, not on the user editing the template per report.
- Compliance with UK data-handling rules (GDPR plus UK-specific sector rules) governs where the transcript and the report can be stored, and the architecture must respect per-tenant data residency rather than a single global default.
- The tool cannot become a surveillance tool: a client meeting participant must know the meeting is being processed.
