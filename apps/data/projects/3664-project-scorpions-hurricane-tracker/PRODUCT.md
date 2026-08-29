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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

Project Scorpions is a hurricane tracker that turns public storm data, tracks and model output into a followable interface for a storm over its lifetime. The data sources are named in the documentation with their agencies and URLs, the refresh cadence is honest about how stale the data can be, and the forecast cones and model output are attributed to the issuing agency rather than presented as the tracker's own opinion.

The capture does not name the agencies or feeds, so the plan treats the data-source set as a design choice to be made in MVP and called out in the documentation. The interface is built for following a storm from formation to dissipation, not for browsing historical seasons; deep history is a roadmap item rather than MVP scope.

**One-liner:** Project Scorpions follows public storm data from formation to dissipation, with the data sources named, the refresh cadence visible, and the cones and model output attributed to the issuing agency.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Coastal residents | A single tracker for the storms approaching their area, rather than a stack of agency pages. |
| Weather-aware users and amateur meteorologists | A storm-following interface from formation to dissipation. |
| Journalists and emergency managers | Current position, forecast cone, model agreement, in one place. |
| Educators and students | A teaching tool that exposes the public data behind the tracker. |
| Travelers and shipping operators | Active storms in a region of interest, with the most recent update time visible. |

## Jobs To Be Done

1. **Functional job** — Follow a storm from formation to dissipation in a single interface.
2. **Functional job** — See the current position, the forecast cone, and the model output attributed to the issuing agency.
3. **Functional job** — Know how stale the data might be, because storm tracking is safety-adjacent and a stale tracker is a real harm.
4. **Emotional job** — Trust the tracker because the data sources are named and the cones are not the tracker's opinion.
5. **Social job** — Share a storm's page with a non-expert and have them understand what they are looking at.

## Success Metrics

- **Data-source coverage** — share of the active-storm public data surface covered by the documented feeds, since the headline claim is following public data.
- **Refresh adherence** — share of scheduled refreshes that complete on time, since data freshness is safety-adjacent.
- **Staleness visibility** — share of storm pages that show the most recent update time, so the user knows how fresh the data is.
- **Attribution completeness** — share of cones and model outputs that name the issuing agency, since unattributed output is a trust failure.
- **Mobile usability** — share of sessions completed on a phone-sized viewport, since the buyer is often away from a desk.
- **Documented sources** — share of feeds in the tracker that are documented with agency, URL and license.

## Pricing & Monetization

The capture names no price, no tier and no monetization shape; the project is a public tracker on a public website. The architecture fixes only the cost shape: cost scales with the volume of active storms and the depth of the historical view, not with the number of users, so any future paid shape (if any) would have to be priced around data volume or historical depth rather than per seat.

## Competitive Landscape

- **Official agency trackers** — the authoritative source for cones and bulletins; the value of a third-party tracker is the follow-storm-over-lifetime interface and the named-source discipline, not a replacement of the agency output.
- **Weather apps with hurricane modules** — bundled into broader products; the differentiator is the focus on storm tracking as a primary use case, not a tab.
- **Model output aggregators** — useful for advanced users; the project is a tracker, not a model-explainer, so the model output is attributed rather than reinterpreted.

The capture names no specific competitor, so the comparison stops here.

## Risks & Open Questions

- [ ] Pick the MVP data sources with their agencies and URLs, and publish them in a documented data-source page.
- [ ] Define the supported basins for MVP (Atlantic only? global?) and document the choice honestly.
- [ ] Set the refresh cadence and surface the most-recent-update time on every storm page, since freshness is safety-adjacent.
- [ ] Attribute every cone and model output to the issuing agency rather than presenting it as the tracker's opinion.
- [ ] Build the mobile interface as a first-class surface, not a desktop view that happens to scale down.
- [ ] Scope the historical depth: active storms and recent seasons in MVP, deeper history as a documented roadmap item.
- [ ] Resist filling gaps with guesses: if a feed is silent, the tracker is silent.
