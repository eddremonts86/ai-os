---
id: "338"
slug: live-threat-monitoring-for-soc-teams-with-incident-visu
title: Live threat monitoring for SOC teams with incident visualization and prioritization
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/dev/pijugc1v31-live-threat-monitoring-for-soc-teams-wit"
category: dev
date: "2025-10-29"
tags: [Dev, Other]
country: India
tech: [Go (Wazuh-compatible ingest), Elasticsearch / OpenSearch, Grafana, Kafka, WebSocket fanout (Centrifugo)]
---
# Live threat monitoring for SOC teams with incident visualization and prioritization

## Problem

An Indian managed-SOC provider is delivering alerts to 20-30 small enterprise customers, and on any given afternoon the SOC analyst is staring at a flat list of SIEM events that is impossible to triage in real time. The customer asks for live threat monitoring with incident visualization and prioritization - meaning not a static list but a feed of incidents enriched with severity, asset value and prior-incident memory.

## Objective

Ship a SOC console for Indian MSSPs that ingests events from Wazuh-class SIEMs, de-duplicates them into named incidents with asset + severity context, and streams them to an analyst console with prioritization, so a single analyst can triage a 30-customer fleet instead of paging through event rows.

## Target Users

- Indian managed-SOC providers serving 20-50 SMB and mid-market customers with a small L1/L2 team.
- In-house SOC teams at Indian banks/NBFCs that need a console layered on top of an existing Wazuh/ELK stack.
- MSSP operations managers who want live fleet-wide severity, not a daily email.

## MVP Scope

- Wazuh-class alert ingest via Kafka or REST webhook; parser produces a normalized event.
- Incident grouping: 30-min temporal window + same asset + same signature collapses into one incident.
- Severity scoring: signature base x asset criticality x prior-incident frequency; analyst-tunable.
- Live console: incident feed sorted by severity, asset filter, customer filter, drill-down to raw events.
- Prioritized queue: surfaced incidents the analyst should touch first based on score, not arrival time.
- Awareness loop: 5-minute streamed update via WebSocket so analyst view is live, not poll.
- No SOAR playbooks in v1 (a v2 hook).

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/dev/pijugc1v31-live-threat-monitoring-for-soc-teams-w` follows the constraints in `338-.../SPEC.md` and the chosen stack (Go (Wazuh-compatible ingest), Elasticsearch / OpenSearch, Grafana). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in India.

For India, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Works against an existing Wazuh-class SIEM; no rip-and-replace.
- All customer data isolated in the data store with tenant_id on every query path.
- Operated by an MSSP (i.e. multi-tenant) - UI ships with a tenant switch, not a per-customer licence.
