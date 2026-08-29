---
id: "3653"
slug: hacker-news-client-with-claude-code-and-codex-integrati
title: Hacker News Client with Claude Code and Codex Integration
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49483436"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Tauri, Rust, TypeScript, React, Hacker News API (Firebase), Claude Code CLI, Codex CLI, SQLite (local)]
---
# Hacker News Client with Claude Code and Codex Integration

## Problem

The capture is in the author's own words and is unusually clear. He often finds interesting things in Hacker News posts and comments, but threads are long and take a lot of time to go through. He built Rundown for that. It is a cross-platform desktop app with Claude Code and Codex integration that gives a rundown of the post and comments, with links back to the comments it pulled each bit from. He can also chat with the post or the entire thread.

Three engineering claims do the work. First, the app is a cross-platform desktop app, which puts it on a desktop runtime (Tauri or Electron are the natural candidates) rather than a web page. Second, the integration is with Claude Code and Codex specifically — two coding-agent CLIs — not with a hosted chat model. Third, and most importantly, the citation design: every bit the rundown pulls is linked back to the comment it came from. That is the load-bearing detail. A summary without citations is just another summary; a summary with citations back to source is something the reader can verify and trust, which is the whole point of using a local agent on a thread.

What is not stated is whether the rundown is generated locally or routed through a hosted model, the depth of the comment-tree walk (top-level only, or full tree), and whether the chat feature routes to Claude Code and Codex as subprocesses or to hosted APIs. Those are honest gaps. The plan scopes what is knowable from the post and from general engineering knowledge of desktop apps and coding-agent CLIs, not from anything the author said.

## Objective

Ship a cross-platform desktop app, named Rundown, that turns a Hacker News post and its comment thread into a cited rundown the user can read quickly, with each bit of the rundown linked back to the comment it was pulled from, and a chat surface that lets the user talk to the post or the entire thread through Claude Code and Codex.

## Target Users

- Hacker News readers who find useful threads but do not have time to read every comment.
- Knowledge workers who treat a long HN thread as a research artifact and want a cited summary they can verify.
- Power users who want to ask follow-up questions of a long thread through Claude Code or Codex rather than reading the whole thing themselves.
- Researchers and writers who cite HN threads in their own work and want the citation to be a real link, not a paraphrase.
- Cross-platform users who want a desktop tool rather than a web page that requires an account.

## MVP Scope

- A cross-platform desktop app that runs on macOS, Windows and Linux.
- Input: a Hacker News post URL or post ID, fetched from the public HN API.
- A rundown of the post and its comments that surfaces the interesting bits in a readable order, with each bit hyperlinked back to the specific comment it came from.
- A comment-tree walk that at minimum covers the top-level and the highest-voted replies, with a stated depth rather than an unbounded tree.
- A chat surface where the user can talk to the post or the entire thread.
- Claude Code and Codex integration: the chat routes through the locally installed CLI of either, so the user's own Claude Code or Codex subscription and credentials are used.
- A persistent local store of fetched posts and rundowns so the user can return to a rundown without re-fetching.
- A small settings surface for choosing the default runner (Claude Code or Codex) and the model within it.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The rundown must cite back to the source comment by link, because the citation design is what distinguishes the app from a generic summary.
- The chat integration must use Claude Code and Codex as the user runs them locally; the app does not embed a hosted model.
- The app is desktop, not a web page, because the post explicitly says "desktop app" and the chat integration depends on a local CLI being available.
- The comment tree is bounded: a runaway tree walk that exhausts tokens or stalls the UI is a real failure mode, so the depth must be a stated number.
- The capture has no statement of comment depth, hosted-vs-local model, or UI surface, so anything beyond the title's three claims is not claimed here.
