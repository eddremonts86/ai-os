---
id: "642"
slug: "352-signups-22-used-the-feature-id-spent-months-buildin"
title: "352 signups, 22 used the feature I'd spent months building. So I cut the feature, not the product"
status: draft
source:
  name: manual
category: other
---
_Lúa generó este análisis automáticamente el 2026-08-15_

## Phase 1: Core

- [ ] Define `Site` and `Agreement` schemas (anchor, target URL, placement URL, status)
- [ ] Build browse/filter page over member sites
- [ ] Thread UI for agreements (per pair of members)
- [ ] Agreement creation endpoint locks anchor + placement URL
- [ ] Cron worker that crawls placement URL and verifies link + anchor
- [ ] Trust score: weighted by recent verification success rate
