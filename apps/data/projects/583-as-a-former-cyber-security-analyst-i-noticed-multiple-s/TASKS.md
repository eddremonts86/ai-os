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

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise git repo
- [ ] Copy `edd-app-template` → `apps/583-as-a-former-cyber-security-analyst-i-noticed-multiple-s/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Configure `tailwind.config.ts` with DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Map the 7 supported languages to the AST / Tree-sitter grammars the scanner will use.
- [ ] Implement the OWASP top-10 rule pack (IDOR, CSRF, SQLi, CMDi at minimum, per the author's bug-bounty examples).
- [ ] Implement the `.env`-in-`.gitignore` and credential-leak checks called out in the source.
- [ ] Wire the CLI for the personal tier — scan a directory, output structured findings.
- [ ] Build the attested PDF report generator for the agency tier.
- [ ] Ship the CI token flow so an agency pipeline can invoke the scan and pull the PDF.

## Phase 2: Deploy

- [ ] Create GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production
