---
id: "3664"
slug: project-scorpions-hurricane-tracker
title: Project Scorpions – Hurricane Tracker
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49482460"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Python, FastAPI, PostgreSQL with PostGIS, Pydantic, Leaflet (frontend), HTMX, NHC public bulletin feeds]
---
# Project Scorpions – Hurricane Tracker

## Problem

The capture for this plan is a link (https://project-scorpions.net/) and a title; there is no prose body, so the implementation details are unstated and have to be scoped honestly from the title alone.

The title fixes the subject and the shape: Project Scorpions is a Hurricane Tracker. The subject is unambiguous — public tropical-cyclone data, storm tracks, and the model output that meteorologists and weather-aware users actually use to track a storm. The shape is also implicit: a tracker needs a map, needs current position and forecast cone, needs the public data feeds, and needs an interface that lets the user follow a storm over its lifetime.

The capture does not name the data sources, the agencies, the model output, the public-feed refresh cadence, the supported storms (Atlantic only? global?), the historical depth, or the alert model. The plan scopes the shape from the title and treats the unsaid as design choices to be made rather than facts to be asserted. The honest reading is "a tracker for public hurricane data", and the plan is built around that without inventing which agencies or feeds are in scope.

## Objective

Ship a public hurricane tracker that turns public storm data, tracks and model output into a followable interface for a storm over its lifetime, with the data sources named honestly in the documentation rather than implied.

## Target Users

- Coastal residents who want to follow a storm approaching their area and see the public data they would otherwise piece together from multiple agency pages.
- Weather-aware users and amateur meteorologists who want a single tracker that follows a storm from formation to dissipation.
- Journalists and emergency managers who need a quick reference for current position, forecast cone and model agreement.
- Educators and students who want a teaching tool that exposes the public storm data behind the tracker.
- Travelers and shipping operators who want to know what storms are active in a region they care about.

## MVP Scope

- A map interface that shows current storm positions, forecast tracks and forecast cones for active storms.
- Public data ingestion from named feeds, with each feed's source, refresh cadence and license documented in the project.
- A storm detail page that follows one storm over its lifetime: current position, forecast cone, recent public bulletins, and the model output that is publicly available.
- A list of active storms with the most recent update time and the source of that update.
- An honest data-source page: every feed the tracker uses, named with the agency and the URL, and the feeds the tracker deliberately does not use.
- A documented refresh cadence so the user can see how stale the data might be.
- A basic alert model: a region watch or warning from public feeds is surfaced on the relevant storm and on the map.
- A historical view that lets a user look back at past seasons (scope is a design choice; the capture does not name it).

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The capture is URL-only, so data sources, supported basins, and refresh cadence are scoped as plausible defaults rather than asserted as facts; the plan avoids inventing agency names or feed URLs.
- The tracker is built on public data, so the data sources must be cited and the refresh cadence must be honest about how stale the data can be.
- Hurricane data is safety-adjacent: a tracker that shows an outdated position or a missed warning is a real harm, so the data-freshness story has to be visible to the user.
- Forecast cones and model output are not the tracker's opinion; they are the agencies' output, and the tracker has to attribute them clearly.
- The interface has to be usable on a phone, because the buyer is often checking a storm while away from a desk.
- Historical depth is a real cost; the plan scopes MVP to active storms plus recent seasons and treats deep history as a roadmap item.
- The project must not invent data the agencies have not issued; if a feed is silent, the tracker is silent, rather than filling the gap with a guess.
