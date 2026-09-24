# SPEC.md — Stage Captions – streaming browser audio into live event captions

## Problem

Originally, I am .NET software engineer working corporate job with microservices on RMQ and REST APIs. But I always had the desire to experiment with some different tech on the side.<p>After my friend shared his plans of helping facilitate medical conference which was bilingual and some of the audience members might feel missed out due to English not being their first language, I thought it&#x27;s a nice opportunity to create a tool for it. It was an opportunity to work with audio, ASR, accessibility and websockets. It&#x27;s something new for me.<p>Another inspiration was Formula 1 captions which I noticed during their broadcasts, which are generated in real-time. After digging a bit into underlying technology I thought to create something similar for event organisers and AV teams. Not as a replacement for human interpreters, but as a more accessible alternative to quite costly hardware options.<p>That&#x27;s how Stage Captions was built. Audio comes from browser, gets streamed via WSS to backend, goes through processing pipeline and then captions are streamed back to viewers. Those captions can be displayed on venue TVs, opened on attendees devices by scanning QR code or incorporated into a broadcast using OBS for example.<p>Obviously, ASR and MT models are third party and not created by me, but there were still some fun challenges like scaling websockets (it was trickier than just adding one more container on load), audio processing (finding optimal chunking and buffering approach) and obviously stabilization algorithms for partial transcription &#x2F; translation results.<p>As a developer I was happy to experiment with tech stack which is different from my daily work. And as a human it felt right to build something which can make in-person events easier to follow for non-native speakers and deaf&#x2F;hard of hearing attendees.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49709975)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-15T09:41:55Z

---

## Objective

Build a solution that addresses this problem clearly and at scale.

---

## Target Users

1. **[Primary user]** — the main user this serves
2. **[Secondary user]** — other relevant users

## MVP Scope

- Core functionality
- Leave out anything beyond the MVP

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Keep the MVP simple
- No unnecessary external dependencies
