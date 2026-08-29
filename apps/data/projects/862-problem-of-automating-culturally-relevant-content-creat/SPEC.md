---
id: "862"
slug: problem-of-automating-culturally-relevant-content-creat
title: Problem of automating culturally relevant content creation
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/media/pxet2490m1-problem-of-automating-culturally-relevan"
category: media
date: "2025-10-30"
tags: [Media, Marketing, AI, Business, Other]
country: Jamaica
tech: [Node.js, Hono, Bun, SQLite (better-sqlite3), FFmpeg, Whisper, Llama 3.1]
---
# Problem of automating culturally relevant content creation

## Problem

The capture for this plan carries only the title and the country (Jamaica) — the original ProblemHunt post named no specific industry, no quoted budget and no named competitor. The title, taken at face value, says the pain is the manual work of producing content that is culturally relevant to a Jamaican audience, and that automating it without losing that relevance is the open problem.

For a Jamaican audience the language surface is the central difficulty. Standard Jamaican English sits next to Jamaican Patois (also called Jamaican Creole), which is an English-based creole with its own grammar, its own prosody and its own vocabulary, and a piece of content that misses the register lands as either flat or as parody depending on the audience. Audio and video content adds a second difficulty: voice-over in Patois requires either a native speaker or a TTS system that has been trained or fine-tuned on Patois data, neither of which is a default option in mainstream generation tools. The capture does not name a specific platform, a specific audience size or a specific content format, so the MVP is scoped to the underlying gap: the recurring work of producing culturally relevant text and short-form audio/video content for a Jamaican audience without losing the register.

What is named by the title alone is the gap: the founder or marketer who needs to ship a steady stream of culturally relevant content does not have a tool that handles the language register and the short-form audio output together, so they end up rewriting outputs by hand or paying for native review on every piece. The MVP is scoped to that one gap and nothing more.

## Objective

Ship a web service that takes a content brief in English and produces culturally relevant text and short-form audio content tuned for a Jamaican audience, with a register toggle between Standard Jamaican English and Jamaican Patois, an audio render in the chosen register, and a side-by-side editor so a human reviewer can correct the output before it goes out. The MVP does not publish to social platforms and does not claim to replace a native reviewer.

## Target Users

- Small-business marketers in Jamaica producing social posts, short videos and radio-style audio ads on a weekly cadence and needing culturally relevant copy at volume.
- Diaspora creators targeting a Jamaican audience from the UK, Canada or the US who need help keeping the register consistent without living in the dialect daily.
- Tourism boards and cultural organisations producing short-form content about Jamaica for both domestic and export audiences, where the local register matters as much as the information.
- Independent podcasters and short-form video producers whose scripts need to read as Patois in places and as Standard Jamaican English in others, depending on the segment.
- Community organisations and NGOs running campaigns that need culturally relevant outreach in Patois, with audio for radio or WhatsApp distribution.

## MVP Scope

- Brief form that captures topic, audience, register (Standard Jamaican English or Patois), format (text, short video script, audio script), target length and any named references that must appear.
- Text generation in both registers with a visible confidence indicator per paragraph so the reviewer knows where to read closely.
- Short-form audio render in the chosen register, with the choice between a curated voice library of consenting Jamaican speakers and a TTS pipeline that has been fine-tuned on Patois data.
- Side-by-side editor showing the brief, the generated text and the generated audio waveform, with edit history so the human reviewer's changes are visible across versions.
- Reference library of culturally relevant touchpoints (names, places, festivals, idioms) that the generator is allowed to draw on, with a way for the reviewer to add or remove items per brief.
- A clear line that the output requires human review before publication, surfaced at every export step.
- Per-account content history that can be searched by topic and reused as a style seed for future briefs.
- Voice talent consent and rate handling for the curated voice library, with the library's consent state visible to the user at selection time.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The MVP does not publish to any social platform; export is a file download, and any cross-posting is the user's job.
- Patois generation is biased toward conservative outputs that a human reviewer can edit forward, rather than creative outputs that read as parody when they are wrong.
- No copyrighted lyrics, no recognisable voice clones of public figures, and no audio render that has not been reviewed by a human before export.
- The curated voice library only contains audio from speakers who have given informed consent to be used in generated content, with consent state shown to the user.
- Cultural references are drawn from a maintained library, not invented by the model, to reduce the rate of fabricated place names or events.
- The MVP is scoped to Jamaican English and Jamaican Patois; other Caribbean creoles are out of scope until the Jamaican register is solid.
- The product does not claim to replace a native reviewer and is explicit about that on every export.
