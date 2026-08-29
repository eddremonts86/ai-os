---
id: "850"
slug: problem-of-promoting-on-reddit-for-beginners
title: Problem of promoting on Reddit for beginners
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/marketing/rs2248ze51-problem-of-promoting-on-reddit-for-begin"
category: marketing
date: "2025-11-09"
tags: [Marketing, AI, Other]
country: UK
tech: [Vue 3, TypeScript, Vite, Rust rules-engine compiled to WASM, Cloudflare Workers for hosted checks, Cloudflare KV for subreddit-rule snapshots, Reddit JSON API (.json endpoints), Coolify]
---
# Problem of promoting on Reddit for beginners

## Tech Stack

- **Vue 3 with TypeScript and Vite** for the browser surface, since the beginner meets the tool on a fast-loading static page and Vue's reactivity keeps the pre-post draft check responsive.
- **A Rust rules-engine compiled to WebAssembly** for the per-rule match path, so the pre-post draft check runs locally in the beginner's browser and does not require a server round-trip per rule.
- **Cloudflare Workers** for the subreddit-lookup API and the moderation-log reader, with the worker's edge-cached responses so the brief loads fast for a beginner on a slow connection.
- **Cloudflare KV** for the subreddit-rule snapshots and the moderation-log summaries, refreshed on a stated cadence so the brief reflects the subreddit's current sidebar.
- **Reddit's public JSON endpoints** as the data source for subreddit rules, recent posts, and the moderation log where the subreddit has one — accessed via the public `.json` API the source describes.
- **Docker** for local and staging runs of the worker, and **Coolify** for self-hosted production of the back-end surface, matching the per-plan deployment shape used across this corpus.

## Architecture

The tool has three surfaces — a subreddit-lookup surface, a pre-post draft check, and a ban-recovery surface — and one subreddit-brief model underneath. The brief carries the subreddit's stated rules from the sidebar, the language-pattern summary from recent posts, and the most common removal reasons from the moderation log where the subreddit has one. The brief is the source of truth the pre-post draft check reads against.

The subreddit-lookup surface takes a subreddit name and returns the one-page brief. The brief is rendered as a Vue component, with the rules listed in plain English, a sample of recent posts the beginner can read, and the removal-reason summary where the moderation log provides it. The surface respects Reddit's API terms and does not store or display content the subreddit has not made public.

The pre-post draft check runs locally in the beginner's browser through the Rust rules-engine compiled to WebAssembly. The beginner drafts a post, the rules-engine matches the draft against the subreddit's stated rules from the brief, and the engine surfaces per-conflict explanations in plain English. The check is rules-based, not LLM-generated: every flag the engine surfaces is traceable to a stated rule, so the beginner can audit the conflict rather than trust the engine.

The ban-recovery surface takes a pasted removal or ban message and runs it through a small classifier that matches the message against a corpus of common Reddit moderator language. The classifier surfaces the rule the moderator most likely invoked, in plain English, with a link to the subreddit's stated rule where it exists. The classifier is a starting point, not a verdict — a removal message that does not match a known pattern is surfaced as "no match found, contact the subreddit's moderators directly."

The subreddit-brief cache is the operational surface. The worker pulls subreddit rules, recent posts and the moderation log on a stated cadence, normalises the brief into the brief model, and writes the snapshot to Cloudflare KV. The brief the beginner sees is the cached snapshot, not a live read of the subreddit, so the brief loads fast and does not hammer Reddit's public endpoints.

The honesty boundary is surfaced on every page. The tool's stated purpose is pre-post guidance, not post-optimization that hides promotion behind language tricks. The boundary is a documented part of the tool's contract with the beginner: a beginner who uses the tool to disguise a promotional post as non-promotional is using the tool against its stated purpose, and the README says so explicitly.

The language-pattern hint shows recent posts and lets the beginner read them. The tool does not score or rank the pattern, does not generate a model post the beginner can copy, and does not provide a tone-shifter. The beginner reads the recent posts and decides what to write.

## Milestones

1. **M1 — Subreddit-lookup brief** — the subreddit-rules ingestion, the sidebar normalisation, the one-page brief render.
2. **M2 — Recent-posts language-pattern surface** — the recent-posts ingestion, the language-pattern summary, the beginner-readable sample.
3. **M3 — Moderation-log reader** — the moderation-log ingestion where the subreddit has one, the removal-reason summary, the honest "no public moderation log" state.
4. **M4 — Rust rules-engine compiled to WASM** — the per-rule match path, the per-conflict explanation, the local-browser execution.
5. **M5 — Pre-post draft check** — the draft-input surface, the rules-engine integration, the per-conflict explanation view.
6. **M6 — Ban-recovery surface** — the removal-message classifier, the rule-match output, the plain-English explanation.
7. **M7 — Honesty boundary surface** — the documented purpose page, the README, the per-page honesty reminder.
8. **M8 — Cadence and cache** — the per-subreddit refresh cadence, the brief-cache invalidation, the worker load profile.

## Risks

- **Reddit API terms drift** — Reddit changes its API terms and the subreddit-lookup or the moderation-log reader breaks. Mitigation: the public `.json` endpoints are the documented public surface; the tool does not depend on authenticated access.
- **Rules-engine false positives** — the engine flags a draft that does not actually conflict with a stated rule, and the beginner ignores the tool. Mitigation: per-conflict explanations trace back to a stated rule; the beginner can audit the conflict.
- **Ban-recovery classifier overreach** — the classifier suggests a rule the moderator did not invoke, and the beginner acts on the wrong assumption. Mitigation: the classifier surfaces "no match found" when the message does not match a known pattern, and the per-rule output is presented as a likely match, not a verdict.
- **Subreddit sidebar drift** — the subreddit changes its sidebar and the brief becomes stale. Mitigation: the brief cache is refreshed on a stated cadence, with the freshness timestamp surfaced on the brief.
- **Disguised-promotion usage drift** — the beginner uses the tool to disguise a promotional post as a non-promotional one. Mitigation: the honesty boundary is documented on every page, and the tool's purpose page states the pre-post guidance scope explicitly.
- **Moderation-log sparsity** — many subreddits have no public moderation log, and the tool's value is thinner for those subreddits. Mitigation: the honest "no public moderation log" state is surfaced rather than hidden, and the brief still carries the sidebar and the recent-posts sample.
- **English-only scope pressure** — a beginner whose first language is not English may find the tool's plain-English explanations hard to apply. Mitigation: the source country is the UK and the post is in English; localisation is out of scope at MVP.
