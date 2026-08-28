---
id: "2617"
slug: anjadhe-privacy-first-ai-assistant-no-account-no-server
title: "Anjadhe – privacy first AI assistant, no account, no server DB"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49395936"
category: show-hn
date: "2026-08-22"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Anjadhe – privacy first AI assistant, no account, no server DB

## Problem

Hi HN, I am Ram. For the last few months I have been building Anjadhe. It is a personal AI assistant for macOS. The main idea is simple: A macOS app where AI does the job of a personal assistant for the user. Not a chat only app where user needs to dig through chats to understand today’s schedule or a project they planned with the ai last week, but a canvas where the user and AI work together around basic tools.I started building this as DYI tool for myself, but at this point I see that its truly useful for me, so sharing with others to see if it can be useful to others too.Here is a quick Demo - https://www.anjadhe.com/demoWhat it can do today:- It reads your incoming email and files the important things: bills with due dates, renewals, receipts, deliveries. A bill becomes a task with a date, by itself. Two booking emails become one trip.
- You set goals by talking to it, not by filling forms. It asks you questions, makes a plan with dated tasks. Later you can say "work got crazy, push everything two weeks" and it moves the whole plan. It always shows you what will change and asks before doing it.
- Routines run without you. On a schedule, or when a certain email or file arrives. Every run leaves a log you can read.
- You can give it some documents you wrote. It learns your writing style and writes new content in your voice. What it learned is a page you can read and edit, not a black box.About privacy: the AI runs on your Mac with llama.cpp. Or you can point it to your own server, or use your own OpenAI/Anthropic key, or use Anjadhe Cloud (open-weight models, free allowance, no account needed). Your data stays in SQLite on your own disk. No account. No telemetry unless you turn it on. The source code of the app and the cloud service is public, so you do not have to trust my words.Honest limitations: it is an early alpha, macOS only. Local models need a Mac with atleast 32gb ram to work. The email features work fine on small models, but the full agent wants a bigger model or a server. Also it is Electron with vanilla JS, no framework. Looking forward to hear your opinions.Demo (2 min): https://anjadhe.ai/demo
Download: https://anjadhe.ai/download
Source: https://github.com/Anjadhe/AnjadheI would love feedback, especially if you think my privacy claims are wrong somewhere. I will be here to answer questions.

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
