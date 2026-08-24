---
id: "2022"
slug: offline-rag-on-ios-with-spatial-integration
title: Offline RAG on iOS with Spatial Integration
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49371913"
category: ask-hn
date: "2026-08-20"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Offline RAG on iOS with Spatial Integration

## Problem

I'm the developer behind CartoType. I’ve been working on bridging local language models with offline mapping, and I have just put together a demo of a completely offline Spatial RAG pipeline running natively on an iPhone. The new system is named the CartoType Field Assistant. You can find the website at https://cartotype.comDemo (1m 19s): https://www.youtube.com/shorts/a8yQPn7_jyIUse cases: Any organisation with field technicians or emergency first responders needs complex procedural knowledge tied to physical locations ('assets') where they don't have guaranteed network connectivity. Examples include offshore wind farms, power distribution networks, railway infrastructure, mountain rescue, and military uses.For this demo I query the iPhone app in Airplane mode: "A hiker near Tuolumne Meadows has a dislocated shoulder. What is the reduction protocol, and where is the Tuolumne Meadows Ranger Station?"HOW IT WORKSThe core is a portable C++ engine running vector search across an encrypted, on-device SQLite database. The database contains the user's proprietary manuals, chunked and converted into embeddings. The search finds relevant chunks and uses them as a prompt for a local LLM (Gemma). This process is RAG (Retrieval-Augmented Generation).Spatial integration is provided by connecting assets in the map to a table in the database and using the table to find any assets referred to in queries and pan the map to them.Everything runs on-device with no API keys or cloud dependencies. The demo app is written in Swift and uses the CartoType framework, which provides a wrapper over the underlying core API giving asynchronous and synchronous access to the AI functions.DATA PREPARATIONTo get up and running, the user creates a map containing the assets, using CartoType's makemap tool, then feeds the map and their proprietary documentation into CartoType's makedata tool, which writes the encrypted SQLite database to be stored on the device. The map, which may also be encrypted, is also stored on the device. The CartoType library, when running the Field Assistant's RAG system, also provides full map rendering, location searching, routing and geocoding as it always has done.

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
