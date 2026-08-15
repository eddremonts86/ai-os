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

> Product brief — auto-generated then authored.

## Value Proposition

**One-liner:** Turn a website's design system into a reusable spec an AI coding tool can act on — no screenshot-to-code, no hand-translation of pixels into prompts.

The product's distinguishing claim is what it is *not*: not a screenshot-to-code tool. The output is a structured "design skill" (tokens, components, layout rules) that an LLM-driven coding tool (Claude Code, Cursor, Lovable, v0) can consume as instructions. That distinction is the poster's stated reason the tool is worth building at all — without it, several existing screenshot-to-code offerings would already cover the use case.

## Target Users

Builders who already ship websites or apps with AI coding tools (Claude Code, Cursor, Lovable, v0) and routinely point those tools at a reference site to imitate. The poster themselves is the archetype — a solo builder who keeps running into "I like this site, I want this look in my own project" and has no good way to hand it to their AI tool. Implied secondaries: designers prototyping in code, agencies standardising a house style across many client builds.

## Jobs To Be Done

1. Functional — capture a site's design system in one click and emit a spec an AI coding tool can directly consume.
2. Functional — reuse that spec across multiple projects instead of re-prompting per build.
3. Emotional — skip the tedious back-and-forth of trying to describe a design in words well enough for an LLM to recreate it.
4. Social — keep a personal library of "design skills" that match the aesthetic of sites the user admires.

## Success Metrics

The product does not exist yet, and the poster's explicit success criteria for the *validation* phase are the four community questions: (1) would you use it, (2) how often, (3) would you pay, (4) at what price point ($5/mo, $10/mo, $20/mo, or one-time). Source lacked any post-MVP usage metric. No MRR target, retention target, or activation target is in the post — leaving those open rather than inventing them.

## Pricing & Monetization

Source did not state a price. The poster lists four candidate WTP options to ask the community about: $5/mo, $10/mo, $20/mo, or a one-time payment. They also ask explicitly whether the tool needs to be open-sourced. Both pricing and licensing are validation questions, not decisions.

## Competitive Landscape

The poster explicitly distinguishes this from screenshot-to-code tools and frames that distinction as the product's reason for being. Source did not name any specific competitor, and the corpus has no prior plan in this exact niche to point at. Adjacent spaces the post implies exist (LLM-aware design tooling, dev-tools for AI codegen) are not enumerated by the poster.

## Risks & Open Questions

- [x] Risk: the four validation questions come back "no" and the poster correctly chooses not to build.
- [x] Risk: "use" and "pay" answers diverge — people like the idea but won't pay, or will pay once and not renew.
- [x] Open: $5/$10/$20/mo or one-time — community will choose, poster has not.
- [x] Open: open-source vs closed — community will choose, poster has not.
- [x] Open: extraction quality — turning a live DOM into a reusable design spec is hard; the product's value depends on the spec being good enough that the AI's recreation is recognisably similar, not just same-coloured.