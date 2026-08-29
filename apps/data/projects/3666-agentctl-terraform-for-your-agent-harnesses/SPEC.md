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

## Problem

The author uses several different CLI tools (opencode, Claude, agy) and has to set them up separately, but wants more or less the same setup across tools with different models. He also wants a simple way to store and sync this configuration between machines. He is experimenting with a tool that gives Terraform-style management for agents.

Two architectural stances are explicit and load-bearing. The first is the rejection of the shared-folder fix: "I know that many people would like if they all just use shared folder like ~/.agent(s), but for me it will never happen. It's like wait that GCP and AWS will unify API". The shared-folder approach assumes the CLI tools will converge on a single config layout; the author thinks that will not happen, the same way GCP and AWS will not unify their APIs. So the tool has to manage multiple distinct CLI configurations, not assume a shared home. The second is the closing caveat: "Just experimenting with idea, not sure where will it go". This is not a launch announcement; it is an experiment, and the plan has to keep that caveat visible rather than promote it to a roadmap.

The capture does not name the configuration schema, the supported CLIs, the sync mechanism, the auth model for syncing, the model-setup layer, or the guardrails surface. The plan scopes the shape from what the author said and treats the unsaid as design choices rather than facts. The scope of "manage skills, model setup, guardrails and more" is named in the post but only at the level of "we manage these kinds of things"; the specific syntax for each is a design choice.

## Objective

Ship an experimental Terraform-style tool that manages the configurations of multiple distinct agent CLIs (opencode, Claude, agy, and others) from a single declared file, with global configuration that can be overridden per tool, and a simple way to store and sync the declaration between machines — while staying honest that this is an experiment whose direction is not yet set.

## Target Users

- Developers using several agent CLIs (opencode, Claude, agy, and others) who want the same setup across tools without copying files by hand.
- People who switch machines and want the agent configuration to follow them rather than be rebuilt per device.
- Operators who want to declare agent configuration once (skills, model setup, guardrails) and apply it across the CLIs they actually use, rather than per-CLI.
- Experimenters and reviewers the author is sharing the idea with, who want to see what an honest early version looks like.
- Future users (if the experiment lands) who want a Terraform-style workflow for their agent configuration rather than ad-hoc per-CLI files.

## MVP Scope

- A declared configuration file that names the CLIs to manage, the global configuration (skills, model setup, guardrails) shared across tools, and the per-CLI overrides.
- Adapters for the three named CLIs (opencode, Claude, agy) that translate the declared configuration into each tool's native config layout.
- A simple apply step that converges the per-CLI native configs with the declared state, similar in spirit to `terraform apply`.
- A simple storage and sync layer for the declaration, so the configuration follows the user across machines.
- A diff surface so the user can see what would change before they apply, since the apply step touches the per-CLI configs the user already has.
- A documented CLI scope: the three named CLIs in MVP, with the architecture open to additional adapters.
- An honest experiment caveat consistent with the author's own framing, since the project is shared as an idea rather than a finished product.
- A documented rejection of the shared-folder approach: the architecture manages distinct CLI configs, not a unified home.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The author's closing caveat — "just experimenting with idea, not sure where will it go" — has to stay visible; the plan must not promote an experiment to a roadmap.
- The author's explicit rejection of the shared-folder fix has to be respected: the architecture manages distinct CLI configs rather than assuming a unified home.
- The configuration schema is the single source of truth; the per-CLI native configs are derived from the declaration rather than edited by hand alongside it.
- Apply must be safe to run repeatedly: an apply that produces the same per-CLI state on the second run as on the first, because the user will run it often.
- Sync has to be simple; a heavy sync layer would defeat the "simple way to store and sync" framing.
- The CLI adapter layer is fragile by construction; CLIs change their config layout, and the adapters have to be updated with the CLIs.
- The scope is the three named CLIs in MVP; expansion to additional CLIs is open but not promised.
