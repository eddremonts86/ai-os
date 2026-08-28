---
id: "840"
slug: a-teacher-needs-a-specialized-chatgpt-for-video-editing
title: A teacher needs a specialized «ChatGPT for video editing»
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: education
date: "2025-11-14"
tags: [Education, Other]
country: USA
tech: [React (Vite), TypeScript, ffmpeg.wasm, "\"Whisper (local", "whisper.cpp)\"", Static hosting]
---
# A teacher needs a specialized «ChatGPT for video editing»

## Tech Stack

React (Vite), TypeScript, ffmpeg.wasm, Whisper (local, whisper.cpp), Static hosting.

## Architecture

Browser-only pipeline. Video upload stays in the page. Whisper runs in a Web Worker. ffmpeg.wasm applies edits. Output is downloaded. No server.

## Milestones

- M1: video upload, transcript via Whisper, basic trim and cut
- M2: caption overlay burned into MP4
- M3: conversational edit-decision-list and re-edit

## Risks

Browser-side ffmpeg.wasm for privacy and zero-install. Local-first; the video never leaves the user's machine in v1.

- Browser-side ffmpeg.wasm struggles with hour-long 4K files; a teacher-class clip is usually fine but it is a real ceiling.
- Whisper transcripts of student voices raise privacy questions; make local-only the default.
