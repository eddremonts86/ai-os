---
id: "3227"
slug: another-webpage-screenshot-and-og-image-generation-api
title: Another Webpage Screenshot and OG Image Generation API
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49464305"
category: ask-hn
date: "2026-08-27"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Another Webpage Screenshot and OG Image Generation API

## Problem

A few years ago, I tried developing a product on my own but eventually gave up and stepped away for a while. Now, I’ve decided to give it another shot.Shotium is an API for generating screenshots and OG images (social media share images)—simply pass in a URL, and you get back a rendered image. It is built on the actual Chromium engine, so it offers full support for CSS and web fonts. I am particularly proud of its SSRF (Server-Side Request Forgery) protection mechanism: every browser request passes through a "pinning proxy," eliminating the security risks that can arise between domain resolution and connection establishment—after all, an unprotected renderer capable of fetching arbitrary external URLs could easily be exploited to scan internal ports.The project launched just eight days ago, and I don't have any paying customers yet. I’m not posting this to pitch the product; rather, I genuinely want to hear from people with experience in automated screenshot or social media image generation: What solutions did you use? What features do you feel are still missing?https://shotium.com

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
