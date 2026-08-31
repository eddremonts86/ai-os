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
tech: [Python package, OpenStreetMap street data, GADM administrative boundaries in ESRI shapefile format, pyshp shapefile handling, 0.5 km segment sampling, CSV output with map plots]
---
# Randomly Sample Locations on Streets

## Tech Stack

- **Python package:** geo_sampling on PyPI, Python 3.11+.
- **OpenStreetMap street data:** extracted via extract.bbbike.org for the chosen region.
- **GADM administrative boundaries:** ESRI shapefiles for country, state and city selection.
- **pyshp shapefile handling:** builds the boundary-derived URL and reads geometry.
- **0.5 km segment sampling:** street splitting, segment database and random row sampling.
- **CSV output with map plots:** sampled segments exported as CSV and shaded plot regions.

## Architecture

- **Boundary stage:** download GADM administrative data; let the user pick a city or state.
- **Street stage:** use pyshp and the boundary to build an extract.bbbike.org URL and download OSM streets.
- **Segmentation:** split each street from one end into 0.5 km segments; record endpoint coordinates.
- **Sampling:** store segments in a database, sample rows, emit CSV.
- **Visualization:** plot sampled segments, shading the full segment area as data-collection regions.

## Milestones

1. **M0 — Boundary and street download.** GADM boundaries and OSM streets for a named city or state.
2. **M1 — Segmentation and sampling.** 0.5 km splitting, the segment database, random sample to CSV.
3. **M2 — Visualization.** Shaded plots of sampled segments as collection regions.
4. **M3 — Packaging and docs.** PyPI release, Python 3.11+ support and GitHub Pages documentation.

## Risks

- **Upstream services** (GADM, bbbike) changing without notice break the pipeline silently.
- **Geometry simplification** at 0.5 km granularity may bias results on curved roads.
- **OSM completeness varies by city:** samples inherit street-map gaps.
- **An old, small-community package** needs maintenance attention to stay installable.
