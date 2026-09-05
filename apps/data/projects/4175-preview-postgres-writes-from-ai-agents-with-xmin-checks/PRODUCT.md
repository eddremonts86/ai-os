---
id: "4175"
slug: preview-postgres-writes-from-ai-agents-with-xmin-checks
title: Preview Postgres writes from AI agents with xmin checks (pg-dry-run)
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49510746"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Preview Postgres writes from AI agents with xmin checks (pg-dry-run)

## Value Proposition

A database mechanism for previewing and guarding writes that an AI agent, an admin tool, or a one-off migration issues against a Postgres database. The agent proposes a write, the library runs the equivalent read inside `BEGIN TRANSACTION READ ONLY` against the live database, and the caller gets a portable JSON proposal carrying the affected rows, the column-level changes, the cascade reach, the warnings, and the derived SQL. The apply runs only what was previewed and refuses the entire apply if a row's `xmin` has changed between preview and apply.

The library refuses instead of guessing. Statements it cannot represent faithfully throw `UnsupportedStatementError`; proposals above `maxRows` throw `TooManyRowsError`; expired proposals throw `ProposalExpiredError`; shifted row state throws `StateChangedError`. The library does not run an AI model and does not prescribe an approval UI — it provides the effect engine that an agent, CLI, admin tool, or approval system can build on.

**One-liner:** A Node and TypeScript library that turns an `INSERT`, `UPDATE`, or `DELETE` against Postgres into a portable row-level proposal, applies only what was previewed, and refuses the apply when the row state has shifted.

## Target Users

| Stakeholder | Why they care |
|---|---|
| AI agent engineers | Need to inspect the effect of an agent-generated write on real rows before it runs, with the same surface the human reviewer would see. |
| Admin tool builders | Want a preview step the human reviewer can read and an apply step the tool can call, without inventing either. |
| AI agent framework maintainers | Need a guarded apply the framework can wire as its default write path, with `xmin` checking already done. |
| Database administrators | Want a guardrail for one-off data migrations that reads the effect first and applies with a row-version check. |
| Security teams | Need an auditable JSON proposal (rowCount, changes, cascades, warnings, derived SQL) instead of a SQL string that may not match the effect. |

## Jobs To Be Done

1. **Functional job** — Propose a write against Postgres and get back a row-level proposal with the affected rows, the changes, and the warnings before any data changes.
2. **Functional job** — Approve or reject the proposal in another process (the proposal is portable JSON) and apply only what was approved.
3. **Functional job** — Be told loudly when the row state has shifted between preview and apply, with the offending rows named, so the apply can be retried or abandoned rather than silently stale.
4. **Emotional job** — Stop the feeling that an agent's write path is a SQL string somebody has to read and trust.
5. **Social job** — Be the team whose agent write path is auditable by the security review, not because the team wrote a custom guardrail, but because the database mechanism is the guardrail.

## Success Metrics

- **Refusal-on-unsafe-shape rate** — share of proposed statements that throw `UnsupportedStatementError`. A high rate is the signal the agent is generating statements outside the supported subset, not a signal the library is failing.
- **`xmin` shift rejection rate** — share of applies that throw `StateChangedError` because row state shifted between preview and apply. This is the metric the `xmin` check exists to surface.
- **Proposal-expiry rejection rate** — share of applies that throw `ProposalExpiredError`. The TTL default is 5 minutes; a high rate is the signal the approval flow takes longer than the proposal's TTL.
- **Cascade truncation rate** — share of proposals that report `cascade_depth_truncated`. The default `cascadeDepth` is five; a non-zero rate is the signal the schema has deeper cascades than the library walks.
- **Composite-key skip rate** — share of proposals that report `composite_foreign_key_skipped`. The library does not claim a count for composite keys; a non-zero rate is the signal the schema has composite-key relations.
- **`maxRows` rejection rate** — share of proposes that throw `TooManyRowsError` because the proposal exceeded 1,000 rows. The library refuses rather than reducing to an unreviewable count.
- **Driver-pool coverage** — share of users that bring their own `Driver` (versus use the default `url` connection). The library supports both; this metric is the signal a non-server Postgres is in use.

## Pricing & Monetization

The source names no fee, no tier, and no commercial plan. The library is published under MIT on GitHub and on npm as `pg-dry-run`. The source is the effect engine behind Polycore's Postgres write path; the README explicitly notes that Polycore provides the surrounding identity, policy, approval, environment routing, and audit trail. The library's pricing is the open-source license; the surrounding product's pricing is named nowhere in the source and is not invented here.

## Competitive Landscape

- **Hand-rolled `BEGIN; SELECT ...; COMMIT` preview scripts** — work for the simple case, do not return a portable proposal, do not check `xmin` on apply, do not refuse on unsupported statement shapes.
- **ORM-level change tracking (the names the source does not provide)** — works for ORM-mediated writes, does not intercept a raw SQL string an agent emits.
- **Database triggers and audit logs** — surface the change after it happens, not before, and do not return a row-level proposal the human reviewer can read in advance.
- **Read replicas as a preview surface** — see a stale view of the data, not the current database, and do not check row state on apply.

The post names no specific incumbent, so no further comparison is claimed here.

## Risks & Open Questions

- [ ] Confirm the unsupported-statement subset is enough for the agent use cases the source describes. The library refuses DDL, data-modifying CTEs, `WITH`, `INSERT ... SELECT`, and both forms of `ON CONFLICT`; the open question is whether AI agents frequently need any of those shapes.
- [ ] Decide how the library handles a proposal whose preview used one connection and whose apply uses another. The `xmin` check is the defence; the open question is whether the `ttlMs` of 5 minutes is the right default for approval flows that take longer.
- [ ] Validate that `VACUUM FREEZE`-induced `xmin` shifts are the rare exception the source claims, not a steady-state rejection rate that masks the genuine stale-state cases.
- [ ] Decide how cascade traversal interacts with `ON DELETE SET NULL` versus `ON DELETE CASCADE`. The source walks five levels deep; the open question is whether the cascade report names the action at each level or only the foreign-key edge.
- [ ] Establish a documented upgrade path when the library adds support for a previously-refused statement shape. The current `UnsupportedStatementError` is a hard fail; the open question is whether a future `proposeWithWarnings` mode would let callers opt into a less-strict preview.
- [ ] Confirm the `Driver` interface is enough for users who run Postgres behind a connection pooler (PgBouncer, RDS Proxy) and need per-session semantics that a pooler does not provide.
- [ ] Decide the policy on `MAX_ROW_COUNT` overrides. The library refuses at 1,000 rows by default; the open question is whether an explicit `maxRows: 50_000` should be a warn or a refuse.
