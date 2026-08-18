---
id: "202"
slug: need-a-oneclick-solution-that-replaces-a-lecturers-voic
title: "Need a one-click solution that replaces a lecturer's voice with clear English directly inside YouTube lectures."
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/"
category: ai
date: "2026-04-27"
tags: [AI, Education, Video]
country: Hungary
tech: [Python, Whisper, Coqui TTS, FFmpeg, FastAPI, yt-dlp]
---
# Need a one-click solution that replaces a lecturer's voice with clear English directly inside YouTube lectures.

## Problem

A Hungarian lecturer posts video lectures on YouTube in Hungarian. Commenters and students around the world have asked for an English version. The lecturer is not bilingual, and subtitles are not enough for technical subjects where the spoken explanation matters. Hiring a translator and re-recording is far too expensive for a single-channel educator.

What the lecturer wants is a button that produces an English version of the same lecture, with the same slides, the same timing where possible, and a voice that sounds like a real lecturer rather than a navigation speaker. None of the existing tools (YouTube's own dubbing beta, Rask.ai, HeyGen) give a single click that works on an existing YouTube URL without a separate editor session.

## Objective

A web service that takes a YouTube URL of a Hungarian lecture, transcribes it, translates it to English, regenerates the audio with a natural-sounding English voice, and re-muxes the result back into the original video with the original slides intact. One click, no editing software needed.

## Target Users

Solo YouTube educators in non-English-speaking countries whose audience has asked for English versions. Also useful for technical bloggers who record video.

## MVP Scope

Input: YouTube URL. Pipeline: yt-dlp download, Whisper transcription, GPT-class translation, Coqui TTS resynthesis, FFmpeg re-mux. Output: a new video file or a re-uploaded second track. Lecturer can pick from 3 English voice profiles. Lip-sync is not in v1.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/` follows the constraints in `202-.../SPEC.md` and the chosen stack (Python, Whisper, Coqui TTS). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Hungary.

For Hungary, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Must not store the source video longer than 24 hours. The English translation must keep technical terminology accurate. The output video must keep the original slides and screen captures. Must respect the original lecturer's request to remove the dub if they object.
