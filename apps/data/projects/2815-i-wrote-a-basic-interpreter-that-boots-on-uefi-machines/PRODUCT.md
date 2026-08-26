---
id: "2815"
slug: i-wrote-a-basic-interpreter-that-boots-on-uefi-machines
title: I wrote a BASIC interpreter that boots on UEFI machines
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49410814"
category: show-hn
date: "2026-08-23"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# I wrote a BASIC interpreter that boots on UEFI machines

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I started writing Thoreau BASIC because I wanted a small, old-fashioned BASIC interpreter: line numbers, immediate mode, simple graphics, strings, arrays, the sort of environment where the computer starts with a "Ready" prompt and you can immediately make it do something.Then I wondered: why should it need an operating system?So I made it boot directly on x64 machines using UEFI.The UEFI version uses the Graphics Output Protocol for its framebuffer and gets its keyboard input directly from the firmware. There is no Windows or Linux underneath it. The machine boots into BASIC.It supports the usual BASIC machinery plus graphics primitives, 32-bit colour, floating point, file operations and other features I've been adding as I encounter programs that need them. There is now also a Windows version, which makes it considerably easier to try.One of my goals is compatibility with the style and behaviour of old Microsoft BASICs rather than creating a modern language that merely happens to use BASIC syntax.I'm currently porting my text adventure Pixel Prose to Thoreau BASIC. That's becoming a much better test suite than artificial tests because every missing feature or subtly wrong behaviour eventually gets exposed by an actual program.The project is deliberately small. The UEFI version greets you with:"I make myself rich by making my wants few."
— Henry David Thoreaufollowed, somewhat ironically on a modern PC, by something like:27,340,685,312 bytes freeI'd be interested in hearing from people who wrote BASIC in the 80s/90s, interpreter/compiler people, and anyone sufficiently strange to still find a Ready prompt inviting.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49410814) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
