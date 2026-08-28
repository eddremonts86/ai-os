---
id: "3190"
slug: rudder-red-green-tdd-workflow-for-verifiably-comprehens
title: Rudder – Red-Green TDD Workflow for Verifiably Comprehensive Specs
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49452359"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Rudder – Red-Green TDD Workflow for Verifiably Comprehensive Specs

## Tech Stack

- **Plugin host:** a local Node.js plugin for Codex and Claude Code. Both harnesses ship a plugin manifest format that maps cleanly onto a small TypeScript CLI.
- **Test rewriter + coverage engine:** TypeScript with Vitest for the local test runs and `c8` (or the project's existing coverage tool) for the coverage numbers. The rewriter operates on the project's existing test files so users do not have to migrate.
- **Session-history reader:** local file reader for the agent's transcript store; the source does not name the formats, so the reader should sit behind a small adapter per agent.
- **Targeted-questions UI:** a small TUI rendered in the agent's own terminal so the user does not need a separate app open.
- **DB:** SQLite for per-project state (current coverage, answered questions, test-rewrite log) — local, single-user, no remote sync.
- **Distribution:** open-source on GitHub; no hosted backend.

## Architecture

```
Project spec ──┐
                │
Session history ┼──▶ Test rewriter ──▶ Vitest + c8 ──▶ Coverage %
                │                            │
User goal ──────┘                            ▼
                                      Gap analysis ──▶ Targeted question
                                                              │
                                                              ▼
                                              Answered intent ──▶ New failing test
                                                              │
                                                              ▼
                                                    Hand to agent (Codex / Claude Code)
                                                              │
                                                              ▼
                                                  Failing test goes green → loop
```

- The plugin reads the spec and session history, rewrites tests against intent only, runs Vitest + c8, and persists the resulting coverage % to a local SQLite file.
- A gap-analysis step maps uncovered lines back to either no matching intent or ambiguous intent, then drives one targeted question at a time.
- Each answered question is fed back into the test rewriter as new intent, producing a failing test that is handed to the running agent so it can implement to green.

## Milestones

1. **M0 — Spec + design tokens + plugin scaffolding.** Existing SPEC.md and DESIGN.md approved; plugin manifest registered for Codex and Claude Code.
2. **M1 — Local test rewrite + coverage.** Given a project with a spec and a session history, the plugin rewrites the unit tests and reports a coverage %.
3. **M2 — Targeted-questions loop.** Given a goal %, the plugin surfaces the highest-leverage gaps one question at a time until the user stops or hits the goal.
4. **M3 — Red-green TDD loop.** Each answered question produces a failing test that the agent is asked to make pass; the loop closes when the test goes green.
5. **M4 — Open-source release.** README, install instructions, and a demo project that exercises the full loop end-to-end.

## Risks

- Test-rewrite fidelity: if the rewriter keeps tests that reflect implementation instead of intent, the coverage % becomes meaningless. The rewriter needs a clear, documented rule for what counts as intent.
- Agent session-history formats change without notice; the per-agent adapter layer needs to fail loudly rather than silently misread intent.
- The targeted-questions loop assumes the user can articulate intent on the spot. For vibecoders especially, some uncovered code may be a thing they like and do not want to write intent for; the product needs an "intentionally uncovered" escape hatch.
- Coverage tooling depends on the language and test runner. The MVP is JavaScript / TypeScript with Vitest; supporting other stacks is out of scope unless the project grows there.
