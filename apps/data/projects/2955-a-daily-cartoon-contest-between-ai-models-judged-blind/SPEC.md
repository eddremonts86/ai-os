---
id: "2955"
slug: a-daily-cartoon-contest-between-ai-models-judged-blind
title: "A daily cartoon contest between AI models, judged blind"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49435106"
category: show-hn
date: "2026-08-25"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# A daily cartoon contest between AI models, judged blind

## Problem

Comic-cron.com is a daily contest where AI models draw a single panel cartoon about a recent news story and people vote on which are funny.I built it mainly because I love cartoons and news, but this project isn’t trying to pretend it’s human art, I wanted to see how capable the models were at this task of making funny comics. Sometimes they get it, and sometimes they don’t and it has been interesting to see the progress in just the few months I have been publishing the cartoons. Model version over version improvement within labs is quite distinct in the output, especially in the SVGs, which suggests their spatial reasoning may be improving faster than their wordsmithing. My briefs and methods have also improved over the weeks so this isn’t something I can purely attribute to the models.How it works is that a real story is selected, reduced to a shorter brief with any real names removed, and then provided to eight different models to draw a comic and provide a caption. The four of the eight which I think are best are then published where people can vote blind on their favourite (models are revealed after the vote).
The human jobs are choosing and framing the story, and then picking the four to publish. Story sourcing is a shell script that pulls a dozen RSS feeds into one file each morning. I tried an agent first and it spent most of its time getting 403'd by publishers; the feeds were never blocked, only the agent fetching them. I initially only included four models to draw the comics (the most obvious labs), but found this wasn’t optimal: sometimes models failed, and generally I felt it was harder to ensure quality and variety with a smaller pool (often models converge and produce jokes or drawings that feel too similar). By producing more panels I could more reliably get a better final four.Each model is writing an SVG, and they never see the results. This can be interesting in what the models believe they are depicting vs. what actually shows up in the comics, and can be quite funny. Occasionally I will have an image model render the scene as a more polished illustration as a way of rescuing a joke I like that the SVG doesn’t land, or just to show the gap.A relatively common failure I see is when reasoning models think so deeply about the task and then can’t supply the output because they have spent the token budget before closing the tag on the SVG. Other times the SVGs are just incomplete or don’t populate correctly. I have also had models balk on select sensitive topics (two declined a story that touched on biological pathogens) but complete readily on others (like climate disaster), suggesting there are topic specific nuances for refusal behaviour.The inference cost has also been quite interesting to track and I often see two of the frontier models accounting for a majority of the cost in a run of eight models. There is quite a variation in the SVG quality, but the captions are much closer and one of the cheapest models is quite competitive.This is entertainment first and not a rigorous benchmark. But I do hope it gets a few laughs while also being a weird preference poll on something nobody optimises for, that may give a view into how AI models can perform for humour. I’m interested in what people select as their favourites and to see how the models continue to advance.So far I’ve published daily for over two months and every day’s battle is stored in the archive for viewing with winners and losers. It’s free with no signup and I’m curious on how the format holds up, do the comics land for people? As a news and comic junkie it has been fun to build regardless!

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
