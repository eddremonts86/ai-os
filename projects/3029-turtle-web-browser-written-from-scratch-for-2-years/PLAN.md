---
id: "3029"
slug: turtle-web-browser-written-from-scratch-for-2-years
title: Turtle – Web Browser written from scratch for 2 years
status: enriched
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49340294"
category: show-hn
date: "2026-08-18"
tags: [Show HN, Product, Problem]
---
# Turtle – Web Browser written from scratch for 2 years

## Tech Stack

The post does not name a tech stack. The download is hosted at code.intellios.ai/cwbrowser, which is the only technical surface the source mentions. The author explicitly chose to build from scratch, so the project does not depend on Chromium, Gecko, or WebKit, but the source does not say what language, rendering engine, or JS runtime it uses. The plan does not invent one.

## Architecture

The post does not describe an architecture. It does not name subsystems (parser, layout engine, JS engine, network stack), does not list a process model, and does not state which standards it implements. The plan does not invent one.

## Milestones

The post does not list milestones. What it does state, in order:

1. The author posted solo browser projects on HN "a few weeks ago" (relative to the post date).
2. They received many emails asking for a download link.
3. They released a pre-alpha download at code.intellios.ai/cwbrowser.

Anything beyond the pre-alpha — feature parity, stability, official releases — is not in the post.

## Risks

- **Pre-alpha reliability:** the post itself warns of bugs, crashes, and broken renders. The plan does not promise otherwise.
- **Solo maintenance:** a two-year single-author codebase without a stated roadmap or co-maintainers is at risk if the author steps away. The post does not address it.
- **Standards coverage:** the post does not state HTML5/CSS/JS conformance targets. Modern web is broad, and partial coverage is a known failure mode.
