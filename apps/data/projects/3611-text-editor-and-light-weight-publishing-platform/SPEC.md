---
id: "3611"
slug: text-editor-and-light-weight-publishing-platform
title: Text editor and light-weight publishing platform
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49477954"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Web app (browser-based editor), real-time collaboration transport, multi-pane / multi-leaf view UI, public no-login demos, styling-vs-content separation]
---
# Text editor and light-weight publishing platform

## Problem

The post is a Show HN from the makers of Kraa, and the opening move is to describe the editor market as a two-pole failure: every existing editor is either too simple and minimal, or overly complex, distracting, and difficult to use. The product is positioned in the middle — "a complete feature set" that does not become a chore to look at, with a "strong separation of style from content" so the UI is not the content.

The "complete feature set" claim is anchored by two named differentiators. The first is a multi-leaf view, which the post frames as a unique way of working in the editor that the team has not seen elsewhere. The second is "real-real-time" chat — collaborative editing in real time, with the hyphenated phrasing used in the post. Both are presented as Kraa's own features, not as borrowed patterns.

The post also explains how the team proves the system actually works as a single content model. Four public demos, each rendering the same document model in a different shape, are linked without requiring an account: a real-real-time chat at `kraa.io/hackernews`, a blog article at `kraa.io/kraa/examples/echolibrary`, a long-form story at `kraa.io/kraa/examples/insidekick`, and a magazine at `kraa.io/weeklyinspiration`. The framing is that one document tree can become a chat, an article, a story, or a magazine, which is the load-bearing claim for "light-weight publishing."

This is also Kraa's second appearance on HackerNews. The team submitted it before, received actionable feedback, and is using this Show HN to launch what they call a major update. The feedback loop with the HN community is part of the product's development story.

## Objective

Ship Kraa as a browser-based text editor and publishing platform whose UI is uncluttered despite carrying a complete feature set, whose content is strictly separated from style, and whose multi-leaf view and real-real-time chat are first-class. The four demo surfaces (chat, blog article, long-form story, magazine) must render from the same underlying document model so the publishing claim is provable, not aspirational.

The update being announced on HN should reflect the actionable feedback from the previous submission. The product stays no-login for the demos: anyone can click a demo URL and see the system work without making an account.

## Target Users

- Writers who want a complete-featured editor without the chrome and modal stacks of mainstream tools.
- Publishers and bloggers who want one source of truth that can render as different shapes (article, story, magazine) without rewriting content.
- Small teams that need real-real-time collaborative editing inside a clutter-free surface.
- Readers and evaluators who land on the four public demos without signing up and need to understand Kraa's claims in under a minute.

## MVP Scope

- A single document model that renders as chat, blog article, long-form story, and magazine (the four demo URLs the post lists).
- A multi-leaf view: working across more than one pane / leaf inside the editor, exposed as a named Kraa feature.
- Real-real-time collaborative editing in chat (the `kraa.io/hackernews` demo is the proof point).
- Strong separation of style from content so the UI chrome never bleeds into the document tree.
- A clean, clutter-free default UI: the post's framing rule, not a styling choice the team is willing to compromise.
- Four public demo URLs that work without an account, each showcasing a different rendering of the document model.
- An update narrative that visibly responds to the actionable feedback from the prior HN submission.

## Design Direction

Design direction for the MVP at `https://news.ycombinator.com/item?id=49477954` follows the constraints in `3611-.../SPEC.md` and the chosen stack (web app, real-time collaboration transport, multi-leaf view UI, public no-login demos, style-vs-content separation). The visual language is the product's own claim, taken literally: clutter-free, complete-featured, with the four demos as the proof.

**Color** — neutral surface for the editor and the demos; one accent for the active leaf; one muted accent for collaborative cursors and presence indicators. No gradients.

**Type** — one text family for body, one display family for rendered headlines, one mono family for code and metadata. Type scale is small so the editor stays calm.

**Density** — generous for prose surfaces (chat, story, magazine); tight for the multi-leaf view, where the value is being able to see several panes at once.

**Motion** — minimal; only real-time presence and the leaf-switch transition animate. Everything else is static.

## Constraints

- The UI must stay clutter-free; this is the framing the post opens with and the design rule the MVP is built around.
- Style and content must be strictly separated; the document tree must not carry UI chrome.
- The multi-leaf view and real-real-time chat are the two named differentiators and must be present in the MVP, not deferred.
- The four public demos must work without an account; "no login required" is part of the product's marketing surface and its evaluation surface.
- The update announced in this HN post must visibly reflect the prior submission's actionable feedback, or the credibility of the HN-loop development model collapses.
