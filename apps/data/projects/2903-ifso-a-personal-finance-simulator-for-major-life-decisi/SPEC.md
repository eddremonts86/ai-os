---
id: "2903"
slug: ifso-a-personal-finance-simulator-for-major-life-decisi
title: Ifso – A personal finance simulator for major life decisions
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49438730"
category: show-hn
date: "2026-08-25"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Ifso – A personal finance simulator for major life decisions

## Problem

Hello all!Ifso is a personal finance simulator that takes all of your various accounts (like taxable brokerages, retirement accounts, loans, etc) and various life events (like income changes, retirement, purchasing a home, increasing principal contributions to your home mortgage, etc.) and plays it out year by year for you. The simulation engine underneath the hood handles all of the tax math, capital gains math, investment growth rates, home appreciation, vehicle depreciation, loan amortization, and more. You can then create multiple scenarios by duplicating an existing one or creating a fresh new one, and compare two scenarios side by side, helping you understand how big decisions would affect your overall financial wellbeing and goals.This project started off as something I wanted to use myself. I didn't really find a lot of the one-off calculators helpful since they don't take all of the other factors in my finances into account, and they also don't allow flexibility in what you can get out of it. For example, if I wanted to drop investment contributions for a few years and then resume later, a typical investment calculator doesn't allow for that level of granularity.On the other hand, there were a few solutions available out there that did financial simulations (and they're definitely useful, much respect for them), but they felt a bit over-complicated trying to get off the ground. Additionally, they were too pricey for me, and their free tiers don't necessarily let you save your simulations, which I found frustrating. I also had a bit of a hard time with decision making since it didn't feel like comparing scenarios was a first-class citizen feature.That's what led me to start building a simulator myself, I wanted something that felt more intuitive for me and actually catered towards decision making. I wanted to see, for example, what would happen if I sold my house in a few years versus renting it out (I simulate rental properties in Ifso as well). How do both of those scenarios play out if I get a promotion this year and also decide to upgrade my wife's car?Some things to note about Ifso:
- The free tier currently gives you access to the entire simulation engine and one saved scenario. Your scenarios are saved, so it persists across sessions/devices.
- The paid tier is $9/mo or $69/year (dropped down to $59/yr for the first 100 users, and this price is locked in until you cancel). This includes everything in the free tier + unlocks building multiple scenarios and comparing them side by side + Monte Carlo simulations.
- The app is US-specific as of now, if there's demand for supporting other locations I can always look into it.
- There's a number of account types and events that you can configure, and I'm constantly working on adding more. I ultimately want this to be as helpful and dynamic as possible, while remaining approachable and as intuitive as possible.
- There's no bank or account linking, so everything is manual input. You can export your data and you can also delete your account altogether. Data is never shared or sold.
- Sign-in is done via Google OAuth so your setup persists across sessions and devices. There is a short demo video on the site in case you want to see what things look like before signing in.Let me know what you think! In particular, I want to make sure that the overall UX and UI is intuitive. My first set of users had given me feedback that helped me improve the UX, UI, and onboarding flow. If there's parts of the UX that work for you, and other parts that you find unintuitive, please be sure to share. Things make sense to me as I'm building it out, but ultimately it's what you guys think that matters. If there's other features, account or event types, etc. that you think would be valuable, please share that as well!

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
