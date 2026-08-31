---
id: "3828"
slug: delete-yourself-from-data-brokers-without-a-subscriptio
title: Delete yourself from data brokers without a subscription
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49493881"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [Structured removal playbooks per broker, agent task instructions, request templates, verbose action logging, removal status dashboard, open-source repo distribution]
---
# Delete yourself from data brokers without a subscription

## Tech Stack

Chosen for an instruction repo whose executor is the user's own AI agent.

- **Structured removal playbooks per broker:** one machine-readable playbook per data broker.
- **Agent task instructions:** steps written for an AI agent to execute, not just for a human to read.
- **Request templates:** form fields, email drafts and opt-out page scripts per broker.
- **Verbose action logging:** every step records what was sent, to whom and when.
- **Removal status dashboard:** per-broker status of requests and follow-ups.
- **Open-source repo distribution:** the deliverable is the repo itself.

## Architecture

- **Playbook store:** per-broker removal instructions and templates.
- **Agent runner:** executes playbooks through the user's agent, logging each action.
- **Log ledger:** the verbose audit trail of what happened.
- **Dashboard:** renders per-broker status from the ledger.
- **Repo front end:** README, playbook format docs and contribution guide.

## Milestones

1. **M0 — First brokers.** Playbooks for the data types the poster names (phone, addresses, vehicles) across a small broker list.
2. **M1 — Agent execution.** An agent can follow a playbook end to end with verbose logging.
3. **M2 — Custom removal.** Users can add brokers beyond the shipped list.
4. **M3 — Dashboard.** Per-broker status view built from the logs.

## Risks

- **Playbook rot:** broker pages and forms change; stale instructions fail silently.
- **Data-handling tension:** the user must share personal data with brokers to be removed.
- **Agent reliability:** multi-step web flows are fragile for agents.
- **Maintenance funding:** an open-source repo with no revenue depends on volunteers.
- **Scope creep:** every broker and country adds a playbook to maintain.
