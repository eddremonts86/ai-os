---
id: "3120"
slug: highball-run-windows-games-on-apple-silicon-with-an-ope
title: "Highball – Run Windows games on Apple Silicon, with an open game db"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49450662"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
---
# Highball – Run Windows games on Apple Silicon, with an open game db

## Problem

The Show HN post links to the project's GitHub repo (gauthierpiarrette/highball) but the scraper captured only the link. From the title alone, Highball is a tool that lets Apple Silicon Macs run Windows games, and ships or links to an open database of supported games.

## Objective

Let macOS-on-Apple-Silicon users play Windows games without owning a Windows machine.

## Target Users

Mac gamers on M-series hardware who want to play Windows-only titles or older PC games.

## MVP Scope

A launcher that takes a Windows game (or installer) and runs it on Apple Silicon via a translation layer, plus an open data set describing which games work and at what quality.

## Constraints

The source provides no detail on which translation layer (Whisky/Game Porting Toolkit-derived, CrossOver, custom) is used, what GPU support looks like, or how the open DB is curated; everything beyond the title is TODO.
