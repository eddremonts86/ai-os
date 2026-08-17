---
id: "2559"
slug: always-responsive-ui-for-a-coding-agent
title: Always responsive UI for a coding agent
status: draft
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49320073"
category: show-hn
date: "2026-08-16"
tags: [Show HN, Product, Problem]
---
# Always responsive UI for a coding agent

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ In my limited personal experience, I find the UI of coding agents, or rather their clients, unsatisfying for the following reasons:- They tend to have poor performance characteristics- They make it hard to actually read or copy from the session history- They make it hard to paste large contents, and to undo that paste.- They lack a sane default for sandboxingIt appears to me that those UI try to re-use patterns from chat UIs, but fail to address the key difference: large and constantly changing content.For the last couple of months I've been using pi.dev, and while I appreciate the minimalist design of the harness, the default TUI on Mac OS is frustrating: it hogs the CPU as the session gets large, history keeps shifting under your nose making reading or copying from it hard, and pasting into the prompt input is unresponsive.Those problems compound: I once tried to copy a single line from the session history, while being scrolled away from the bottom, at which point the content on screen shifted, and then when I pasted in the input, the whole thing just took forever without giving intermediary feedback, because the copy had been applied not to my selection but to some large chunk of history (due to the content shift).Then the sandboxing: if you search for solutions, you find things that either are limited, like only sandboxing the bash tool use (while pi is meant to be extended with arbitrary code), or seem more complicated than is necessary by using container software.So on a Friday, I filed https://github.com/earendil-works/pi/issues/7730, and then over the weekend ended-up writing my own Mac OS client to headless pi, with built-in sandboxing. It's been a week now, and it is what I am using, and improving, on a daily basis: https://github.com/gterzian/uni03C0Some highlights:- In the main rendering path: only process that part of content (whether it is session history or pasted content) that you really need.- Never block the UI.- Keep the UI stable, and leave it entirely idle when not following the streaming content at the bottom.- Everything can be aborted, including a large incoming paste.- Mac OS native sandboxing applied by default (unfortunately using a deprecated API, but one that for now is still what major browsers rely on); configurable by the end user.So this is a fast, resource efficient, always responsive, and sandboxed by default (without needing a container), Mac OS client to headless pi. Please let me know what you think.

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## Jobs To Be Done

_Not written yet — `ai-os plans enrich` fills this section._

## Success Metrics

_Not written yet — `ai-os plans enrich` fills this section._

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_Not written yet — `ai-os plans enrich` fills this section._

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [ProblemHunt](https://news.ycombinator.com/item?id=49320073) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
