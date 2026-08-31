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

## Problem

The capture is a short Show HN write-up for Epiq: an issue tracker that is distributed, Git-native, and able to replay state as a movie on demand. The author frames the replay feature as the answer to a hard problem in agentic workflows — auditing and tracing what happened in a multi-agent environment — letting a team trace intent and how it evolved while they were away. A demo is linked at https://ljtn.github.io/epiq. Beyond that, the capture states nothing: no feature list, no pricing and no user counts.

## Objective

Build the MVP the capture describes: an issue tracker whose state lives in Git, and whose history can be replayed like a movie — scrubbing backwards and forwards through an issue's state changes to answer what changed, when, and by whose intent. The MVP must make the replay path the headline feature, not an audit log buried in settings.

## Target Users

- Teams running agentic workflows who need to audit what autonomous agents did while humans were away.
- Engineering leads tracing how a decision or a bug evolved across a multi-agent session.
- Distributed teams that want their tracker in the same Git as their code.
- Researchers and tool-builders studying multi-agent coordination.

## MVP Scope

- Issues stored as files or objects in a Git repository.
- A per-issue event log recording every state change.
- A replay player that scrubs an issue's state forward and backward like a video.
- A minimal web UI for viewing issues and their replays.

## Constraints

- The capture is a short post plus a demo link; feature breadth beyond the replay claim is our design.
- Replay fidelity depends entirely on what events are recorded; the MVP must define the event model honestly.
- Git-native means the tracker must respect Git semantics (merge, branch) or the claim collapses.
- No pricing or user claims exist in the capture; none may be invented.

## Design Direction

See `DESIGN.md` for this project's design tokens.
