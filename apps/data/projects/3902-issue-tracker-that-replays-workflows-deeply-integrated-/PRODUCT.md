---
id: "3902"
slug: issue-tracker-that-replays-workflows-deeply-integrated-
title: "Issue tracker that replays workflows, deeply integrated with the code [video]"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49496437"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Git-native storage, event sourcing, deterministic state log, time-travel replay UI, agent workflow tracing, static site deployment]
---
# Issue tracker that replays workflows, deeply integrated with the code [video]

## Value Proposition

Every issue tracker answers what is broken now; almost none answer how it got that way. Epiq's stated answer is replay: state as a movie on demand, so a team returns from lunch and watches an agent's intent evolve — what changed, when, in what order. Distributed and Git-native means the tracker lives with the code and works without a central server. For multi-agent workflows, that replay is not a feature; it is the audit trail the whole approach was missing.

**One-liner:** A Git-native issue tracker that replays workflow state like a movie.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Multi-agent workflow teams | Replay is the audit trail autonomous work otherwise lacks. |
| Engineering leads | Trace how intent evolved, in the author's words, while they were away. |
| Git-centric teams | The tracker lives in the same repo as the code. |
| Agent tooling researchers | A concrete reference for tracing in multi-agent environments. |

## Jobs To Be Done

1. Replay an issue's history like a video and see exactly what changed when.
2. Audit what autonomous agents did in a multi-agent run.
3. Keep the tracker distributed, in Git, without a central server.
4. Trace the evolution of intent, not just the final state.

## Success Metrics

- Replays viewed per issue, the adoption signal for the headline feature.
- Time to answer the audit question what happened here, from issue open to replay end.
- State changes captured per issue, the fidelity measure of the event model.
- Issues tracked per repository.

## Pricing & Monetization

None stated. The capture contains no pricing information.

## Competitive Landscape

The capture names no competitors. The category is issue tracking — hosted giants and Git-integrated tools — where the title's differentiation is two structural claims: distributed Git-native storage, and on-demand replay of workflow state, aimed squarely at the audit gap in agentic workflows.

## Risks & Open Questions

- [ ] Replay completeness depends on the event model; unlogged changes are invisible by construction.
- [ ] Git-native storage raises scale and conflict questions conventional trackers do not face.
- [ ] The capture shows a demo, not production use; no adoption evidence exists.
- [ ] Multi-agent audit is a young need; the market for it is unproven.
- [ ] No monetization is stated; the deployment model shown is a static demo site.
