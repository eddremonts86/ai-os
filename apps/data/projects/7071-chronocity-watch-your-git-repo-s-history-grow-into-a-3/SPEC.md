# SPEC.md — Chronocity – Watch your Git repo's history grow into a 3D city

## Problem

This is timelapse of a 3D city simulation based on your Git history, files are buildings and height is based on LOC. Weather can determines if the repo is quiet or active during a span of time.<p>Just a fun visual to get the momentum overview of your project. I&#x27;ve been working a lot in 1 repo for the past few months and got a handsome amount of commits, so I decided to make something visually appealing to &#x27;appreciate&#x27; my work somehow.<p>Based on the ideas of: CodeCity (Richard Wettel &amp; Michele Lanza) and Gource (Andrew Caudwell, 2009). Instead of static city like CodeCity or 2D tree like Gource, chronocity is an 3D interactive city and you can even drive car in there lol.<p>All in the browser, TypeScript + three.js, isomorphic-git in a Web Worker, WebCodecs for the video.<p>It scans your .git folder (all client-sided, nothing uploaded) and through the main branch (downscaled to 2000 steps for big repos), compares files, LOC with previous step. three.js renders all the buildings in one instanced mesh, and height is the square root of LOC. The weather is not random: the sky follows the local time (their time zone) of people that commited, fog indicates quiet stretches, rain means a burst of changes in a short window.<p>Try your own project straight in my GitHub page, drop your Git cloned repo there (containing .git folder, all in your browser, your repos are stored in YOUR cache, this is serverless).

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49708188)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-15T05:40:36Z

---

## Objective

Build a solution that addresses this problem clearly and at scale.

---

## Target Users

1. **[Primary user]** — the main user this serves
2. **[Secondary user]** — other relevant users

## MVP Scope

- Core functionality
- Leave out anything beyond the MVP

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Keep the MVP simple
- No unnecessary external dependencies
