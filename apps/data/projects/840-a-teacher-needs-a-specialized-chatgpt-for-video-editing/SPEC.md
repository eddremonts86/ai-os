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

## Problem

A US-based teacher describes needing a conversational assistant specialised for video editing. The poster names no specific editing software or course context. The underlying need is to ask, in plain English, for an edit ('cut the first 30 seconds', 'add captions from this transcript') and have it actually run on the user's video.

---

## Objective

Let a non-technical teacher drive video editing with plain-English instructions against their own video file.

## Target Users

K-12 and community-college teachers in the US who record lectures or class clips and need to publish trimmed, captioned versions without learning a desktop NLE.

## MVP Scope

A web app where the teacher uploads a video, chats with an assistant, and receives an edited MP4 plus an editable edit-decision-list describing what changed. Only basic operations in v1: trim, cut, captions from transcript, mute, simple title.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

Run on commodity hardware (a teacher's laptop). No pro NLE integrations. Privacy: student faces and voices are sensitive; no upload to a third-party model unless the user opts in.
