# SPEC.md — HonestSky, a free iOS weather app without ads or subscriptions

## Problem

Hi HN, I’m Sean. I built HonestSky because I was tired of weather apps that were slow to load, covered in ads some to the point of being unusable and then putting longer forecasts behind paywalls.<p>I’ve been using it myself for over a year, and today I finally (finally finally) released it on the iOS App Store.<p>It includes hourly and extended forecasts, radar, severe weather alerts, and air quality. All features are free, with no ads or account required.<p>Privacy was another reason I wanted to build it. Reading about the location-data lawsuits involving weather apps made me uncomfortable with how a straightforward weather lookup could turn into something else. This is something I didn’t realize until after I was looking for how to get the word out.<p>You can save locations and opt into push notifications for weather alerts. It uses that information only to provide your forecasts and alerts. I don’t sell your data or use it for anything else.<p>The weather data comes from providers including Open-Meteo, RainViewer, and the National Weather Service.<p>This started as something I wanted for myself. After using it for a year, I figured other people might find it useful too. Plus it costs a few bucks to host and process so I put a donation bucket out there.. although Apple made me take any sort of asking for donations out of it so I haven’t figured that part out yet.<p>I’d appreciate feedback on the interface, the forecasts and alerts, and anything that would stop you from using it as your everyday weather app. Happy to discuss the data sources and privacy decisions too.<p>Cheers!
Sean

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49719113)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-15T21:26:07Z

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
