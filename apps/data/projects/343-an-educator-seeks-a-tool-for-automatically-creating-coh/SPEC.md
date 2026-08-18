---
id: "343"
slug: an-educator-seeks-a-tool-for-automatically-creating-coh
title: An educator seeks a tool for automatically creating coherent video lessons from multiple fragments
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/design/oy3gtd71l1-an-educator-seeks-a-tool-for-automatical"
category: design
date: "2025-10-29"
tags: [Design, Education, Media]
country: Russia
tech: [Next.js, FFmpeg + Whisper (transcription), OpenAI API (coherence scoring), Postgres, S3-compatible storage]
---
# An educator seeks a tool for automatically creating coherent video lessons from multiple fragments

## Problem

A Russian educator records each lesson in 6-12 short fragments because of microphone warm-up, slide-switch slip-ups, and the fact that recording 40 minutes straight is unrealistic in a small home setup. Stitching those fragments into a coherent 30-minute video for the student takes hours of manual editing: trimming, transitions, chapters, slide resync, and re-recording when an opening statement references the wrong fragment. The poster wants this stitch-and-polish step to disappear.

## Objective

Ship a video lesson assembler for educators that takes 6-12 short fragments, auto-transcribes, detects overlap, picks the best take per section, generates chapters and produces a publishable 20-40 minute lesson video with slides resynced - ready for the LMS in under 60 minutes of operator time.

## Target Users

- Russian independent educators publishing lessons on Stepik, Geekbrains, YouTube or their own LMS.
- Russian university lecturers recording asynchronous versions of in-person courses.
- Russian-language corporate trainers producing internal onboarding lessons.

## MVP Scope

- Fragment upload: drag-drop 6-12 short MP4/MOV files.
- Auto-transcription with Whisper (Russian + English).
- Overlap detection: same minute-by-minute content across multiple fragments collapses to the best take.
- Coherence scoring: per-fragment transitions and slide references are checked; low-coherence sections flagged.
- Auto-chapter generation: chapter titles from topic shifts in the transcript.
- Slide resync: slide deck uploaded once, slide images rotated to the moment of mention.
- Render and download: 1080p MP4, 20-40 minute target.
- No AI-generated voice cloning or content rewriting.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/design/oy3gtd71l1-an-educator-seeks-a-tool-for-automa` follows the constraints in `343-.../SPEC.md` and the chosen stack (Next.js, FFmpeg + Whisper (transcription), OpenAI API (coherence scoring)). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Russia.

For Russia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Render time under 60 minutes per 30-minute lesson on the operator's machine.
- Russian-language transcription must hit >= 90% WER parity with English.
- Operator can override any automated decision (take pick, chapter, slide moment) before render.
