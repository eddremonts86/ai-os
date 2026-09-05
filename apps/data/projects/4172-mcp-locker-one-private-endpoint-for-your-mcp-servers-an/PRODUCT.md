---
id: "4172"
slug: mcp-locker-one-private-endpoint-for-your-mcp-servers-an
title: "MCP Locker: One private endpoint for your MCP servers and skills"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49511022"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# MCP Locker: One private endpoint for your MCP servers and skills

## Value Proposition

A hosted service that fronts the user's whole MCP server and skill library behind a single private link the agent registers as one tool. The agent's context window holds one tool description instead of one per server; the user gets one private endpoint to rotate, audit, and revoke; the locker dispatches each call to the right server.

The pricing is explicit and public. Free for up to 5 MCP servers per account. Pro for up to 100 MCP servers per account at $5/mo. Teams Unlimited for an unbounded library at $25/mo per team. Every endpoint is encrypted at rest; the locker emails the user only about account activity, never marketing.

**One-liner:** A hosted MCP endpoint service that fronts the user's private MCP library behind one private link, with tiered plans capped at 5/100 servers on Free/Pro and unbounded on Teams Unlimited at $25/mo.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Users with multiple private MCP servers | Want one tool in the agent's context window instead of one per server. |
| Teams running an internal MCP library | Want one private endpoint to rotate, audit, and revoke without changing the agent's tool registration. |
| Privacy-conscious users | Want their MCP endpoints encrypted at rest and the locker to email only about account activity. |
| Power users starting small | Want the Free tier (up to 5 servers) and a clear upgrade path to Pro as the library grows. |
| Teams with an unbounded library | Want the Teams Unlimited tier ($25/mo) with no per-server cap. |

## Jobs To Be Done

1. **Functional job** — Register the user's MCP servers behind one private link the agent calls as a single tool.
2. **Functional job** — Rotate, audit, and revoke MCP server registrations without changing the agent's tool registration.
3. **Functional job** — Stay within the user's tier cap (5 on Free, 100 on Pro, unbounded on Teams Unlimited) with a clear upgrade path when the cap is reached.
4. **Emotional job** — Stop the feeling that the agent's context window is filling with one tool description per MCP server, and that each private endpoint is its own privacy boundary.
5. **Social job** — Be the team whose MCP library is behind one private endpoint the team can audit and revoke, not a sprawl of one endpoint per server.

## Success Metrics

- **Free-tier cap adherence** — share of Free-tier accounts that stay at or below 5 MCP servers. A Free-tier account at 6 servers is a cap breach and requires an upgrade or a removal.
- **Pro-tier cap adherence** — share of Pro-tier accounts that stay at or below 100 MCP servers. A Pro-tier account at 101 servers is a cap breach.
- **Teams-tier no-cap** — share of Teams-tier accounts that grow the MCP library without a per-team cap. The metric is the unbounded nature of the tier.
- **Private-link rotation rate** — share of users that rotate their private link at least once. A high rotation rate is the signal the user is treating the link as a credential.
- **Encrypted-at-rest verification rate** — share of MCP server registrations the user can verify are encrypted at rest via a user-facing audit surface. A user-facing audit the user does not check is a transparency gap.
- **Account-activity-only email rate** — share of account emails the user receives that are account-activity emails, not marketing. The metric is the no-spam promise.
- **Single-tool-registration coverage** — share of agent sessions where the agent registers exactly one MCP Locker tool, not one per server. A session with one tool per server is a routing failure.

## Pricing & Monetization

The source publishes the pricing explicitly: Free (up to 5 MCP servers per account), Pro (up to 100 MCP servers per account at $5/mo), Teams Unlimited (unbounded at $25/mo per team). The plan does not invent a tier the source does not name. The locker's monetization is the Pro and Teams Unlimited subscriptions; the Free tier is the on-ramp. Any future monetization has to be measured against the cap adherence and the single-tool-registration coverage, because those are the metrics the source ties to the locker's value proposition.

## Competitive Landscape

- **Per-server MCP registration (the names the source does not provide)** — one tool per server in the agent's context window, one privacy boundary per server, no audit surface.
- **Self-hosted MCP frontends (the names the source does not provide)** — own the routing, but require the user to operate the host; the source's hosted service removes that operational burden.
- **Hosted MCP gateway services (the names the source does not provide)** — front the user's library, but do not publish the cap and the price the way the source does.
- **Direct agent-to-MCP integrations** — skip the locker entirely, but lose the single-tool context window and the audit surface.

The post names no specific incumbent, so no further comparison is claimed here.

## Risks & Open Questions

- [ ] Confirm the per-tier cap is the right pricing shape. The source publishes Free/Pro/Teams at 5/100/unbounded servers; the open question is whether a per-server usage metric (calls, bandwidth) is the right axis for a future tier.
- [ ] Define the rotation story for a private link that the user has shared with multiple agents. The locker surfaces rotation; the open question is whether the rotation invalidates the agent's tool registration and how the user re-registers the agent.
- [ ] Validate the encrypted-at-rest claim against a third-party audit. The source states "private & encrypted at rest"; the open question is whether the locker publishes a SOC 2 or equivalent audit, and whether the audit covers the routing layer's decryption.
- [ ] Decide the policy on a Teams-tier account that grows the MCP library beyond the operations team's capacity. The Teams tier is unbounded; the open question is whether the locker surfaces a soft cap (e.g. a per-team alert at 200 servers) before operational drag sets in.
- [ ] Establish a documented escalation path for an MCP server registration that fails the locker's compatibility check. The source does not name a compatibility check; the open question is whether the locker refuses incompatible servers or accepts them and routes the failure to the agent.
- [ ] Confirm the account-activity-only email policy survives a future marketing motion. The source states the policy; the open question is whether a future product addition (a newsletter, an upsell) lives outside the email policy or violates it.
- [ ] Define the policy on a Free-tier user that exceeds the 5-server cap and refuses to upgrade. The cap is enforced; the open question is whether the locker pauses the routing or removes the oldest server registration.
