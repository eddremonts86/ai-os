# PRODUCT.md — MaskShift – a maximalist coding agent with zero NPM dependencies

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ MaskShift is a local-first coding agent harness. Features:<p>- Works with models that have no tool-calling API. Tool schemas are
 rendered into the system prompt and the model calls them by writing a
  block in its reply, parsed back into a normal tool call.<p>- No npm runtime dependencies. Daemon are Node 22 built-ins only. Install is a file copy and a symlink.<p>- Multi-provider: Ollama, OpenAI, Anthropic, Gemini, OpenRouter, LM Studio, vLLM.<p>- 148 native tools: filesystem, shell, search&#x2F;indexing, Git and
Workspace, LSP, browser&#x2F;CDP, containers, SSH, databases, web fetch.<p>- Lazy MCP loading. Catalog is searched, the relevant server connects on demand, only those tools enter the context window.<p>- 36 bundled skills, plus skills imported from Claude, Codex, and Copilot directories.<p>- Bridges to Claude Code, Codex, OpenCode, Copilot CLI, and Aider when they&#x27;re on PATH.<p>- Scheduled automations, plugins, persistent memory, parallel agents in isolated worktrees.<p>- Web cockpit with live run telemetry, plan pane, tool traces, source browser, and a host terminal.<p>Permissive by default. No per-command approval. Recovery is pre-run checkpoints, Git stash refs, and an append-only audit log. Keep it on loopback or in the container.

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

| Stakeholder | Why they care |
|---|---|
| Early adopters | _[What pain they feel, and how this solves it]_ |
| Founders | _[What pain they feel, and how this solves it]_ |
| SMEs | _[What pain they feel, and how this solves it]_ |

## Jobs To Be Done

1. **Functional job** — _[What the user is trying to accomplish]_
2. **Emotional job** — _[How they want to feel]_
3. **Social job** — _[How others perceive them using this]_

## Success Metrics (North Star)

- **Activation:** _[% of signups who complete X within Y days]_
- **Retention:** _[DAU/MAU, week-1 retention, cohort curves]_
- **Revenue:** _[MRR target, ARPU, LTV/CAC]_

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_TODO:_ list 2-3 alternatives + differentiation.

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49591238) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
