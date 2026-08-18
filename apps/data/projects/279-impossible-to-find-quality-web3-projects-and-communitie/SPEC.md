---
id: "279"
slug: impossible-to-find-quality-web3-projects-and-communitie
title: Impossible to find quality Web3 projects and communities due to information noise and fraud
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/finance/1yr4ejpc51-impossible-to-find-quality-web3-projects"
category: finance
date: "2025-12-01"
tags: [Web3, Other]
country: Netherlands
tech: [Next.js 14, TypeScript, PostgreSQL, Etherscan / Solana RPC APIs, GitHub API, OpenAI GPT-4o, Stripe]
---
# Impossible to find quality Web3 projects and communities due to information noise and fraud

## Problem

Web3 users in the Netherlands (and globally) cannot find quality Web3 projects and communities because information channels (Twitter, Discord, Telegram) are saturated with noise, scams, and low-signal launches. The poster wants a curated, evidence-based directory that filters for actual project quality rather than hype.

## Objective

Ship a curated Web3 project and community directory that scores projects on evidence-based dimensions (code activity, on-chain transaction history, team transparency, community engagement quality) and surfaces a ranked list of high-signal projects by category and chain.

## Target Users

Web3 users in the Netherlands and EU who want to discover quality projects without wading through noise. Web3 investors and researchers. Web3 builders looking for communities to join.

## MVP Scope

Web app with project submission and verification pipeline, evidence-based scoring across code, on-chain, team, and community dimensions, ranked directory by category and chain, and per-project detail page. Stripe for premium verification tier.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/finance/1yr4ejpc51-impossible-to-find-quality-web3-pr` follows the constraints in `279-.../SPEC.md` and the chosen stack (Next.js 14, TypeScript, PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Netherlands.

For Netherlands, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Must respect each chain's RPC rate limits. Scoring must be transparent — projects can dispute scores. Source does not state a price.
