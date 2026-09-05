# SPEC.md — Harvester, a local first media collection tool for sample based artists

## Problem

I make music that&#x27;s entirely found sound&#x2F;sample based. It occurred to me that on every social media site (particularly Instagram) I would have thousands of saved posts because of some sound or visual content that I thought I might like to sample someday.<p>I made Harvester, a local-first Firefox extension for collecting source material for sampling, collage, VJing, editing, and research. Harvester natively preserves media from individual Instagram, Youtube, and Reddit posts as well as visible video and audio from other websites that expose ordinary audio or video. Harvester not only saves the original video to your archive but it also creates a separate audio only file in your chosen format and saves a metadata.json file containing provenance info.<p>Harvester can scan multiple Instagram Saved collections and create oldest-first queues, allowing you to archive posts gradually in small, deliberately paced batches. Built-in limits and randomized delays help reduce the risks associated with automated activity, though no tool can guarantee that Instagram won’t restrict your account. It also supports carousel posts, grabbing each video and creating the audio only derivative for each video in the carousel.<p>There&#x27;s no Harvester account, telemetry, or other wacky stuff built in. Just a basic tool designed to help creators make use of the interesting sights and sounds we encounter online every day.<p>This is just the first release, currently for Firefox on MacOS and it does require a local companion to work properly. I&#x27;d especially appreciate feedback about the installation process and sources where it fails.<p>The extension is plain JavaScript, and the local Python companion uses yt-dlp and FFmpeg for bounded acquisition and media processing.<p><a href="https:&#x2F;&#x2F;github.com&#x2F;sxrvys&#x2F;harvester" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;sxrvys&#x2F;harvester</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49545211)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-03T02:20:02Z

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
