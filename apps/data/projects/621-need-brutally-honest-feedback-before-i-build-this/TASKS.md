---
id: "621"
slug: need-brutally-honest-feedback-before-i-build-this
title: Need brutally honest feedback before I build this
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vp0g1n/need_brutally_honest_feedback_before_i_build_this/"
category: saas
date: "2026-08-15"
tags: [chrome-extension, design, ai-codegen, dev-tools, validation]
scores:
  money: 5.5
  learn: 6
  fun: 6.5
---
# Need brutally honest feedback before I build this

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise git repo
- [ ] Copy `edd-app-template` → `apps/621-need-brutally-honest-feedback-before-i-build-this/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Configure `tailwind.config.ts` with DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Post the validation question to r/SaaS (already done) and cross-post to r/SideProject and r/ChatGPTCoding where the use case (AI-coding-tool users) is denser.
- [ ] Tally responses to the four questions: would you use it, how often, would you pay, what price point ($5 / $10 / $20 / mo or one-time), and open-source vs closed.
- [ ] Decide go / no-go based on the validation signal — poster's stated preference is to walk away early if demand is not there.
- [ ] If go: scope a single reference site (poster's choice) and hand-extract its design system to validate the "spec round-trip" idea before writing any extension code.
- [ ] If go: pick the first AI coding tool target (Claude Code, Cursor, Lovable, or v0) and define the exact output format that tool can ingest directly.
- [ ] If go: scaffold a Manifest V3 Chrome extension with an empty click handler, then layer in DOM/computed-style extraction on the chosen reference site.
- [ ] Validate the extracted spec against the round-trip test: hand the spec to the chosen AI tool, compare the recreation to the source, iterate until the recreation is recognisably similar.

## Phase 2: Deploy

- [ ] Create GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Lúa generated this analysis automatically on 2026-08-15_
