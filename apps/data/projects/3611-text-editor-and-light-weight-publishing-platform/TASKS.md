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

## Phase 0: Scaffold

- [x] Capture problem from HackerNews + write SPEC.md skeleton
- [ ] Pick the rendering stack for the browser editor (web app per the demo URLs)
- [ ] Pick the real-time collaboration transport and define its guarantees (presence, cursors, document ops)
- [ ] Document tree schema: content-only representation; renderer contract that excludes chrome from the tree
- [ ] Workspace / multi-leaf model: how panes bind to leaves, how the same tree opens in more than one leaf
- [ ] Plan the four demo URLs as a single rendering pipeline with four surfaces, not four forks
- [ ] Triage the actionable feedback from the prior HN submission into a visible list the update will close

## Phase 1: Core

- [ ] Document model + style/content split enforced across the codebase (lint or test that catches chrome in the tree)
- [ ] Multi-leaf view: workspace UI, pane binding, leaf switching, exposed as a named Kraa feature
- [ ] Real-real-time collaboration transport: chat demo at `kraa.io/hackernews` loads without login and stays in sync between two browsers
- [ ] Blog article renderer: `kraa.io/kraa/examples/echolibrary` renders the same document tree as a blog article, no login
- [ ] Long-form story renderer: `kraa.io/kraa/examples/insidekick` renders the same tree as a long-form story, no login
- [ ] Magazine renderer: `kraa.io/weeklyinspiration` renders the same tree as a magazine, no login
- [ ] Clutter-free default UI: the design rule that the post opens with, applied as a code-level constraint, not just a styling choice
- [ ] Public no-login path hardened: rate limits and abuse controls on the demo URLs so the system is not free hosting for unrelated content
- [ ] Visible changelog entry per item of prior-submission feedback, so the "we used your feedback" claim is checkable

## Phase 2: Deploy

- [ ] Public Kraa site with the four demo URLs as the entry surface
- [ ] Demo videos / GIFs for the multi-leaf view and the real-real-time chat, the two named differentiators
- [ ] Show HN post live with a clear note on which prior-submission feedback items were addressed
- [ ] Documentation page per renderer (chat / blog / story / magazine) showing the same source tree and the four outputs side-by-side
- [ ] Post-mortem at week 4: which feedback items closed, which new ones arrived, and the next round's priorities
