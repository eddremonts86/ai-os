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

## Tech Stack

- **A hosted web service** at `mcplocker.com` for the signup flow, the user-facing surface, and the routing layer.
- **Encrypted-at-rest storage** for the user's MCP server registrations and skill registrations, with the user's account credential as the decryption key.
- **MCP (Model Context Protocol)** as the wire protocol the locker speaks to the agent and to the registered MCP servers.
- **A subscription billing layer** for the Pro ($5/mo) and Teams Unlimited ($25/mo) tiers.
- **An account-activity email layer** that sends only account emails (signup confirmation, password reset, billing events, security alerts), never marketing.
- **A privacy-policy consent gate** that records the user's consent before generating the private link.
- **A user-facing surface** for adding, removing, rotating, and revoking MCP server registrations, with a per-tier cap display.

## Architecture

The service has three surfaces: the public landing page (the pricing tiers and the signup form), the user-facing management surface (the MCP server registrations, the private link, the billing), and the routing surface (the private link the agent calls).

The landing page publishes the pricing tiers: Free (up to 5 MCP servers per account), Pro (up to 100 MCP servers per account at $5/mo), Teams Unlimited (unbounded at $25/mo per team). The signup form records the Privacy Policy consent and creates the account; the consent record is part of the audit trail.

The user-facing management surface is where the user adds, removes, rotates, and revokes MCP server registrations. The private link is generated on the user's first MCP server registration and is the credential the agent registers as a single tool. The per-tier cap is displayed on the surface; the user cannot add a server that exceeds the cap without upgrading.

The routing surface is the private link the agent calls. The locker receives the call, decrypts the user's MCP server registrations, dispatches the call to the right registered server, and returns the response. The agent sees one tool; the user has one private endpoint to rotate, audit, and revoke.

The encrypted-at-rest storage holds the user's MCP server registrations and skill registrations. The decryption key is the user's account credential; the locker does not store the key in plaintext. The encryption is the structural reason the source's "private & encrypted at rest" claim is not a marketing line.

The account-activity email layer sends only account emails. The signup confirmation, the password reset, the billing events, and the security alerts are in scope; marketing is not. The email policy is part of the product, not a setting the user can opt into after signup.

The subscription billing layer handles the Pro and Teams Unlimited tiers. The Free tier is the on-ramp; the upgrade path is in the user-facing surface, surfaced when the user approaches the cap.

## Milestones

1. **M1 — Landing page and pricing tiers** — the Free/Pro/Teams Unlimited tiers, the signup form, the Privacy Policy consent gate.
2. **M2 — Account and authentication** — the signup flow, the account credential, the audit trail for consent records.
3. **M3 — Encrypted-at-rest storage** — the encryption layer, the decryption key path, the audit surface the user can check.
4. **M4 — User-facing management surface** — the add/remove/rotate/revoke flow, the per-tier cap display, the upgrade prompt.
5. **M5 — Private link generation and rotation** — the link generator, the rotation flow, the agent's re-registration path.
6. **M6 — Routing surface** — the MCP call dispatch, the per-server routing table, the response forwarding.
7. **M7 — Account-activity email layer** — the signup confirmation, password reset, billing events, security alerts; the no-marketing policy enforcement.
8. **M8 — Subscription billing layer** — the Pro ($5/mo) and Teams Unlimited ($25/mo) flows, the upgrade path on cap approach.

## Risks

- **Cap breach on Free tier** — the user adds a 6th MCP server and the cap is exceeded. Mitigation: the cap is enforced on the add flow; the user is prompted to upgrade or remove a server before the 6th add completes.
- **Private link leak** — the link is shared with an unintended agent and the user's MCP library is exposed. Mitigation: the link is rotatable; rotation invalidates the previous link; the user can audit the agent registrations.
- **Encrypted-at-rest key loss** — the user loses the account credential and the MCP registrations are unreadable. Mitigation: the user-facing surface documents the credential-recovery flow; the locker surfaces the recovery path before the credential is needed.
- **Routing-layer latency** — the routing surface adds latency between the agent and the registered MCP server. Mitigation: the routing layer is the locker's core performance surface; latency is a first-class metric the user can check.
- **Account-activity email mistaken for marketing** — the user marks the locker email as spam and the email deliverability degrades. Mitigation: the email layer is explicit about the activity-only policy; the user can manage the email preferences without opting out of security alerts.
- **Teams-tier operational drag** — a Teams-tier account grows the MCP library beyond the operations team's capacity. Mitigation: the user-facing surface surfaces a soft cap (e.g. an alert at 200 servers) before operational drag sets in.
- **Subscription billing failure** — the Pro or Teams subscription fails to renew and the user's routing is paused. Mitigation: the billing layer surfaces the failure with a grace period; the user can update the payment method without losing the routing.
