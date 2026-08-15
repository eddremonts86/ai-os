---
id: "480"
slug: i-built-a-youtube-transcript-api-for-developers-looking
title: I built a YouTube Transcript API for developers — looking for feedback
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/indiehackers/comments/1vgc5aa/i_built_a_youtube_transcript_api_for_developers/"
category: indiehackers
date: "2026-08-05"
tech: [Node.js (Fastify), TypeScript, PostgreSQL, Redis, Railway, RapidAPI marketplace]
---
# I built a YouTube Transcript API for developers — looking for feedback

## Problem

Source: [reddit.com/r/indiehackers/comments…](https://www.reddit.com/r/indiehackers/comments/1vgc5aa/i_built_a_youtube_transcript_api_for_developers/)

Original post:

> Hi everyone, I recently built a YouTube Transcript API for developers who need to extract transcripts, captions, metadata, and available subtitle languages from YouTube videos. The API supports: - Get transcript by YouTube video ID - Get video metadata - Check available transcript languages - Batch transcript requests - JSON responses - API key authentication - Rate limiting - Caching - OpenAPI documentation Example endpoint: GET /api/transcript?id=VIDEO_ID&lang=en Example use cases: - AI summarization apps - Chatbots - SEO/content tools - Podcast/video analysis - Subtitle workflows - Research tools - Educational apps I published it on RapidAPI here: https://rapidapi.com/dtech4099/api/youtube-transcript27 Documentation / website: https://youtube-transcript-api-production-0221.up.railway.app/docs I’m looking for feedback from developers: Is the API structure clear? Are there any endpoints you would expect but don’t see? Would batch transcript extraction be useful for your workflow? What pricing/limits would feel reasonable? Note: transcript availability depends on whether YouTube exposes captions for the requested video/language. Some private, restricted, or caption-disabled videos may not return transcripts. Thanks — happy to answer questions. submitted by /u/Significant_Sail_722 [link] [comments]

---

What this plan addresses: A YouTube Transcript API for developers: transcript + metadata + caption languages with rate limiting and caching.

## Objective

A YouTube Transcript API for developers with strict rate limiting, caching, and a clean OpenAPI surface. When I am building an AI or research tool that needs YouTube transcripts, I want a clean REST API with rate limiting and caching, so I do not scrape YouTube myself and get blocked.

## Target Users

- Developers building AI summarisation, chatbot, or podcast/video-analysis tools
- SEO / content teams extracting transcripts for indexing
- Researchers needing batch transcript access

## MVP Scope

- REST endpoint: GET /api/transcript?id=VIDEO_ID&lang=en
- Video metadata endpoint
- Available transcript languages endpoint
- Rate limiting + caching + API key auth
- OpenAPI documentation

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/indiehackers/comments/1vgc5aa/i_built_a_youtube_transcr` follows the constraints in `480-.../SPEC.md` and the chosen stack (Node.js (Fastify), TypeScript, PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body explicitly mentions the YouTube Transcript API features
- Plan keeps the same feature set
- Source did not name a price or SLA
