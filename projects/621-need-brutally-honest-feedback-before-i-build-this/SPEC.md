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

## Problem

The poster keeps running into a specific situation while browsing the web: they land on a site whose design they genuinely like and want to recreate that look in their own work, but the path from "I like this design" to "an AI coding tool that recreates it for me" is missing. They sketch the proposed flow as: website you like → click a Chrome extension → it analyses the site's visual/design system (layout, typography, colors, spacing, components) → produces a structured "design skill" → you hand that to an AI coding tool (Claude Code, Cursor, Lovable, v0) → the AI recreates a similar website. The poster is emphatic about what this is *not*: it is not a screenshot-to-code tool. The output has to be something an LLM can consume as a reusable design specification or instruction set — a tokenised description, not a bitmap.

They are not building yet. The whole post is a pre-build validation request, and the questions they ask the community are the questions the product needs to answer before any code gets written: would you use this, how often, would you pay, what price feels reasonable ($5/mo, $10/mo, $20/mo, or a one-time payment), and whether it needs to be open-sourced. Their stated preference is to learn that nobody wants this now rather than spend a month building it. No landing page, no waitlist, no sales pitch — just brutal-honest feedback before writing the code.

## Objective

Validate, before writing the extension, whether there is a real user need for a Chrome extension that turns a website's visible design system into a reusable LLM-consumable specification — and what shape (price, open-source, frequency) that need actually takes — so the poster does not spend a month building a tool nobody uses.

## Target Users

People who build websites and apps with AI coding tools (Claude Code, Cursor, Lovable, v0) and who already use existing sites as visual references. Implied from the post: solo builders and small teams who want their AI-generated output to match a reference aesthetic without hand-translating a screenshot into prompts. The poster themselves is one such user — they say it is "a problem I keep running into."

## MVP Scope

An MVP only after validation answers the poster's four questions (use / frequency / pay / open-source). If the community signals yes, the smallest shippable thing is: a Manifest V3 Chrome extension that, on click, extracts the active tab's DOM/CSS/computed-style data, maps it to a tokenised design system (typography, colours, spacing scale, layout grid, component primitives), and serialises the result as a single structured "design skill" payload consumable by Claude Code / Cursor / Lovable / v0. The validation phase itself is part of the MVP — the post is evidence that no code has been written yet, and the validation questions are the deliverable that gates the build.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

The poster is explicitly not building yet — code is gated on community answers to the four validation questions. They also frame the distinction with screenshot-to-code tools as a non-negotiable: the output must be a reusable design specification an LLM can act on, not a pixel reconstruction. The poster explicitly asked whether it needs to be open-sourced, which leaves the licensing model as an open question for the community rather than a foregone conclusion.