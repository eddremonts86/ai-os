# SPEC.md — Seatlr – We rebuilt our traveler chat into an AI-powered travel network

## Problem

Hey HN,<p>I previously shared the initial version of Seatlr here. The idea was to provide a chat room for each destination, connecting travelers heading to the same city regardless of airline.<p>Over the past few weeks, we have expanded Seatlr from destination-based chat rooms into a more comprehensive travel companion, adding an AI assistant and an alert service designed to make travel safer.<p>Travelers enter their flight number, and Seatlr automatically connects them to their destination’s city room, where they can meet other travelers and exchange experiences and recommendations.<p>The new version includes:<p>* An AI travel assistant that answers questions about local laws and customs and recommends hotels, restaurants, and places to visit.
* An alert service that monitors critical news at the traveler’s destination, including security incidents, strikes, health advisories, severe weather, and disruptions affecting flights and public transportation.
* Real-time chat translation across 59 languages.
* Public city rooms and private one-to-one conversations.
* Nickname-based profiles to protect travelers’ privacy.
* Messages that are automatically deleted within 24 hours.<p>When travelers arrive at a new destination, they often do not have enough time to follow local news. They may be busy enjoying their itinerary, or a language barrier may prevent them from reading and understanding local reports and warnings.<p>We designed the alert service to monitor these developments on their behalf and deliver important information that could affect their safety or travel plans, in their own language, without requiring them to search through multiple local news sources.<p>The most difficult challenge has been solving the cold-start problem: destination rooms become more useful when enough travelers are heading to the same city.<p>Website:<p><a href="https:&#x2F;&#x2F;www.seatlr.com&#x2F;" rel="nofollow">https:&#x2F;&#x2F;www.seatlr.com&#x2F;</a><p>Seatlr is available for iOS and Android through the links on the website.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49517740)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-01T03:46:11Z

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
