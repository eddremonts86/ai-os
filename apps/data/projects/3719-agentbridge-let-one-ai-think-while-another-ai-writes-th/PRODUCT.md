---
id: "3719"
slug: agentbridge-let-one-ai-think-while-another-ai-writes-th
title: AgentBridge – Let one AI think while another AI writes the code
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49488074"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Open Source, MCP, Agents, Developer Tools]
tech: [Rust, MCP (Model Context Protocol), OpenCode, Gemini, Claude]
---
# AgentBridge – Let one AI think while another AI writes the code

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A developer can run a web-tier reasoning AI (Gemini, Claude web) as the Brain that reads and plans, while their local coding agent (OpenCode first) acts as the Executor that edits, runs and tests — connected by a Rust MCP bridge that enforces read-only access for the Brain and an MCP-grounded plan for the Executor. The Brain's quota is spent on understanding, the Executor's quota is spent on doing, and every step is reviewable.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Developers with both web-tier and CLI AI subscriptions | Use the AI best at reasoning for planning, the agent best at execution for edits. |
| Solo founders shipping fast | Get the planning quality of a top web model and the editing loop of a CLI agent without burning CLI quota on understanding. |
| Small teams needing an audit trail | Have a written Brain plan and a separate Executed diff so reviews are concrete. |
| MCP server authors | Reference Rust implementation of a read-only Brain surface and an Executor surface. |
| Privacy-conscious users | Want reasoning and execution to run through models they already control, not a hosted intermediary. |

## Jobs To Be Done

1. **Functional job** — Split AI coding work between a web-tier reasoning model and a local coding agent without losing either quota or auditability.
2. **Emotional job** — Stop feeling guilty about burning the coding-agent's monthly allowance on codebase exploration.
3. **Social job** — Show a teammate a clear, reviewable plan-then-diff trail instead of "the AI did it".

## Success Metrics

- **Adoption:** ≥ 100 GitHub stars and ≥ 1,000 crates.io downloads within the first quarter.
- **Executor coverage:** OpenCode wired up as default; ≥ 2 additional Executor integrations (Cursor, Cody, Claude Code) by end of Q2.
- **Plan fidelity:** ≥ 80% of Brain plans are applied by the Executor without manual revision.
- **Diff approval rate:** ≥ 75% of Executed diffs are approved by the Brain on first review.
- **Setup time:** a developer with an existing OpenCode install is up and running with a Brain + Executor pair in ≤ 10 minutes.

## Pricing & Monetization

Open source under MIT. No paid tier in v1. A future hosted control plane could offer shared plan storage, team audit logs, and a managed Brain endpoint, but the bridge itself stays free. Maintainer funding through GitHub Sponsors and the crates.io page.

## Competitive Landscape

- **Single-agent coding CLIs (Cursor, Cody, Claude Code)** — strong execution but quota gets spent on understanding too.
- **Direct web AI + manual copy-paste** — works but loses the audit trail and the local-tool integration.
- **MCP servers in general** — provide tools to a single agent; AgentBridge composes a Brain-only-MCP surface with an Executor-only-MCP surface.
- **Claude Code + MCP** — uses MCP for tools but does not split reasoning from execution.
- **DIY scripts (curl + jq against AI APIs)** — possible but no shared protocol, no plan persistence.

## Risks & Open Questions

- [ ] Confirm MCP tooling stability; the protocol is young and method names can change between client versions.
- [ ] Decide whether the Brain can ever request privileged actions (e.g. install dependencies) and, if so, how the user approves them.
- [ ] Validate that the C2C plan format is rich enough for non-trivial refactors without leaking into natural-language-only plans.
- [ ] Confirm OpenCode is willing to ship a default integration reference in this repo.

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49488074) · **Category:** show-hn · **Tags:** Show HN,Open Source,MCP,Agents,Developer Tools
