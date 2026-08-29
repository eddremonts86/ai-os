---
id: "3713"
slug: popsesh-find-films-to-watch-tonight-with-swipe-and-matc
title: POPSESH – Find films to watch tonight with swipe-and-match picks
status: enriched
source:
  name: BetaList
  url: "https://betalist.com/startups/popsesh?utm_campaign=startup-181503&utm_medium=atom&utm_source=newsfeed"
category: beta
date: "2026-08-29"
tags: [BetaList, Beta, Product]
tech: [Next.js, TypeScript, TMDB API, TestFlight]
---
# POPSESH – Find films to watch tonight with swipe-and-match picks

## Problem

The decision problem at 8pm is not "what exists to watch" — it's "what fits tonight, with this person, in this much time, in this mood." POPSESH narrows the catalogue to that.

The BetaList post and the landing page say it directly: "POPSESH deals films you'll actually press play on — from your taste, your evening, your mood. Watching with someone? The first mutual yes decides." The deck is tuned by three filters that the user sets in the moment — time budget (one sitting, main event, pilot night), mood (a strip of named moods from "Cry it out" to "Off this planet"), and taste (three posters the user actually loved, then every swipe re-tunes the deck). The Match feature opens a shared deck across two phones; "the first mutual yes wins", and the second person can join from a link in any browser, no install.

The product name and the core mechanic are direct: it is a swipe deck for picking a film, with a multi-user variant for couples. The deck learns from each swipe — right for liked, left for not-for-me, down for haven't-seen (it comes back in two weeks). There is no account; the only persistent state is the user's taste seed and a session code for Match.

## Objective

Replace the "let's just pick something" 15-minute conversation with a 30-second swipe session, and the "you pick" deadlock with a shared deck where the first mutual yes wins.

## Target Users

1. **Couples and pairs who watch together** — the explicit Match use case; one partner opens the app, the other joins from a browser link, both swipe the same deck, the first mutual yes is the film.
2. **Solo viewers at decision time** — anyone at 9pm who has 90 minutes and can't pick; the time-budget + mood + taste filters cut the catalogue to what fits tonight.
3. **Casual film fans who don't track lists** — the onboarding is three posters the user actually loved, not a "rate 50 films" interview. The deck builds itself from there.

## MVP Scope

- Swipe deck on a single device: right / left / down gestures and button equivalents.
- Taste seed: pick three posters you actually loved, no questionnaire, no import.
- Time-budget filter: one sitting, main event, pilot night.
- Mood filter: a strip of named moods the user can pick from.
- Re-deal mechanics: down-swiped films come back in two weeks.
- Match: shared deck across two phones via a session link; the second person joins from any browser, no install, no account.
- Anonymous-first: no account required to swipe solo or to join a Match session.
- iOS app on TestFlight; web fallback at `popsesh.com/join/[code]`.
- Out of scope for MVP: TV/casting integration, watchlist persistence across devices without an account, recommendation engine beyond the swipe history, social feed.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- No account required for the core loop — the product's hook is "five swipes from open to a film". Any required sign-up breaks the funnel.
- Match sessions work in a browser without the app — the partner never installs anything.
- Beta distribution via TestFlight; web fallback for the Match link.
- The deck must be honest about re-deals (down-swiped = "comes back in two weeks") so users trust the filter, not fight it.
