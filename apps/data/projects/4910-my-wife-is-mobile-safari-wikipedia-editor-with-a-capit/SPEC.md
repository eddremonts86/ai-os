# SPEC.md — My wife is mobile Safari Wikipedia editor with a capital issue

## Problem

This all started a few days ago when my wife&#x27;s article:<p><a href="https:&#x2F;&#x2F;en.wikipedia.org&#x2F;wiki&#x2F;Jackson%E2%80%93Benton_brawl_of_1813" rel="nofollow">https:&#x2F;&#x2F;en.wikipedia.org&#x2F;wiki&#x2F;Jackson%E2%80%93Benton_brawl_o...</a><p>got picked up to be on the homepage of wikipedia. I tapped on the view history and noticed her username was shouting at me. Jengod vs jengod. When I mentioned it she sighed and said she hates it too but &quot;there is nothing I can do about it.&quot;<p>She uses mobile safari to edit at a crazy level:<p><a href="https:&#x2F;&#x2F;www.youtube.com&#x2F;shorts&#x2F;MIUNa0hKElg" rel="nofollow">https:&#x2F;&#x2F;www.youtube.com&#x2F;shorts&#x2F;MIUNa0hKElg</a><p>So I made:<p><a href="https:&#x2F;&#x2F;github.com&#x2F;andrewarrow&#x2F;jengod&#x2F;blob&#x2F;main&#x2F;CapitalSafariExtension&#x2F;content.js#L48" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;andrewarrow&#x2F;jengod&#x2F;blob&#x2F;main&#x2F;CapitalSafar...</a><p>Line 48 is the whole point of this extension:<p>addedNode.nodeValue = addedNode.nodeValue.replace(&#x2F;Jengod&#x2F;g, &quot;jengod&quot;);<p>ha. Nothing I can do. Hardly.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49549164)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-03T12:34:36Z

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
