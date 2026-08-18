---
id: "242"
slug: the-monthly-headache-of-being-remote-tech-support-for-e
title: The monthly headache of being remote tech support for elderly relatives who constantly need help with the same computer problems
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/ai/u9prt4av11-the-monthly-headache-of-being-remote-tec"
category: ai
date: "2026-01-20"
tags: [Productivity, Other]
country: Serbia
tech: [Next.js 14, TypeScript, Tauri (Rust), OpenAI GPT-4o-mini, WebRTC, PostgreSQL, Cloudflare TURN]
---
# The monthly headache of being remote tech support for elderly relatives who constantly need help with the same computer problems

## Problem

An adult in Serbia (and many like them worldwide) spends hours each month as the de facto remote tech support for elderly parents who call with the same recurring computer problems — browser extensions hijacked, password resets, printer offline, scam pop-ups. The poster calls it a "monthly headache" and wants a tool that intercepts before the call.

## Objective

Ship a remote-assistance tool that lets the elderly relative click one button on their desktop to start a screen-share session, paired with a knowledge base of common senior-tech-support issues and an AI triage step that surfaces the most likely cause before the human helper joins.

## Target Users

Adult children of elderly computer users (Serbia is the poster's location; tool is geography-neutral). Elderly computer users themselves, who are not technical but can click one icon. Small-team admins who support non-technical colleagues.

## MVP Scope

A lightweight always-running companion app (Tauri-based, low resource use) on the elderly user's desktop with one large "Call my helper" button. Web app for the helper with screen-share, remote control, and an AI-assisted triage panel. Knowledge base seeded with the 30 most common senior-tech-support issues.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/ai/u9prt4av11-the-monthly-headache-of-being-remote-te` follows the constraints in `242-.../SPEC.md` and the chosen stack (Next.js 14, TypeScript, Tauri (Rust)). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Serbia.

For Serbia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Must work on Windows 10/11 and macOS. Screen-share and remote control must be reliable on slow home connections in Serbia (4-10 Mbps typical). No silent remote-control — every action the helper takes must be visible to the elderly user. No password capture in MVP.
