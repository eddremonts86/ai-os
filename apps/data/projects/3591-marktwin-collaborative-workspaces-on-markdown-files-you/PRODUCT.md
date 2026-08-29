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

## Value Proposition

Marktwin is a peer-to-peer collaborative workspace that edits the Markdown files a team already keeps in their own GitHub repo. The post's framing is a three-way tradeoff the author found unacceptable in every existing alternative: store notes somewhere else, accept uncomfortable collaboration, or pass through someone else's server. Marktwin removes the third option by running the edit session peer-to-peer and pushing the result back through a review-and-push step the user controls.

The editor offers four modes — Markdown, canvas, draw, discuss — and the workspace is free for now, with the author's stated hope that it stays free. The product is deliberately AI-free; the author is explicit that the goal is keeping the context that people and agents use inside files the user controls, not adding a new AI layer on top.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Engineering teams with notes in-repo | Want to edit RFCs / runbooks / design docs together without exporting the context. |
| Indie devs / small teams | Need collaboration but refuse to put team context in a hosted SaaS. |
| Agent-using developers | Keep agent-readable notes in the repo; want the editor to respect that and not silently rewrite metadata. |
| People who rejected Notion / Docs | Want a peer-to-peer alternative that does not require moving the content out of GitHub. |

## Jobs To Be Done

1. **Functional job** — Edit a team's existing GitHub Markdown files together in real time, with a peer-to-peer connection, and push the result back to the repo only after the user reviews the diff.
2. **Emotional job** — Stop feeling like collaboration tools force the team to either store content elsewhere or route it through someone else's server.
3. **Social job** — Demo to peers that an AI-free, peer-to-peer editor can host the four modes the author named without the SaaS tradeoff.

## Success Metrics

- **Workspace activation** — workspaces created per week by users with at least one collaborator.
- **Review-and-push completion** — share of collaborative sessions that end with at least one change successfully pushed to the originating repo.
- **No-AI consistency** — zero AI features shipped; the "no built-in AI" stance must be visible in the UI and must not regress.
- **Free-tier consistency** — zero paywall or quota screens introduced; the "free for now" posture must hold across releases.
- **Peer-to-peer latency** — median edit-to-peer propagation on a typical home connection; should be under the latency a SaaS roundtrip would cost.

## Pricing & Monetization

The post is silent on pricing. It states only that "everything available on marktwin.com is free for now" and that the author's hope is to keep it that way; absent beats invented. There is no mention of paid tiers, a future premium plan, or marketplace fees in the source capture.

## Competitive Landscape

- **Notion / Google Docs / Obsidian Publish-style services** — the SaaS-shape the author explicitly rejects. They offer collaboration but the content lives outside the team's own repo and is routed through the vendor's servers.
- **GitHub's own web editor and PR-based collaboration** — co-located with the repo, but the author describes the collaboration posture as uncomfortable and the editing experience as not the four-mode editor the post describes.
- **HackMD, HedgeDoc, and similar Markdown collab tools** — cover Markdown real-time editing but typically host the content on their own infrastructure rather than binding the workspace to a repo the user owns.

## Risks & Open Questions

- [ ] Decide the relationship between "free for now" and a sustainable model — the author expresses a hope of staying free, which the MVP must respect; a sustainable story may need to be designed without breaking that promise.
- [ ] Peer-to-peer connectivity — firewalled peers need a fallback path; clarify whether the signaling server is allowed to be a transient relay without becoming a content host.
- [ ] GitHub OAuth scope creep — confirm the MVP asks only for the repos the workspace binds to, and that tokens are never used for anything outside the review-and-push flow.
- [ ] Concurrent edits inside Markdown frontmatter — peer-to-peer CRDTs handle prose but frontmatter key collisions are still possible; the MVP must define the merge rule.
- [ ] Confirm the "no built-in AI" stance survives contact with feature requests — the post is explicit, so any AI suggestion is a regression, not a value-add.

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49479555) · **Category:** show-hn · **Tags:** Show HN, Product, Problem
