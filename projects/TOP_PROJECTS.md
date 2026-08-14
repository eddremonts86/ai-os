# TOP_PROJECTS.md — ProblemHunt ranked

> Auto-ranked by the `problemhunt-scraper` cronjob on 2026-08-14.
> Source: 249 projects in `~/Projects/ai-os/projects/` (ProblemHunt + Reddit r/SaaS).
> Scoring blends WTP (from SPEC/PRODUCT YAML or extracted from title), B2B/recurring signals, sticky-compliance verticals, tech-stack breadth (learn), and visual/agent/creative novelty (fun).

## Top 5 — Real Revenue Potential

1. **207-a-russian-developer-built-an-app-for-nigeria-but-cant-a** — score 8.4/10
   _Cross-border payment routing for app builders in sanctioned/restricted markets_
   B2B fintech with a $500–700 integration budget and recurring tx-fee implied (ProblemHunt: Russia/Nigeria, tags: Finance/Legal/Dev). One-shot billed as integration or setup fee per app, with a long tail of monthly routing fees — a payments-rail sandbox is a massively sticky vertical even outside the headline dollar.

2. **010-the-owner-of-a-tech-agency-hasnt-found-a-suitable-tool-** — score 8.0/10
   _Single-pane for tech agencies (Colombia)_
   $100/month recurring WTP explicitly stated; SPEC names Porkbun + UptimeRobot + Linear/Asana + Stripe Connect integration as the wedge. B2B SaaS in LATAM with five-tool consolidation pain and a tight client-count target (10–50 active clients).

3. **001-a-photographer-moving-to-the-us-needs-clients-platforms** — score 7.5/10
   _Newcomer-photographer acquisition system (Serbia → US)_
   $100–300/month recurring WTP directly stated; SPEC scopes a website + review-funnel + low-cost Meta/Google ads + Stripe deposit. Migration-niche is real (any sub-20-review US photographer is the same avatar), and the recurring WTP band is high relative to the tool cost (≤30% of the budget per SPEC constraint).

4. **004-lack-of-trusted-inspection-and-shipping-for-expensive-i** — score 6.6/10
   _Cross-city high-value handoff service (Russia)_
   $80–130 per deal with $5M declared-value insurance, escrow, and 7-year condition-report retention per SPEC. Margin-rich per-deal revenue with sticky compliance (insurance + escrow + bonded storage) — switching costs are operationally high once the inspector pool is contracted.

5. **200-need-a-tool-that-automatically-finds-people-in-social-m** — score 6.6/10
   _Deep-criteria social-media lead finder (USA)_
   $50/month recurring WTP directly stated; ProblemHunt (social/marketing/business/AI/startups). Mass-market indie-prospector wedge with clean unit economics and a clear funnel (criteria → leads → DM sequences).

## Top 5 — Learning Potential

1. **252-startups-at-the-monetization-validation-stage-have-nowh** — score 7.0/10
   _Payment-onboarding sandbox for unincorporated startups (Morocco)_
   No-company-registration payment intake — exercises PSP adapters, KYC escrow, multi-currency compliance, and fraud. Tags span Legal/Finance/Startups; broad stack (payments + KYC + tax + entity formation).

2. **238-a-musician-from-lebanon-cannot-sell-his-music-strea** — score 6.5/10
   _Direct-sales music platform for under-banked regions (Lebanon)_
   Combines streaming, direct-checkout, regional PSP routing, and rights management — an unusual full-stack with content + payments + geo-restriction logic. Cold path: countries where Bandcamp/PayPal are blocked.

3. **009-research-existing-solutions-cover-only-30-of-small-busi** — score 6.0/10
   _UPL-safe legal-template engine for SMBs (validated)_
   Browser-side document drafting so confidential data never leaves the user's machine — exercises WASM template runners, UPL-safe scoring, and on-device privacy. Different compliance regime (US legal) than what is usually built.

4. **002-need-a-super-simple-ai-agent-that-learns-by-watching-yo** — score 5.5/10
   _On-device screen-watching automation agent_
   macOS-first desktop agent with on-device ML, record-once-replay-forever UX, code-signing/notarization paths. Hits accessibility APIs, permission flows, and packaged-app distribution — all novel for a primarily web-trained founder.

5. **285-the-problem-of-multi-platform-kyckyb-processes-in-finte** — score 5.5/10
   _Multi-platform KYC/KYB orchestration for fintech (France)_
   Direct exercise of KYC/KYB APIs (Onfido, Sumsub, Veriff, Personr), vendor scoreboarding, and audit-trail persistence. Highly regulated, sticky once a fintech has integrated the orchestrator.

## Top 5 — Fun to Build

1. **240-the-lack-of-a-service-that-creates-hyper-personalized-g** — score 7.5/10
   _Hyper-personalized gamified English courses_
   Duolingo-format for narrow professional niches (barista in a vegan coffee shop, founder pitch deck). Combination of LLM content generation, gamification loops, voice UX, and a satisfying buyer demo (show, don't tell).

2. **218-photographer-loses-2030-of-clients-to-spam-needs-an-ai-** — score 6.5/10
   _AI voice clone for photographer's inbound calls_
   Voice cloning + conversational agent + booking integration; a satisfying end-to-end demo (call comes in → AI answers → photographer gets a confirmed booking). Visual polish story is built around the call-quality itself.

3. **206-a-designer-needs-an-ai-agent-to-eliminate-the-manual-dr** — score 5.5/10
   _Designer AI agent for responsive cross-device adaptation_
   Estonia-based designer with explicit WTP (€20–30/project). Computer-vision + diff + Figma plugin territory; high reward in seeing the agent reshuffle a desktop layout into a tablet layout in real time.

4. **239-hours-of-manual-searching-for-parts-for-chinese-car** — score 5.5/10
   _Visual parts-search for Chinese cars (Russia)_
   Multimodal search (photo → text query → part catalogue); interesting because it combines a real-world messy problem with a tight, satisfying demo and a niche user base that has few competitors.

5. **244-a-beginner-in-online-business-needs-not-a-course-but-a-** — score 5.5/10
   _Personalized AI business guide / step-by-step planner_
   Daily-conversation AI agent that produces a personalized plan and adapts to the user's progress. Voice + agent + planner in one product; great demo loop (the user asks "I want to start a coffee cart" → the agent returns a 30-day plan).

---

## Changelog

- **2026-08-14** — evaluated 249 projects (ProblemHunt + Reddit r/SaaS, fresh fetch). New top picks: 207-payment-routing, 010-tech-agency, 001-photographer, 252-payment-onboarding, 240-gamified-english, 238-direct-music, 218-voice-clone, 200-social-search, 004-handoff, 006-mover, 007-qa, 005-fieldstaff, 008-transit, 009-legal, 003-breeder, 002-screen-agent. Scores: avg money 3.1, learn 2.8, fun 3.3. Replaces the previous hand-edit (which covered only the first 10 projects).

- **<hand-edit, pre-cron>** — evaluated 10 projects. Manually ranked before the scraper was wired into the cron pipeline. Replaced by the 2026-08-14 cron-driven re-rank.
