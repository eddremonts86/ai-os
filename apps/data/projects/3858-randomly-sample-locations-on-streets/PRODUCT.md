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

## Value Proposition

Design a street survey in minutes. geo-sampling turns "sample locations on streets" into a reproducible pipeline: pick a city or state, get its administrative boundaries from GADM and its streets from OpenStreetMap, split streets into 0.5 km segments, sample them randomly, and get a CSV plus shaded map plots showing exactly where data must be collected.

**One-liner:** A Python package that randomly samples locations on streets for field data collection.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Urban researchers | Estimate potholes-per-kilometer and similar quantities from a proper sample. |
| GIS practitioners | A reproducible pipeline for street-based field survey design. |
| Data scientists | Street-level sampling as an installable package instead of custom scripts. |

## Jobs To Be Done

1. **Functional job** — Choose a city or state and obtain its administrative boundaries from GADM.
2. **Functional job** — Download the street network from OpenStreetMap via extract.bbbike.org.
3. **Functional job** — Split streets into 0.5 km segments and randomly sample them into a CSV.
4. **Functional job** — Plot sampled segments as shaded regions showing where to collect data.

## Success Metrics

- **Usable regions:** share of city or state selections that complete the boundary-to-OSM download pipeline.
- **Sample quality:** segments produced per request and evenness of coverage across streets.
- **Time to sample:** minutes from install to a sampled CSV for a typical city.
- **Package adoption:** PyPI installs and CI-green status as a proxy for real use.

## Pricing & Monetization

None stated. Free and open source on PyPI under the geosensing GitHub org; no commercial offering appears.

## Competitive Landscape

The post does not name competitors. The category is geospatial sampling and survey-design tooling (OSM extraction libraries, GIS sampling scripts); the stated angle is packaging a complete sampling strategy — boundaries, streets, 0.5 km segments, CSV and plots — as one installable Python package.

## Risks & Open Questions

- [ ] External data dependencies (GADM, extract.bbbike.org) can change formats or availability and break the pipeline.
- [ ] The straight-line assumption between segment endpoints loses geometry; accuracy depends on segment length.
- [ ] Fixed region granularity (city or state, not parts of cities) limits some study designs.
- [ ] The 2016-era codebase (the repo was created in 2016) must keep pace with Python and dependency changes.
- [ ] Sampling quality depends on OSM street completeness, which varies by region.
