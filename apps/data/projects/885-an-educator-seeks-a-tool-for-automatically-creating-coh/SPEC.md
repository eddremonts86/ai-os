---
id: "885"
slug: an-educator-seeks-a-tool-for-automatically-creating-coh
title: An educator seeks a tool for automatically creating coherent video lessons from multiple fragments
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/design/oy3gtd71l1-an-educator-seeks-a-tool-for-automatical"
  captured: "2025-10-24"
category: design
date: "2025-10-24"
tags: [Design, Education, Media]
country: Russia
wtp:
  raw: "1500 RUB/month ($18–20)"
  currency: USD
  min: 18
  max: 20
  period: month
  mrrMid: 19
tech: [FFmpeg (video stitching), Whisper (speech-to-text), LLM-based semantic ordering, Next.js (educator review UI), S3-compatible object storage]
---
# An educator seeks a tool for automatically creating coherent video lessons from multiple fragments

## Problem

The poster is an educator who creates video lessons by combining 4–5 separate clips into a single finished lesson. The clips are typically recorded at different times (and sometimes on different days), so the lesson only comes together at the editing stage. Manual editing takes several hours per lesson, which is time the poster cannot afford — they are already sacrificing sleep to finish the work. The poster has tried CapCut's auto-edit feature and reports the result is unusable: the program cuts randomly, disrupts the logical sequence, and does not preserve semantic connections between lesson parts, so the assembled video is incoherent as a teaching artefact. The poster will pay 1,500 RUB per month ($18–20) for a tool that intelligently combines the fragments into a coherent lesson while preserving the lesson's logical structure and flow.

## Objective

Ship an educator-facing video editor that takes 4–5 (or more) recorded fragments, transcribes each, infers the lesson's logical outline from the transcripts and from the educator's stated topic and order, proposes a stitched lesson, and renders the final video — with a per-segment review step so the educator can drag clips into a different order or trim a clip before the final render. The MVP must produce a lesson that the educator would actually publish, not an auto-edit that disrupts the lesson's structure the way CapCut did.

## Target Users

- **Primary:** independent educators and online-course creators who record lessons in fragments (different sessions, different days) and currently spend hours stitching them in a generic video editor.
- **Secondary:** small online schools and tutoring services whose instructors produce lessons the same way and want a per-instructor workspace with shared review.
- **Tertiary:** corporate L&D teams producing short internal training videos from existing SME recordings, where a faster edit cycle means more lessons shipped per quarter.

## MVP Scope

- A web app where the educator uploads 4–5 (or more) video fragments (mp4 / mov) and enters the lesson's stated topic and any target order ("part 1, part 2, ...").
- A transcription pipeline (Whisper or equivalent) that produces a timestamped transcript per clip.
- A semantic-ordering layer that infers the lesson's outline from the transcripts (LLM-based): given the stated topic and the per-clip transcripts, propose an ordered list of clip references that form a coherent lesson.
- A review UI that shows the proposed order, lets the educator drag clips into a different order, trim a clip with a simple in/out handle, and approve.
- A render pipeline (FFmpeg) that stitches the ordered, trimmed clips into a single mp4 with consistent resolution and audio levels.
- A rendered-lesson history per educator, with the lesson's title, the original clips, the final transcript, and the rendered mp4 available for download.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Poster's budget is 1,500 RUB/month ($18–20). The product must be self-funding at that price, which means per-lesson compute (transcription + LLM ordering + render) must stay in the low single-digit dollars per lesson.
- The MVP must not ship an auto-edit that "cuts randomly" — the failure mode the poster explicitly called out. The semantic-ordering layer must expose its proposed order before any rendering happens, and the educator must be able to override it.
- The output must be a real mp4 the educator can publish on any platform they already use; the tool is not a hosting surface.
- Privacy: an educator's lesson recordings may contain unpublished course material. Upload, transcription, and rendered outputs must remain private to the educator's workspace; no third-party training on this content without explicit opt-in.
- No silent auto-publish: the rendered mp4 is downloaded by the educator, not posted anywhere by the tool.
- The transcription and ordering step must finish in a reasonable time per lesson (target: under 15 minutes for a 30-minute combined lesson on a typical upload), or the time-saved promise is erased.
