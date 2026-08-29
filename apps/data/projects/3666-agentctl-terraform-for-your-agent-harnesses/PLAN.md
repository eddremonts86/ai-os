---
id: "3666"
slug: agentctl-terraform-for-your-agent-harnesses
title: Agentctl – Terraform for your agent harnesses
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49482426"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Go, Terraform-style HCL dialect, SQLite, Cobra CLI, opencode CLI adapter, Claude CLI adapter, agy CLI adapter]
---
# Agentctl – Terraform for your agent harnesses

## Tech Stack

- **Go** for the CLI binary, because Terraform-style tools are most naturally Go programs and the small single-binary surface fits the "simple tool" framing.
- **A Terraform-style HCL dialect** for the declaration file, because the post names Terraform explicitly and HCL is the well-known syntax for declarative configuration.
- **SQLite** for the local state (last applied declaration, per-CLI state hashes), so the tool can compute diffs and verify idempotency without an external database.
- **Cobra** for the CLI command surface (`agentctl plan`, `agentctl apply`, `agentctl sync`), so the commands match the Terraform mental model the author references.
- **Per-CLI adapters** for opencode, Claude and agy, each translating the declared configuration into the CLI's native config layout.
- **A simple sync transport** (git, file copy, or a small dedicated store) so the declaration follows the user across machines without a heavy sync layer.
- **A diff renderer** that shows what would change in each per-CLI config before apply, since apply touches configs the user already has.

## Architecture

The declaration file is the single source of truth. It names the CLIs to manage, the global configuration (skills, model setup, guardrails) shared across tools, and the per-CLI overrides. The apply step computes the desired per-CLI native config from the declaration, diffs it against the current per-CLI native config, and writes the diff. The local state is stored in SQLite with a hash of the last applied per-CLI configs, so the next apply can prove idempotency by showing no diff when nothing has changed.

The per-CLI adapters are the architectural commitment to "managing distinct CLI configs rather than assuming a unified home". Each adapter knows the CLI's native config layout: file path, format, naming convention, and any quirks. When the declaration changes, the adapter translates the new state into the CLI's native shape and writes it; when the CLI's config has drifted by hand, the next apply overwrites the drift with the declared state. The user can see what would change before the overwrite, because the diff is shown first.

The sync layer is intentionally simple. The declaration file is the artifact that moves between machines; the transport is left as a documented choice (git for the developer who already uses git, a file copy for the developer who does not, a small dedicated store if the user wants one). A heavy sync layer would defeat the framing, so the architecture treats the declaration file as a plain artifact and the transport as a user choice.

The experiment caveat is structural. The author closes the post with "just experimenting with idea, not sure where will it go", and the architecture has to respect that. MVP scope is the three named CLIs (opencode, Claude, agy) plus the declaration, apply, diff, and sync primitives. Expansion to additional CLIs is open but is framed as roadmap, not as a launch promise. The CLI scope is documented honestly so the user does not assume coverage the project does not have.

Apply is the load-bearing primitive. It has to be safe to run repeatedly: a second apply against the same declaration produces no diff and no change. The SQLite-backed state hash is the proof; the test harness asserts it. The diff surface is the user-visible half of the same property: before apply, the user sees what would change in each per-CLI config, with the option to abort. The combination of idempotency and visible diff is what makes a Terraform-style tool trustworthy.

## Milestones

1. **M1 — Declaration schema** — the HCL dialect for global config, per-CLI overrides, and the supported fields (skills, model setup, guardrails).
2. **M2 — Per-CLI adapters** — adapters for opencode, Claude and agy, each translating the declaration into the CLI's native config layout.
3. **M3 — Apply and state** — the apply step with SQLite-backed state, idempotency proven by a state-hash check, and a `plan` command that shows the diff without applying.
4. **M4 — Diff surface** — a diff renderer that shows what would change in each per-CLI config before apply.
5. **M5 — Sync transport** — a simple sync layer over the declaration file, with git and file copy as documented options.
6. **M6 — Honest experiment disclosure** — the "just experimenting" caveat visible in the project, with MVP scope (the three named CLIs) and roadmap framed separately.
7. **M7 — Idempotency test** — a test harness that proves repeated apply produces no diff, since this is the load-bearing claim.

## Risks

- **Experiment overpromise** — promoting an experiment to a roadmap would overpromise; the caveat has to stay visible.
- **Shared-folder regression** — the architecture has to keep managing distinct CLI configs, not slip toward a unified home.
- **Apply idempotency drift** — a Terraform-style tool that produces different state on repeated runs is broken; the test harness has to assert it.
- **CLI adapter fragility** — CLIs change their config layout; the adapters have to be updated with the CLIs, and the supported-version list has to be published.
- **Sync complexity creep** — a heavy sync layer would defeat the framing; the architecture has to keep sync simple.
- **Diff surprise** — apply touches configs the user already has; the diff surface has to be visible and the abort path has to work.
- **CLI scope creep** — promising CLIs the project does not yet support would mislead; the scope is documented honestly.
