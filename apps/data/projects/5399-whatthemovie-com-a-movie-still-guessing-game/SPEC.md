# SPEC.md — Whatthemovie.com, a movie-still guessing game

## Problem

Hey HN!<p>Long time reader here. I recently spent over five months to modernize an old website I have been working on since 2008: <a href="https:&#x2F;&#x2F;whatthemovie.com" rel="nofollow">https:&#x2F;&#x2F;whatthemovie.com</a>. This is a simple game where people uploads screenshots from movies, and other players have to guess the title of the movie from where the image was taken. This is really images from movie scenes, not promotional stuff or whatever.<p>We have 70k users (but most are from the 2008-2010 area so inactive), and more than 600k images uploaded by our users for 18 years. Around 30k movies in the database too.<p>Thanks to LLMs I was about to modernize the stack which was in an awful state (Rails 4.2, Ruby 2.4 Spaghettis code, Protoytype.js and CSS code directly in HTML etc). It was exhausting to do all the refactoring and modernization but at the end I&#x27;m happy with the result.<p>We also have now &quot;Daily challenges&quot; (like Wordle or framed.wtf) where every day a new challenge is posted and players have to find the title of the movie with a different type of challenge everyday (unzoom, cuts, focus..). It doesn&#x27;t need an account at all: <a href="https:&#x2F;&#x2F;whatthemovie.com&#x2F;daily" rel="nofollow">https:&#x2F;&#x2F;whatthemovie.com&#x2F;daily</a><p>We also have &quot;closed contests&quot; in the vault: basically we organize temporary contests where all shots uploaded must match a specific criteria (a decade, a genre, &quot;emotions&quot;, &quot;cities&quot;, &quot;phones&quot; etc) : <a href="https:&#x2F;&#x2F;whatthemovie.com&#x2F;vault" rel="nofollow">https:&#x2F;&#x2F;whatthemovie.com&#x2F;vault</a><p>Stack is simple: Bare metal on Hetzner, images on AWS S3, docker compose with around 10 micro services (Redis, MariaDB, AI sidecar in Python, Opensearch..). A little Ansible playbook to provision the machine. New relic for performance, Rollbar to track errors. I mainly used Claude models to do the work with sometimes other models to questionate the original review of the Claude model or to try to find things the other model didn&#x27;t.<p>Thanks for your attention, and happy to answer any questions you may have!<p>Yann

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49587692)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-06T15:50:58Z

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
