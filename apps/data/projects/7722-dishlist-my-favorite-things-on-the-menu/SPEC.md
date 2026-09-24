# SPEC.md — dishlist – my favorite things on the menu

## Problem

Hi HN!<p>My friend and I wanted to rank our favorite breakfast burritos. Yelp and Beli allow users to rate or rank restaurants, but not individual dishes.<p>So I built dishlist, an iPhone app around the things on restaurant menus.<p>I schlepped around Dogpatch, Potrero Hill, and Mission Bay taking photos of restaurant menus. Then, I used Claude with my menu schema to turn the photos into structured data.<p>Garry Tan likes to say, &quot;The rocks can talk.&quot; Also, &quot;The rocks can see.&quot;<p>I represent the menu hierarchy in the database. LLMs can determine what type of thing each menu item is. This lets me index things like breakfast burritos across restaurants rather than just indexing the restaurants themselves.<p>The app suggests possible tags for a menu item. You decide which ones you want to use on your profile. You can build a list of your favorite breakfast burritos, pizzas, burgers, or whatever else you care about.<p>I value my privacy, so you can use the app without logging in at all. If you want to save menu items, you can sign in with Apple. I don&#x27;t collect names, emails, or phone numbers.<p>If you want to share with friends, you can add a handle. You have to follow another user to see their dishlist, and they have to follow you to see yours. Follow requests are approved or denied by the user.<p>The app is currently available through TestFlight while the App Store submission is being reviewed.<p><a href="https:&#x2F;&#x2F;testflight.apple.com&#x2F;join&#x2F;VB1YAe63" rel="nofollow">https:&#x2F;&#x2F;testflight.apple.com&#x2F;join&#x2F;VB1YAe63</a><p>I&#x27;d love feedback on the idea, the search experience, and especially whether organizing things around individual menu items feels useful.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49743441)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-17T16:53:01Z

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
