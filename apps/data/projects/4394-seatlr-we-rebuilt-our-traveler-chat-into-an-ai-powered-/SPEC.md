---
id: "4394"
slug: seatlr-we-rebuilt-our-traveler-chat-into-an-ai-powered-
title: Seatlr – We rebuilt our traveler chat into an AI-powered travel network
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49517740"
category: show-hn
date: "2026-09-01"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Seatlr – We rebuilt our traveler chat into an AI-powered travel network

## Problem

Hey HN,I previously shared the initial version of Seatlr here. The idea was to provide a chat room for each destination, connecting travelers heading to the same city regardless of airline.Over the past few weeks, we have expanded Seatlr from destination-based chat rooms into a more comprehensive travel companion, adding an AI assistant and an alert service designed to make travel safer.Travelers enter their flight number, and Seatlr automatically connects them to their destination’s city room, where they can meet other travelers and exchange experiences and recommendations.The new version includes:* An AI travel assistant that answers questions about local laws and customs and recommends hotels, restaurants, and places to visit.
* An alert service that monitors critical news at the traveler’s destination, including security incidents, strikes, health advisories, severe weather, and disruptions affecting flights and public transportation.
* Real-time chat translation across 59 languages.
* Public city rooms and private one-to-one conversations.
* Nickname-based profiles to protect travelers’ privacy.
* Messages that are automatically deleted within 24 hours.When travelers arrive at a new destination, they often do not have enough time to follow local news. They may be busy enjoying their itinerary, or a language barrier may prevent them from reading and understanding local reports and warnings.We designed the alert service to monitor these developments on their behalf and deliver important information that could affect their safety or travel plans, in their own language, without requiring them to search through multiple local news sources.The most difficult challenge has been solving the cold-start problem: destination rooms become more useful when enough travelers are heading to the same city.Website:https://www.seatlr.com/Seatlr is available for iOS and Android through the links on the website.

---

## Objective

_Not written yet — `ai-os plans enrich` fills this section._

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## MVP Scope

_Not written yet — `ai-os plans enrich` fills this section._

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

_Not written yet — `ai-os plans enrich` fills this section._
