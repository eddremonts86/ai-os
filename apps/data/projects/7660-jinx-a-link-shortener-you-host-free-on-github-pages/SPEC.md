# SPEC.md — Jinx – a link shortener you host free on GitHub Pages

## Problem

Jinx is just links, a small static website on GitHub to share short links to your stuff. Add your links to one file, turn on GitHub Pages, and point your own domain at it. I built it because the options all seemed wrong for a small team: paid shorteners charge monthly for what&#x27;s essentially a lookup table; free self-hosted ones (YOURLS, Shlink, etc.) still need a server and a database to maintain; and free tiers of hosted services like bitly or tinyurl cap your links or paywall basic features. It’s working well for my team at work.<p>What it does:<p>•  Short links on your own domain (yourname.com&#x2F;thing) that redirect instantly.<p>•  A searchable page listing all your links. Typos are redirected to the search page.<p>•  QR codes for each link, generated in js in the browser, no external API calls.<p>•  Click counts via GoatCounter (free, privacy-preserving, no cookies)<p>• Nested paths if you want them (e.g. contact&#x2F;email, contact&#x2F;whatsapp, etc.)<p>•  Access control for who can edit links is done through github repo access.<p>Why another link shortener?  Paid link shorteners cost money every month for something that&#x27;s really just a lookup table. Free open-source link shorteners require you to host the app somewhere and pay monthly for that instead. Freemium services like bitly paywall you with limits on the number of links, edit ability, sometimes redirect your QR code to an ad . So I built a link shortening tool focused on simplicity as a static website and open-sourced it.<p>Setup: fork the repo, edit the config and the links, turn on GitHub Pages. Takes about five minutes. MIT licensed, free, no ads, no account required beyond GitHub itself.<p>Live example: jinx.fyi
Code: github.com&#x2F;gdmcdonald&#x2F;jinx<p>Would love to hear feedback, what do you like or not like, what would make it more useful for you?

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49749716)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-18T02:56:04Z

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
