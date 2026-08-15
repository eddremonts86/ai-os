---
id: "551"
slug: i-actually-cooked-something-but-perfecting-it-is-killin
title: "I actually cooked something, but perfecting it is killing my productivity."
status: draft
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo7dla/i_actually_cooked_something_but_perfecting_it_is/"
category: saas
date: "2026-08-14"
---
# I actually cooked something, but perfecting it is killing my productivity.

## Tech Stack

- **Plugin host adapters:** three native host bridges — one each for the dominant video editors the niche uses. Each host adapter exposes a `plugin → host` IPC surface for reading the timeline, marking clips, and writing metadata.
- **Proprietary analysis model:** the OP trained their own model for the niche-specific video analysis; the deployment is a local Python service with a quantised checkpoint to keep CPU/GPU cost on a creator's machine tolerable.
- **Agent layer:** a stateful orchestrator that observes the timeline, decides which clips to flag, surfaces suggestions in the editor's own UI, and waits for the user to accept or skip before acting.
- **Cross-platform packaging:** Electron or Tauri shell wrapping the plugin + agent; code-signed binaries for macOS and Windows.
- **Storage:** local SQLite for the timeline-annotation cache; an opt-in sync to S3 for multi-machine workflows.

## Architecture

The OP ships a "semi-agentic" video editor that runs as a plugin inside three host programs. The agent observes the timeline and surfaces a suggestion stream (cut here, reframe, recompose), but never edits autonomously — every action is a one-click accept. The wedge is the niche: the OP says nothing comparable exists, the analysis is a model they trained themselves, and the agent's value compounds the more timelines it observes a creator edit.

```
Host editor (3 native bridges) ─▶ plugin runtime
                                       │
                                       ├─▶ local analysis model (Python, quantised)
                                       │
                                       └─▶ agent orchestrator ──▶ suggestion stream in host UI
                                                                              │
                                                                              ▼
                                                                user accepts/skips per suggestion
```

## Milestones

1. **M0 — Single-host plugin MVP.** One host editor, agent suggestion stream, accept/skip UI. End of week 3.
2. **M1 — Second + third host adapters.** End of week 8.
3. **M2 — Quantised model checkpoint that fits in 8 GB of RAM.** End of week 12.
4. **M3 — Cross-platform installers + code signing + auto-update.** End of week 16.
5. **M4 — Paid tier with cloud-assisted suggestions for harder cases.** End of week 22.

## Risks

- **Host-editor SDK drift.** Each host editor can change its plugin API without warning. The three-host adapter is the moat and the risk: one breaking change in the dominant editor can stall the whole product. Mitigation: a thin "host abstraction" layer that absorbs breaking changes behind a versioned interface.
- **The "proprietary analysis model" is the wedge and the liability.** A custom-trained model has to stay current with creator trends in the niche; if the model falls behind, the suggestions stop being useful and churn follows. Plan for a quarterly retrain cadence.
- **Perfectionism is the OP's stated blocker.** Shipping v1 before the agent is "fully autonomous" is the whole point — the product's value lives at the agent-suggests / human-confirms boundary, not in fully autonomous editing.
