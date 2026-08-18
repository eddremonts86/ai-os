---
id: "2945"
slug: "1667-a-terminal-ui-for-writing-fiction-with-language-mo"
title: "1667, a terminal UI for writing fiction with language models"
status: draft
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49330604"
category: show-hn
date: "2026-08-17"
tags: [Show HN, Product, Problem]
---
# 1667, a terminal UI for writing fiction with language models

## Problem

Hi HN. I built 1667 for my own fiction work and now use it each day. This probably has a limited audience. Maybe an audience of one...Why a terminal interface for story writing? I'm a dev. I like to use terminals for a lot of stuff. Most WebUIs feel off to me. That's the only reason.One thing that bothers me about writing in existing tools is that they don't fit the way I write. The mental model of my story is a tree. I try many takes usually continue with just one, but sometimes I want to try an alternate route and see where this goes. And that can branch again in many places. See what happens if I kill off this character or they don't take the job or whatever.1667 is a full-screen terminal app for long-form fiction. Each story part can have several takes. All takes stay in a tree. You select one path through that tree as the story line. Export writes that line to Markdown in the project folder.Some technical details:
- A project stores its stories and settings in a `.1667/` directory. Exported Markdown sits beside it.
- Provider secrets stay in private machine files. Requests go to the provider that the writer selects.
- An optional Vault Password seals project files at rest.
- An operating-system lock permits one writer process for each project.
- The request viewer shows the next provider request without its credential.
- Each generated take keeps a Generation Record with its model and effective settings.Version 0.9.5 runs on macOS, Linux, and Windows x64. The website has Shell and PowerShell installers. An npm package is also available.1667 imports Markdown, SillyTavern chats and cards, and NovelAI archives. It can use OpenAI-compatible, Anthropic, and local endpoints such as Ollama, LM Studio, llama.cpp, and KoboldCpp.Current limits: the release is pre-1.0. The interface is a terminal. There is no account or cloud sync, and I don't plan to add any. No tracking.

---

## Objective

_Not written yet — `ai-os plans enrich` fills this section._

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## MVP Scope

_Not written yet — `ai-os plans enrich` fills this section._

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

_Not written yet — `ai-os plans enrich` fills this section._
