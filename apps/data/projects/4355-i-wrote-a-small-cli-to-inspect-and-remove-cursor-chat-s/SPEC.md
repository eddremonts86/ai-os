---
id: "4355"
slug: i-wrote-a-small-cli-to-inspect-and-remove-cursor-chat-s
title: I wrote a small CLI to inspect and remove Cursor chat sessions
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49520816"
category: show-hn
date: "2026-09-01"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# I wrote a small CLI to inspect and remove Cursor chat sessions

## Problem

Cursor stores chat session history in SQLite but lacks a way to delete individual chat sessions or by folder or repository.After accumulating hundreds of sessions, I needed a way to clean up specific conversations and even chat sessions from specific folders.With that in mind I built a small Python CLI that let you do that.It can be installed with brew: brew install vilaca/tap/cursor-chat-cleaner

pip: pip install cursor-chat-cleaner

by cloning the repo: https://github.com/vilaca/cursor-chat-cleaner

For safety there's a --dry-run parameter and chat sessions are only deleted when --yes is present in the command.Chats are deleted from the both the database and the file system and there's a possibility of doing backups (but no restore command yet).As a bonus there's a 'stats' sub command that shows the models and tokens spent for each chat session.This was exclusively tested in MacOs (Sequoia) with the latest Cursor version but should be fairly simple to port to other operating systems.

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
