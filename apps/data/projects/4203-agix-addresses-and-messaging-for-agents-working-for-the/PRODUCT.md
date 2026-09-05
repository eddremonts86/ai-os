---
id: "4203"
slug: agix-addresses-and-messaging-for-agents-working-for-the
title: agix – addresses and messaging for agents working for their humans
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49508954"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# agix – addresses and messaging for agents working for their humans

## Value Proposition

An Agent Interconnect that gives an AI agent an address and an inbox, connects it to a network of other agents' humans, and lets the agents get things done together. The Claude plugin (`claude plugin marketplace add somanymachines/agix-skills` then `claude plugin install agix@agix`) and the OpenClaw plugin (`openclaw plugins install clawhub:@agix/openclaw` then `openclaw channels login --channel agix`) are the two on-ramps; the address scheme is `agix/`handle``; the public demo endpoint is `agix/hello`.

The two use cases the source ships. First, scheduling: ask the agent to schedule a meeting with `agix/hello`, the agents find a time and put it on the user's calendar. Second, messaging: an OpenClaw agent receives messages and works with other agents even when the user is away. The user does not babysit the conversation.

**One-liner:** An Agent Interconnect with an address scheme and an inbox per agent, two plugins (Claude and OpenClaw) as on-ramps, and two use cases (agent-to-agent scheduling, agent-to-agent messaging) that work without the user babysitting.

## Target Users

| Stakeholder | Why they care |
|---|---|
| AI agent users | Want their agent to do work with other agents without the user babysitting. |
| Claude Code users | Want a plugin that gives their agent an agix address and inbox. |
| OpenClaw users | Want a plugin that connects an OpenClaw agent to the agix network. |
| Teams whose agents coordinate | Want scheduling and messaging without a human in the loop. |
| Agent builders | Want a network effect from agents exchanging addresses and inboxes. |

## Jobs To Be Done

1. **Functional job** — Ask the agent to schedule a meeting with another agent's human; the agents find a time and put it on the user's calendar.
2. **Functional job** — Have an OpenClaw agent receive messages and work with other agents even when the user is away.
3. **Functional job** — Install the Claude plugin and the OpenClaw plugin with the source's exact install commands and reach the agix network.
4. **Functional job** — Reach the public demo endpoint `agix/hello` and prompt the agent to schedule a hello meeting with the agix team.
5. **Emotional job** — Stop the feeling that agent-to-agent scheduling and messaging requires the user to mediate each step.
6. **Social job** — Be the user whose agents coordinate with other agents' humans without the user babysitting.

## Success Metrics

- **Address-scheme adoption rate** — share of agents on the network using the `agix/`handle`` address scheme. An address outside the scheme is a network-isolation failure.
- **Claude plugin install completion rate** — share of users that complete the two-step Claude plugin install (`marketplace add` then `plugin install`). A failure on either step is a setup failure.
- **OpenClaw plugin install completion rate** — share of users that complete the two-step OpenClaw plugin install (`plugins install` then `channels login --channel agix`). A failure on either step is a setup failure.
- **Demo endpoint reach rate** — share of users that reach `agix/hello` and prompt the agent to schedule the hello meeting. The metric is the public-demo funnel.
- **Scheduling completion rate** — share of agent-to-agent scheduling requests that complete with a calendar invite on the user's calendar. A request that ends with the user mediating the time is a UX failure.
- **Messaging uptime for OpenClaw agents** — share of messages an OpenClaw agent receives that the agent handles without the user being online. A message that requires the user to be online is a coverage gap.
- **Address-and-inbox trust** — share of agent-to-agent interactions that complete without a third-party credential. An interaction that requires a third-party credential is a setup failure.

## Pricing & Monetization

The source names no fee, no tier, no per-message rate, and no subscription. The plan does not invent a monetization the source does not name. The agix network is the unit of value the agents exchange; the plugins are the on-ramps. Any future monetization has to be measured against the address-scheme adoption rate and the scheduling completion rate, because those are the metrics the source ties to the network's value proposition.

## Competitive Landscape

- **Email and calendar invites** — work for human-to-human scheduling; require the user to mediate the agent-to-agent scheduling conversation.
- **Calendar APIs (the names the source does not provide)** — let the agent read the user's calendar; do not provide an address scheme or an inbox for agent-to-agent messaging.
- **Chat platforms with bots (the names the source does not provide)** — let the agent send messages in a chat; do not provide an address scheme or a scheduling negotiation protocol.
- **Custom agent-to-agent integrations** — work for specific pairs of agents; do not provide a network effect from a shared address scheme.

The post names no specific incumbent, so no further comparison is claimed here.

## Risks & Open Questions

- [ ] Confirm the address scheme `agix/`handle`` is the right boundary. The source names the scheme; the open question is whether a sub-namespace (`agix/`team`/`handle``) is needed for teams that share an inbox.
- [ ] Validate the Claude plugin install sequence (`marketplace add` then `plugin install`) is the source's exact command. The source's README names the two commands; the open question is whether a single-step install would be friendlier.
- [ ] Validate the OpenClaw plugin install sequence (`plugins install` then `channels login --channel agix`) is the source's exact command. The source names the two commands; the open question is whether the `channels login` step requires a manual credential entry.
- [ ] Define the policy on a message an OpenClaw agent receives that the agent cannot handle. The source is explicit that the agent works without the user being online; the open question is whether the agent surfaces a "needs human" fallback or fails silently.
- [ ] Establish a documented escalation path when two agents cannot find a time. The scheduling use case ends with a calendar invite; the open question is whether the agents surface a "no time found" message and ask the user for a wider window.
- [ ] Confirm the demo endpoint `agix/hello` is a stable public endpoint. The source names the endpoint; the open question is whether the endpoint is a long-lived demo or a temporary launch surface.
- [ ] Define the policy on a third-party credential requirement. The source is explicit that the agents do not need a third-party credential; the open question is whether the calendar invite path requires a calendar-specific OAuth flow.
