# SPEC.md — Rate.fm – Letterboxd for Music, on iPhone and the Web

## Problem

I made rate.fm because every “Letterboxd for music” app sucked. I tried RYM (still 2004), AOTY (a charts website), and Musicboard (dying). I just wanted a fast diary where I could log what I heard, give it a number, write a little, and see what friends thought.<p>The app lets you rate albums and songs out of 10, write reviews, make lists, and follow friends. We aggregate scores from 19 publications (Pitchfork, Rolling Stone, NME, AllMusic, The Guardian) and show them on the pages as well. Connect Apple Music, Spotify, or Last.fm to log passively and get stats. You can rate whatever song is playing from the Lock Screen without opening the app, and import your Musicboard history with a tap.<p>Tech: UIKit and SwiftUI, Node on Vercel, Postgres on RDS. The catalog is about 226k albums and 563k songs, mostly from Apple Music, with MusicBrainz for the more obscure releases.<p>The hardest problem was a clean music library. Music identity is extremely convoluted: the same recording shows up across ISRCs, reissues, and regional storefronts, and basically every feature was broken until I folded them into one identity.<p>Free, no ads, iPhone only for now: <a href="https:&#x2F;&#x2F;apps.apple.com&#x2F;us&#x2F;app&#x2F;rate-fm-rate-your-music&#x2F;id6756295934">https:&#x2F;&#x2F;apps.apple.com&#x2F;us&#x2F;app&#x2F;rate-fm-rate-your-music&#x2F;id6756...</a><p>I’d love feedback on the onboarding, and whether you think the critic scores are a good feature or just a distraction.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49693141)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-14T07:26:01Z

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
