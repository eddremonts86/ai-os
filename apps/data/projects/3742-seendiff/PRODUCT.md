---
id: "3742"
slug: seendiff
title: seendiff
status: draft
source:
  name: ProductHunt
  url: "https://www.producthunt.com/products/seendiff"
category: product-launch
date: "2026-08-25"
tags: [ProductHunt, Product Launch]
tech: [Vue 3 + Vite, TanStack Start ingestion API, Postgres + Drizzle ORM, Cloudflare R2 for diff raw storage, Monaco editor for the split view]
---
# seendiff

> Auto-generated product brief. Source is a one-line ProductHunt post positioning a code-change viewer with a progress overlay. Sections below are filled where the source wording justifies content; honest gaps are kept where it does not.

## Value Proposition

The capture for seendiff names two surfaces: a *diff viewer* and a *progress tracker* that lives on top of it. The implicit job is the moment a reviewer opens a non-trivial change, scrolls, and inevitably loses track of which file or block they have already worked through. The product claims to surface that coverage — what has been read, what has been commented on, what is still untouched — so the reviewer can finish a review with proof they covered the change rather than a vague "I think I looked at it." The capture does not specify how diffs land in the viewer or what counts as progress, so the value proposition is restated at the level the source supports.

**One-liner:** Let a reviewer scroll a code diff with a visible progress marker on top, so finishing a code review means "I've covered every block" instead of "I think I read most of it."

## Target Users

| Stakeholder | Why they care |
|---|---|
| Code reviewers | The post implies a reviewer reading a code change but does not name a role or team size. |
| Solo developers self-reviewing their own PRs | Implied buyer of a progress-tracked view of a change, although the capture does not separate self-review from peer review. |
| Engineering managers reviewing their own PR backlog | Implied because the metaphor fits a recurring backlog, although the capture does not name this scenario directly. |

## Jobs To Be Done

1. **Functional job** — TODO: the post names "code diff viewer with progress tracking" but does not specify how diffs are ingested (paste, GitHub PR, file, command-line), what counts as progress (file read, line inspected, comment left, file signed off), or how the progress view surfaces back to the author; no functional job can be stated without inventing them.
2. **Emotional job** — TODO: the capture implies "anxious that I missed something" but does not name the emotional state explicitly; restating it would invent a quote.
3. **Social job** — TODO: no social, peer, or reputation frame is described in the capture.

## Success Metrics

- **Reviewer coverage:** TODO: the source does not state what fraction of files or lines the progress tracker should cover.
- **Time to complete review:** TODO: not stated in the capture; would be invented.
- **Comment density:** TODO: not stated; a per-block comment number would be invented.

## Pricing & Monetization

TODO: define model (freemium / subscription / one-time / marketplace fee). The capture does not state a price, a per-PR fee, or a team-vs-individual tier; restating a price would invent it.

## Competitive Landscape

TODO: list 2-3 alternatives + differentiation. The capture names "code diff viewer" and "progress tracking" but names no comparable tool (GitHub's PR review experience, GitLab's MR view, Reviewable, Bors-style progress dashboards, plain `git diff` in a terminal); a comparison built from this capture would be invented.

## Risks & Open Questions

- [ ] The capture is one line on a ProductHunt product page; until the launch post (diff source list, progress unit, sample view) is read, no behaviour claim can be asserted.
- [ ] "Progress tracking" is not bounded — without a unit (file, line, comment, file signed off) the metric is unfalsifiable.
- [ ] The capture does not state whether the diff source is local (no auth), GitHub (OAuth), or both; this shapes every security and offline claim.
- [ ] Even with a working diff viewer, the plan as captured cannot ship a self-contained product — the corpus entry's value is to flag the launch and link out.

---

_Source:_ [ProductHunt](https://www.producthunt.com/products/seendiff) · **Category:** product-launch · **Tags:** ProductHunt,Product Launch
