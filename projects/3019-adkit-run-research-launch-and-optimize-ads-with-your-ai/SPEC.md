---
id: "3019"
slug: adkit-run-research-launch-and-optimize-ads-with-your-ai
title: "AdKit – Run research, launch, and optimize ads with your AI agent"
status: enriched
source:
  name: manual
  url: "https://betalist.com/startups/adkit?utm_campaign=startup-182664&amp;utm_medium=atom&amp;utm_source=newsfeed"
category: beta
date: "2026-08-18"
tags: [BetaList, Beta, Product]
---
# AdKit – Run research, launch, and optimize ads with your AI agent

## Problem

AdKit centralizes your ad workflow so you can research competitors, create static ads, launch campaigns, and diagnose performance from a chat or dashboard. It connects with leading AI agents and supports Meta, Google, TikTok, Reddit, LinkedIn, and X. You can browse over 500,000 ads, track competitors, clone creatives, and approve agent-drafted changes before they go live. AdKit helps founders, agencies, and growth teams move faster while keeping full control over their ad accounts.

---

## Objective

The MVP delivers a unified ad-ops workspace where a founder or agency operator can research competitor creative, generate static ads, launch campaigns across the six supported networks, and diagnose performance from the same chat or dashboard. The headline capability the source calls out is the human-in-the-loop approval flow: an AI agent drafts changes, and a human clicks "approve" before anything ships to a live ad account. The first release prioritises Meta and Google — the two networks the brief explicitly names first — with TikTok, Reddit, LinkedIn, and X connected behind the same interface once the integrations stabilise. The ad library ships with the 500,000+ creatives the source mentions and a clone workflow that adapts a tracked competitor creative into a draft the operator can edit.

## Target Users

1. **Solo founders and small growth teams** who already run paid social but are tired of juggling six ad-platform dashboards and want one chat surface that orchestrates the work.
2. **Performance marketing agencies** managing multiple client accounts who need a single pane to track competitor creative across all six networks and to clone winning ads.
3. **In-house growth teams at B2B SaaS companies** whose ad spend is concentrated on LinkedIn and Google and who want the same chat-orchestrated workflow for their two-network reality.
4. **AI agent builders and power users** who already use a chat-first tool for other workflows and want their ad operations to follow the same shape rather than a dashboard.
5. **Compliance and brand reviewers** inside larger teams who need an explicit approve-before-ship checkpoint so agent-drafted changes cannot reach a live account without a human signature.

## MVP Scope

- A web dashboard and chat surface backed by the same orchestration engine, so an operator can move between the two without losing state.
- Meta and Google Ads integrations that authenticate via OAuth, read campaign and creative data, and submit draft changes that the operator must approve before they go live.
- A creative library seeded with the 500,000+ ads the source mentions, filterable by network, advertiser, format, and run duration.
- A "clone this ad" workflow that takes a tracked competitor creative, generates a static ad draft in the operator's brand voice, and parks the draft in an approval queue.
- An AI agent connector that lets the operator point AdKit at a leading chat agent (Claude, GPT-class, or the operator's own agent) and run the same research, create, launch, and diagnose flows from inside the agent's chat.
- An audit log of every agent action plus the operator's approval or rejection, so compliance reviewers can replay the change history of any campaign.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The MVP will not auto-publish creative or budget changes; the source describes an approve-before-ship model, and shipping without that gate would betray the product.
- The MVP will not cover video ad creation on day one, despite the source mentioning TikTok; static ads are the explicitly-named format and video is a v2 expansion.
- The MVP will not replace the native ad-platform dashboards for advanced features (Meta's Advantage+ audience editing, Google's bidding strategies) — those remain in the source-of-truth platform.
- The MVP will not support networks outside the six named in the brief; adding Pinterest or Snapchat requires a separate integration scope.
- The MVP will not provide a fully autonomous agent mode; the source says the user approves agent-drafted changes before they go live, and the MVP keeps that contract strict.
