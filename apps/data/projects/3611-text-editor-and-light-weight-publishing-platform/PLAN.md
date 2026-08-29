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

## Tech Stack

The post does not name a stack; the choice below is the one the product surface implies.

- **Web app** — a browser-based editor and publisher; the demos are public URLs that load without login, which puts the editor in a web app rather than a desktop shell.
- **Real-time collaboration transport** — needed for the real-real-time chat demo at `kraa.io/hackernews`; the MVP needs a transport that can carry presence, cursors, and document updates across clients without visible lag.
- **Multi-leaf view UI** — the editor's main canvas must support more than one pane per document, exposed as a named Kraa feature.
- **Style-vs-content separation** — strict architectural rule: the document tree carries content only; chrome and rendering live in a separate layer.
- **Public no-login demo path** — four URLs (chat, blog article, long-form story, magazine) that load and render without an account.

## Architecture

A document tree is the single source of truth. Each rendering shape — chat, blog article, long-form story, magazine — is a renderer that consumes the same tree and outputs its own surface. The MVP's load-bearing claim is that all four demos the post links are the same document model under different renderers, which is why the demo URLs (chat, echolibrary, insidekick, weeklyinspiration) are first-class in the architecture.

The editor runs in the browser, so the multi-leaf view is a client-side composition: a single workspace holds several panes, each pane bound to a leaf, and the same document tree can be opened in more than one leaf at once. Style and content are split so a leaf's chrome (chat bubbles, blog margins, magazine layout) cannot write back into the document tree; renderers read the tree and apply their own presentation.

Real-real-time collaboration is layered over the same document model. A transport carries operations between clients; the chat demo is the simplest proof that two browsers in the same URL stay synchronized without a manual save step. Presence and cursors ride on the same transport.

The four demo URLs are public, no-login entry points to the same rendering pipeline. The architectural bet is that one document model can serve all four shapes without a per-shape fork.

## Milestones

1. **M0 — Document model + style/content split.** A tree representation that carries content only, with a renderer contract that keeps chrome out of the tree.
2. **M1 — Multi-leaf view.** A workspace that can hold several panes bound to the same or different leaves, exposed as a Kraa feature in the UI.
3. **M2 — Real-real-time chat demo.** `kraa.io/hackernews` loads without an account; two browsers in the same URL stay synchronized through the collaboration transport.
4. **M3 — Three additional renderers.** Blog article (`kraa.io/kraa/examples/echolibrary`), long-form story (`kraa.io/kraa/examples/insidekick`), and magazine (`kraa.io/weeklyinspiration`) all render the same document tree in their respective shapes, no login required.
5. **M4 — Major update rollout.** The visible changes that respond to the actionable feedback from the prior HN submission are landed, documented, and surfaced in the new Show HN post.

## Risks

- **Style-vs-content separation as an architectural rule** — every new renderer, leaf type, or chrome element is a temptation to leak UI into the document tree; without a strict contract, the "complete feature set" framing starts to require chrome in places it does not belong.
- **Real-real-time quality** — collaboration that drops cursors, silently resolves conflicts, or has visible lag undermines the differentiator; the MVP must define what "real-real-time" guarantees.
- **Four demos as one model** — the chat, blog, story, and magazine renderers have very different chrome; if the team has to fork the document tree per shape, the "light-weight publishing" claim weakens.
- **No-login demos as a security surface** — public URLs that render the same model an authenticated user would see are an attractive target; the MVP must define what is reachable from a no-login URL.
- **HN-feedback loop credibility** — the team has framed the prior feedback as actionable; if this update does not visibly close those loops, the credibility of the development model (and the "major update" framing) drops on the next submission.
