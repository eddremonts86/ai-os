---
id: "3858"
slug: randomly-sample-locations-on-streets
title: Randomly Sample Locations on Streets
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49501046"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Python package, OpenStreetMap street data, GADM administrative boundaries in ESRI shapefile format, pyshp shapefile handling, "0.5 km segment sampling", CSV output with map plots]
---
# Randomly Sample Locations on Streets

## Problem

The capture is a URL-only Show HN post pointing at the geo-sampling GitHub repository. The repo is verifiable: a Python package (geo_sampling on PyPI, org geosensing) for randomly sampling locations on streets, built for questions like "what is the average number of potholes per kilometer of street in a city". It downloads administrative boundaries from GADM, obtains street data from OpenStreetMap via extract.bbbike.org using pyshp, splits each street into 0.5 km segments, samples rows from the resulting segment database, and produces a CSV plus shaded map plots of the segments where data must be collected. It requires Python 3.11+.

## Objective

Make street-based sampling a turnkey step for field research: given a city or state, produce a random sample of street locations — 0.5 km segments with coordinates, CSV output and plotted regions — so an estimate like potholes per kilometer can be designed in minutes instead of built by hand.

## Target Users

- Urban researchers estimating per-kilometer quantities (potholes, infrastructure, street conditions).
- GIS and geospatial practitioners doing field-survey design on street networks.
- Data scientists needing reproducible street-level sampling for analysis.

## MVP Scope

- Administrative boundary download from GADM (ESRI shapefiles) for a chosen city or state.
- OSM street data extraction via extract.bbbike.org using pyshp-built URLs.
- Street splitting into 0.5 km segments with endpoint coordinates.
- A segment database with random sampling producing a CSV.
- Map plots of sampled segments as shaded data-collection regions.

## Constraints

- The Show HN post is URL-only; all specifics come from the repo README.
- Region granularity is fixed: a city or state can be chosen, but not a portion of a city.
- The 0.5 km segment size and the straight-line assumption between endpoints are the design; finer granularity is out of scope.
- The package is the tool; the data collection itself (step 3 in the README) is left to the user.

## Design Direction

See `DESIGN.md` for this project's design tokens.
