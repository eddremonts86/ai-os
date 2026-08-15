---
id: "583"
slug: as-a-former-cyber-security-analyst-i-noticed-multiple-s
title: SaaSecure — fully local code scanner for AI-generated code
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vok0ky/as_a_former_cyber_security_analyst_i_noticed/"
  captured: "2026-08-14"
category: security
date: "2026-08-14"
tags: [security, ai, devtools, b2b, ast-analysis, code-scanning]
wtp:
  raw: $79 lifetime / $199 agency
  currency: USD
  min: 79
  max: 199
  period: one-shot
scores:
  money: 7
  learn: 6
  fun: 6
---
# SaaSecure — fully local code scanner for AI-generated code

## Tech Stack

Static analysis core in a language with mature AST/SAST tooling (the author lists 7 languages supported, including PHP, JS and Python — typical stack is a Tree-sitter-based parser with a Rust or Go core, plus per-language rule packs). A small local CLI for the personal tier. A minimal web UI or report renderer for the agency-tier PDF export. No cloud is required — the author explicitly markets "fully local".

## Architecture

Three components: (1) a code-ingest and AST-walk pipeline that converts the target codebase into a language-tree representation, (2) a rule engine that runs the OWASP top-10 + `.env` hygiene + credential-leak rules against that tree and produces structured findings, (3) a report layer that renders the findings in the CLI for personal users and in an attested PDF for agency users. The CI token is a signed artefact that lets an agency pipeline invoke the scan and pull the report without exposing the codebase.

## Milestones

M1: tighten the 7-language rule coverage the author already advertises (PHP, JS, Python are named; the other four are not in the source). M2: ship the attested PDF report generator for the agency tier. M3: package the CI token flow so an agency can drop a step into a GitHub Actions / GitLab CI pipeline. M4: refresh the live site at [saasecure.penqn.in](https://saasecure.penqn.in) to reflect the personal vs agency split cleanly.

## Risks

Risk: every new model release shifts the AI-generated-code baseline, so the rule packs need a continuous-update loop or the scanner's findings will go stale. Risk: a 7-language promise is a real maintenance cost — each language is its own parser + rule set. Risk: the "fully local" promise is part of the brand, but the agency CI token creates a thin trust boundary around the report attestation path that has to be airtight. Risk: distributing a one-time-payment licence against a perpetual update promise binds the author to a long support tail without recurring revenue.
