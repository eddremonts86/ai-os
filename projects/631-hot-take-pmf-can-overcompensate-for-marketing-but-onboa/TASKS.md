---
id: "631"
slug: hot-take-pmf-can-overcompensate-for-marketing-but-onboa
title: "Hot take: PMF can overcompensate for marketing, but onboarding journeys are pre-requisite for them"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1voyunq/hot_take_pmf_can_overcompensate_for_marketing_but/"
category: saas
date: "2026-08-15"
---
# Hot take: PMF can overcompensate for marketing, but onboarding journeys are pre-requisite for them

## Phase 0: Scaffold

- [ ] Crear carpeta del proyecto en `apps/`
- [ ] Inicializar repo git
- [ ] Copiar `edd-app-template` → `apps/631-hot-take-pmf-can-overcompensate-for-marketing-but-onboa/`
- [ ] Escribir SPEC.md (este documento)
- [ ] Escribir DESIGN.md (tokens + dirección visual)
- [ ] Configurar `tailwind.config.ts` con los tokens de DESIGN.md
- [ ] Configurar entorno de desarrollo

## Phase 1: Core

- [ ] Write the first version of the playbook as a single Markdown file that walks a founder through the four questions the source post explicitly names — when does value arrive, how many steps to it, how far do users actually reach, where does the funnel drop — with a worked example from a generic SaaS signup funnel so the audit's shape is visible.
- [ ] Build the companion worksheet as a second Markdown file that mirrors the playbook's structure as a copy-paste template, so the founder's first action after download is to clone the worksheet into their Notion or repo rather than to design their own.
- [ ] Add a short primer at the start of the playbook covering the minimum product analytics a founder needs to run the audit (drop rate per step, time-to-value, and a definition of "value delivered" for their product), so the audit does not silently degrade into a discussion exercise when funnel data is missing.
- [ ] Build the static landing page with Astro, using the poster's framing as the headline and a single download CTA, and deploy it on Netlify with Plausible Analytics attached for download attribution.
- [ ] Produce both a `.md` and a `.pdf` copy of the playbook so the founder can use whichever format suits their workflow — Markdown for those who keep notes in Notion or Obsidian, PDF for those who want a printable one-pager.
- [ ] Capture the "good references for smooth onboarding" the poster alludes to as an honest annotated bibliography at the end of the playbook, with a clear "to be added" section where the poster's promised follow-up post will land once it exists, rather than fabricating references the source does not contain.
- [ ] Add a "first step to fix" one-page template that produces a written brief naming the highest-impact onboarding step and a concrete change to test, so the audit lands on a single actionable recommendation rather than a list of problems.
- [ ] Open a GitHub Discussions thread on the repo so founders running the audit can share their completed worksheets and the poster (or other founders) can give feedback, mirroring the source's Reddit-shaped community rather than imposing a contact form.
- [ ] Add a README that frames the deliverable as a Monday-morning checklist rather than a course, and that explicitly cites the 150k+ user count and 4+ years in event-tech as the only proof point, so the credibility surface matches the source.
- [ ] Smoke-test the end-to-end flow on a fresh clone: download the playbook, clone the worksheet, fill in a sample SaaS funnel, run the four questions, and confirm the resulting "first step to fix" brief names exactly one onboarding step with a concrete change to test.

## Phase 2: Deploy

- [ ] Crear repo en GitHub
- [ ] Desplegar a Coolify
- [ ] Verificar en producción

---

_Lúa generó este análisis automáticamente el 2026-08-15_
