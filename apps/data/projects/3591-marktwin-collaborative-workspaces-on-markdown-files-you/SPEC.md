---
id: "3591"
slug: marktwin-collaborative-workspaces-on-markdown-files-you
title: Marktwin – collaborative workspaces on Markdown files you own
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49479555"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [TypeScript, React, Yjs, libp2p, GitHub OAuth, SQLite]
---
# Marktwin – collaborative workspaces on Markdown files you own

## Problem

The author's stated motivation is personal: they wanted a place to edit their GitHub Markdown files with their team, and the alternatives they found had a three-way tradeoff the author found unacceptable. Store notes somewhere else — meaning the context the team needs lives outside their existing repo. Have uncomfortable collaboration — meaning latency, lockups, or modes that do not feel right. Pass through someone else's server — meaning content has to leave the team's own hosting to be edited.

Marktwin is the author's answer to that tradeoff. It is a space to edit the files already in the user's repository, shared peer-to-peer. The mode the post names is Markdown writing plus a canvas plus drawing plus discussion, with a review step before syncing the changes back to GitHub. The author is explicit about what the product is for: keeping the context that people and agents use inside files the user controls, in the places where the user needs it, while making it easier to work together.

The product is free for now, with the author's stated hope that it stays that way. There is no built-in AI in Marktwin, and that is deliberate — the author calls this out as a feature, not an absence.

## Objective

Ship Marktwin as a free, peer-to-peer collaborative workspace that edits the Markdown files a user already has in their GitHub repository, without the content passing through a server the author controls. The first deployment must support Markdown editing, a canvas, drawing, inline discussion, and a review step that produces a clean diff back to the originating repo. No AI features are in scope; that is a stated decision, not a roadmap gap.

## Target Users

- Engineering teams that already keep team context (notes, RFCs, runbooks, design docs) inside their GitHub repos and want a way to edit them together without leaving that host.
- Indie developers and small teams that need a collaborative notes surface but refuse to put their team's context in someone else's SaaS.
- Agent-using developers and AI-OS-style workflows who want their notes to stay inside their repo because their agents read those same files.
- People who tried Notion / Google Docs / similar and want a peer-to-peer alternative that does not require moving the content.

## MVP Scope

- Peer-to-peer editing session over a shared workspace bound to a single GitHub repo, using a CRDT layer so concurrent edits converge without locks.
- GitHub OAuth sign-in so the user can prove they own (or have access to) the repo the workspace binds to.
- Markdown editor with the four modes the author names: write Markdown, use a canvas, draw, and discuss inline.
- Review step before syncing back: a diff view of all pending changes against the repo's HEAD, with accept/reject per change.
- Push-back-to-GitHub flow that opens a PR or commits directly per the user's choice and never writes without an explicit user action.
- A "free" posture with no paywalls and no metering in the MVP UI — everything on marktwin.com stays free, as stated.
- A "no built-in AI" stance made visible in the UI: no AI suggestions, no AI-generated text, no AI summarisation baked into any of the four modes.
- Out of scope for MVP: any AI feature of any kind (the author is explicit), any pricing page or paid tier, support for repos outside GitHub.

## Design Direction

Design direction for the MVP at `https://news.ycombinator.com/item?id=49479555` follows the constraints in `3591-.../SPEC.md` and the chosen stack (TypeScript, React, Yjs, libp2p, GitHub OAuth, SQLite). The visual surface is small: a workspace, four editing modes (Markdown, canvas, draw, discuss), and a review-and-push step. The author is also explicit that AI is deliberately absent, so the visual language should not borrow from the AI-assistant aesthetic — no inline completions, no suggested-reply chrome.

For show-hn category, the defaults lean toward a calm, document-first surface: the editor is the primary canvas, the modes sit in a single sidebar, and the review step is its own dedicated view.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for the review-and-push CTA (the most important user action), one muted accent for unsynced changes. No gradients.

**Type** — one display family for document titles, one text family for body, one mono for code fences. The author's content lives in Markdown, so the type system serves the document first.

**Density** — generous spacing inside the editor so Markdown renders comfortably; compact spacing for the review-diff view so large diffs scan quickly.

**Motion** — minimal: a quiet indicator for peer presence and one animation for the review→push transition. No auto-complete chrome (intentional, given the no-AI stance).

## Constraints

- Free for now, with the author's stated hope that it stays free. The MVP must not include a paywall, a quota screen, or pricing UI.
- No built-in AI in any mode. This is a stated product decision, not a roadmap gap; do not add AI suggestions, AI summarisation, or AI-generated text to the editor, the canvas, or the discussion.
- Peer-to-peer by default — content must not be required to pass through a server the author controls. The MVP may use a signaling server for peer discovery but should not be the source of truth for document content.
- Files edited live in the user's own GitHub repo. The review-and-push step is the path back to the repo; nothing else writes to the repo on the user's behalf.
- GitHub OAuth is the only auth posture in the MVP — the workspace is bound to a repo the user has access to.
- The "context that people and agents use" framing means the MVP must not silently strip Markdown-frontmatter fields or other agent-readable metadata.
