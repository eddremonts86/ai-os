---
id: "502"
slug: built-and-nba-roster-building-game-with-a-salary-cap
title: Built and NBA roster building game with a salary cap
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SideProject/comments/1vnyun5/built_and_nba_roster_building_game_with_a_salary/"
category: sideproject
date: "2026-08-14"
tech: [Next.js, TypeScript, PostgreSQL, Resend, Vercel]
---
# Built and NBA roster building game with a salary cap

## Problem

Source: [reddit.com/r/SideProject/comments/…](https://www.reddit.com/r/SideProject/comments/1vnyun5/built_and_nba_roster_building_game_with_a_salary/)

Original post:

> I've been playing 82-0 for months — if you haven't seen it, the idea is you spin for random legends and try to build a starting five that could beat the '96 Bulls (72-10) or the '15 Warriors (73-9). It's a great concept because it forces you to actually think about who fits together, not just "who's the best player ever." A few spinoffs have added "cap modes" since then, but every one I found uses some made-up flat number like $100. That always felt off to me — there's no real tension in staying under an arbitrary budget. So I ended up building my own version where the cap actually means something. In my version, every player costs their real historical salary as a percentage of the actual salary cap that season. That alone changes how the game plays — a modern max-contract guy eats a way bigger chunk of a 1980s cap than an 80s legend eats of today's cap, because contracts weren't stratified the same way back then. So depending on which decade you get randomly assigned, the whole calculus of who's "expensive" flips on its head. I also went further and built in the actual mechanics that make real NBA cap management annoying — soft cap, luxury tax, first apron, and second apron. Going over the first apron gets you a real efficiency/fit penalty. Cross the second apron and it doesn't just stop you — your team still plays, but it eats a serious hit (up to 35% off Efficiency and Fit), which is basically what happened to the Suns when they stacked three supermax guys and still lost in the first round. If you truly can't afford anybody left for an empty position, you hit a "Cap Bust" screen that tells you exactly why (cheapest guy at that position costs $X, you're $Y short). You can also knowingly sign someone you can't afford if you want to gamble on it — there's a confirm step before it locks in the bust. Honestly the whole thing started from an argument I have with myself constantly: everyone (including me) loves to armchair-GM real teams — "why'd they pay him that much," "I could build a better roster than this" — and I wanted something that actually tested that. Doing it with real dollars and real penalties forces you to make the same tradeoffs a real front office does, not just draft the five best players you can think of. Built this solo — started in Lovable, moved it to Replit once I wanted more control over the code, domain's through Porkbun, using Resend to power an in-app feedback button since I wanted a low-friction way for people to tell me what's broken or what they want to see. No login required to play, no monetization, just wanted to build something fun and see if other people got into it the way I have. There's an Era Mode (you get a random historical cap and can draft anyone from any decade) and a Modern Mode (today's actual cap). Also added a daily challenge — everyone gets assigned the same random decade and cap that day, and you're competing on a leaderboard under identical constraints, which has been a fun way to compare builds with actual apples-to-apples comparisons instead of everyone playing a totally different randomized setup. If you want to poke at it: undertheapron.app. Screen recording of me playing the game. Would love to hear what's confusing, what breaks, or what you'd want to see added — there's a feedback link in the app too if that's easier than commenting here. submitted by /u/InternSmooth6119 [link] [comments]

---

What this plan addresses: A historical-salary-cap NBA roster building game where every player costs their real historical salary as a percentage of that season's cap.

## Objective

A historical-salary-cap NBA roster building game where every player costs their real historical salary as a percentage of that season's cap, with soft cap, luxury tax, and apron mechanics. When I want a roster-building game with real salary-cap tension, I want a tool where every player costs their real historical salary as a percentage of that season's cap, so the lineup choices are real, not arbitrary.

## Target Users

- NBA fans who want a salary-cap-aware roster game
- Fantasy-basketball players looking for a deeper game
- Reddit /r/nba regulars who enjoy 82-0 spinoffs

## MVP Scope

- Spin for random NBA legends
- Build a 5-player lineup under a real historical cap
- Soft cap, luxury tax, first apron, second apron mechanics
- Decade-specific challenges

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/SideProject/comments/1vnyun5/built_and_nba_roster_build` follows the constraints in `502-.../SPEC.md` and the chosen stack (Next.js, TypeScript, PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body describes an NBA roster building game with a real historical salary cap
- Plan keeps the real-cap + apron mechanics framing
- Source did not name a price
