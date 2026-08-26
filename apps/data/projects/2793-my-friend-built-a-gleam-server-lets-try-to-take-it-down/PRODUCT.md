---
id: "2793"
slug: my-friend-built-a-gleam-server-lets-try-to-take-it-down
title: "My friend built a Gleam server – let's try to take it down"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49426508"
category: show-hn
date: "2026-08-24"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# My friend built a Gleam server – let's try to take it down

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hi! My friend, who I'm mentoring, had some free time and was looking for something interesting to build. I suggested he take a look at Gleam, since I've been interested in the language myself, and build both the backend and frontend for a project that fits the spirit of the BEAM ecosystem well.The result is https://kms.andrewpavlov.org/.Using the UI on the website, you can gradually increase the load and watch how the server's CPU and RAM usage respond in real time.Maybe the HN effect will do its job and take the server down. Although I have a feeling the BEAM might survive. :)For those hearing about Gleam for the first time: Gleam is a functional, statically typed programming language that compiles to both Erlang and JavaScript. This makes it possible to build backend and frontend code in the same language and, where appropriate, share code between the two targets.On the backend, Gleam runs on the Erlang VM (BEAM), giving it access to Erlang/OTP's lightweight concurrency, fault tolerance, and supervision model. Failures in individual processes can be isolated from other processes rather than necessarily bringing down the entire application.On the frontend, Gleam's type system catches many classes of errors at compile time, which can significantly reduce runtime bugs. The programming model is somewhat reminiscent of Elm, while still being part of the broader BEAM ecosystem.The project is open source, and the website itself is inspired by the Gleam website.I think Gleam is an interesting technology for building highly concurrent applications, especially real-time systems where Erlang and Elixir have already proven themselves at scale. WhatsApp and Discord are good examples of what the BEAM ecosystem is capable of.My friend built the project and will be answering questions in the comments. I'll be following along as well.Let's see if the HN effect can take it down. :)

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49426508) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
