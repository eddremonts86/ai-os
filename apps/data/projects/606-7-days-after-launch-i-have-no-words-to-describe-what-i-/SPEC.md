---
id: "606"
slug: "7-days-after-launch-i-have-no-words-to-describe-what-i-"
title: "7 days after launch... i have no words to describe what i am feeling right now (following my former post)"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1voupxz/7_days_after_launch_i_have_no_words_to_describe/"
category: saas
date: "2026-08-15"
tags: [saas, gaming, sports, browser-game]
tech: [Next.js, TypeScript, Supabase, Stripe]
---
# 7 days after launch, I have no words to describe what I have done

## Problem

A founder launched Hoops GM a week ago. There was backlash in the previous post due to an IP lawsuit, but also a lot of praise. The launch was a "massive success" with over 5,000 visits to the game and an average of 50 new signups per day. The implicit product: a basketball management browser game with strong launch traction and IP-related copycats to defend against.

## Objective

Define the MVP scope for Hoops GM as a basketball management browser game, with the launch traction and IP-defence considerations as the working constraints. The MVP has to demonstrate the round-trip: sign-up → draft a team → play a season.

## Target Users

- **Primary:** sports-management game fans (Football Manager, OOTP, Basketball GM) who want a basketball-specific alternative.
- **Secondary:** basketball fans who want to role-play as a GM.
- **Tertiary:** streamers and content creators who cover sports-management games.

## MVP Scope

- Browser-based basketball management game (text + simple visualisations).
- Single-player career: draft a team, play a season, manage the roster.
- Multi-season save with cloud sync.
- Free tier: 1 active career, no multiplayer. Pro at $4.99/month: unlimited careers, multiplayer leagues, custom leagues.
- Excluded in v1: mobile native, console, esports integration, real-money leagues.

## Design Direction

See `DESIGN.md` for this project's design tokens. Default visual: a single game surface — the team dashboard at the top, the schedule in the centre, the league standings on the right. No marketing-site chrome; the product is the game.

## Constraints

- The IP lawsuit from the previous post is the working constraint; the brand and visual identity must be defensible.
- Cloud sync must work for the Pro tier; a save-the-game failure is the worst possible UX.
- The launch traction (5K visits in week 1) implies the founder needs to scale hosting fast.
