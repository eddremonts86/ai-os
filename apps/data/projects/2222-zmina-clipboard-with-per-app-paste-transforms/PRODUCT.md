---
id: "2222"
slug: zmina-clipboard-with-per-app-paste-transforms
title: Zmina – clipboard with per-app paste transforms
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49362442"
category: show-hn
date: "2026-08-19"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Zmina – clipboard with per-app paste transforms

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hi HN,Zmina sits between copy and paste. It reads what's in the clipboard and where you paste, and offers a short list of actions you can apply. Without switching apps.The problem: you copied the log and need to paste it into the issue, but it contains sensitive info (emails, IPs, usernames in paths, etc.). So you need to remove all of these from the log before publishing. It’s probably a couple of regexes.Another problem: you want to paste Rust code into Discord chat. So you have to wrap it in ```rust to have it formatted and highlighted properly.One more: you want to paste a large fragment of text (or code) from the clipboard into an email. As a file. Probably you will: create a new file, paste into it, save the file and then attach it to the email. And then probably you will want to remove this temp file.What about pasting an image from the clipboard as a data URL, pasting CSV as a table into Markdown, pasting JSON as a .env file?I built Zmina to resolve these (and other) problems. Workflow: you copied something -> Zmina detects what it is (JSON, code, SQL, image…) and what it contains (emails, IPs, secrets…) -> you want to paste, and instead of CmdV you hit CmdShiftV (configurable) -> Zmina analyzes the app you want to paste into and offers the list of actions you can apply depending on content you have in the clipboard and the app you are pasting into.Example: you copied a JSON response from log/postman/terminal. You want to paste it into GH issue. Zmina will offer you to Prettify JSON, Wrap in code block (```json) and probably more actions depending on the content. If JSON has secrets, Zmina will offer to redact secrets, if it contains IPs, Zmina will offer to mask IPs and so on.That was one feature. Another feature is a History. Everything you copied is saved. You can search it, filter (type:code lang:rust from:zed when:week), pin items, preview, edit. The same features most clipboard managers offer, but with transformations you can apply to every item, code highlighting, and automatic content detection.macOS only at the moment, since it is my default platform. Built using Tauri (rust + ts for UI) so other platforms could follow without a rewrite.$35 one-time, 14-day trial, no card, no accounts, no signup to download.----Short dev story. The project started as a list of regexes and a few scripts to make my life easier. Then I started to prototype a detection + actions engine in TypeScript. But to make things work as I planned, I needed to know the source and target context. Why offer to paste markdown into Mail? Mail is not going to render it, so the useful action there is “Strip Markdown”. So I needed to wire my engine to the system. I started to prototype an Electron app using the engine I already had. It worked, but it used more resources than I wanted. A utility app should be small and invisible. The next move was to rewrite everything in Rust. And that is Zmina.

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## Jobs To Be Done

_Not written yet — `ai-os plans enrich` fills this section._

## Success Metrics

_Not written yet — `ai-os plans enrich` fills this section._

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_Not written yet — `ai-os plans enrich` fills this section._

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49362442) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
