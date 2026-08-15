---
id: "493"
slug: i-built-a-random-video-chat-website-looking-for-people-
title: I built a random video chat website — looking for people to test it
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SideProject/comments/1vo06ju/i_built_a_random_video_chat_website_looking_for/"
category: sideproject
date: "2026-08-14"
tech: [Next.js, TypeScript, WebRTC, PostgreSQL, Resend, Vercel]
---
# I built a random video chat website — looking for people to test it

## Problem

Source: [reddit.com/r/SideProject/comments/…]([reddit.com/r/SideProject/comments/…]([reddit.com/r/SideProject/comments/…]([reddit.com/r/SideProject/comments/…]([reddit.com/r/SideProject/comments/…](https://www.reddit.com/r/SideProject/comments/1vo06ju/i_built_a_random_video_chat_website_looking_for/)))))

Original post:

> Hey everyone! 👋 I’ve been working on a small random video chat project and I’m looking for a few people to test it. 🔗 Website: https://randomtalk-app.talkverse.workers.dev/ It’s currently focused on 1-to-1 random video chatting. I’d really appreciate it if a few people could try it on both mobile and desktop and tell me what works and what doesn’t. I’m especially looking for feedback on: 🎥 Video/audio quality 🎤 Microphone and camera controls 🔄 Finding/connecting with another person 📱 Mobile experience 🐛 Any bugs or errors 💡 Features you think I should add Please be honest — negative feedback is totally welcome. I’m trying to improve it, not just get compliments. 😄 submitted by /u/Main-Brain-5642 [link] [comments]

---

What this plan addresses: A random video chat website for people who want low-pressure practice conversations.

## Objective

A random video chat website with optional topic prompts and a report/block flow for safety, no account required. When I want a low-pressure video conversation with a stranger, I want a tool that pairs me with a random person with optional topic prompts, so I can practice social or language skills without scheduling.

## Target Users

- People practicing a new language
- Introverts who want low-stakes social practice
- Remote workers who want casual conversation

## MVP Scope

- Random 1:1 video chat via WebRTC
- Optional topic prompts (e.g. "travel")
- Report / block flow for safety
- No account required

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/SideProject/comments/1vo06ju/i_built_a_random_video_cha` follows the constraints in `493-.../SPEC.md` and the chosen stack (Next.js, TypeScript, WebRTC). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body describes a random video chat website seeking testers
- Plan keeps the random + no-account framing
- Source did not name a niche, region, or moderation model
