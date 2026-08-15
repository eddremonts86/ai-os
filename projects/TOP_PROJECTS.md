# TOP_PROJECTS.md — ProblemHunt ranked

> Auto-ranked by the `problemhunt-scraper` cronjob on 2026-08-15.
> Source: 404 projects in `~/Projects/ai-os/projects/` (ProblemHunt + Reddit r/SaaS).
> Scoring blends WTP (from SPEC/PRODUCT YAML or extracted from title), B2B/recurring signals, sticky-compliance verticals, tech-stack breadth (learn), and visual/agent/creative novelty (fun).

## Top 5 — Real Revenue Potential

1. **207-a-russian-developer-built-an-app-for-nigeria-but-cant-a** — score 8.4/10
   _Cross-border payment routing for app builders in sanctioned/restricted markets_
   B2B fintech with a $500–700 integration budget and recurring tx-fee implied (ProblemHunt: Russia/Nigeria, tags: Finance/Legal/Dev). One-shot billed as integration or setup fee per app, with a long tail of monthly routing fees — a payments-rail sandbox is a massively sticky vertical even outside the headline dollar.

2. **010-the-owner-of-a-tech-agency-hasnt-found-a-suitable-tool-** — score 8.0/10
   _Single-pane for tech agencies (Colombia)_
   $100/month recurring WTP explicitly stated; SPEC names Porkbun + UptimeRobot + Linear/Asana + Stripe Connect integration as the wedge. B2B SaaS in LATAM with five-tool consolidation pain and a tight client-count target (10–50 active clients).

3. **564-ex-pm-for-ai-now-building-agent-verification-how-did-yo** — score 7.5/10
   _Agent-output verifier (B2B fintech/ops, ex-fintech-PM)_
   SPEC cites a real production failure mode (agent reports "done, updated", traces look green, writes never land) and the founder is actively recruiting 3–5 design partners — strongest signal of validated pain in the new batch. B2B with willingness-to-pay implicit (regulatory exposure + audit cost), recurring SaaS in a category (agent observability) growing with every shipping agent.

4. **001-a-photographer-moving-to-the-us-needs-clients-platforms** — score 7.5/10
   _Newcomer-photographer acquisition system (Serbia → US)_
   $100–300/month recurring WTP directly stated; SPEC scopes a website + review-funnel + low-cost Meta/Google ads + Stripe deposit. Migration-niche is real (any sub-20-review US photographer is the same avatar), and the recurring WTP band is high relative to the tool cost (≤30% of the budget per SPEC constraint).

5. **573-the-soc-2-scramble-nobody-warns-you-about-it-always-sta** — score 7.0/10
   _SOC 2 fast-track service for pre-Series A B2B SaaS_
   Author cites $15k–$30k tooling-burn traps and the "blocked-deal" trigger pattern (external clock, not internal want). SPEC scopes plain-checklist + ownership-mapping workflow vs the typical automation-first playbook — strong WTP signal from the audience (B2B founders losing deals), and recurring revenue once the audit cycle restarts annually.

## Top 5 — Learning Potential

1. **252-startups-at-the-monetization-validation-stage-have-nowh** — score 7.0/10
   _Payment-onboarding sandbox for unincorporated startups (Morocco)_
   No-company-registration payment intake — exercises PSP adapters, KYC escrow, multi-currency compliance, and fraud. Tags span Legal/Finance/Startups; broad stack (payments + KYC + tax + entity formation).

2. **564-ex-pm-for-ai-now-building-agent-verification-how-did-yo** — score 6.5/10
   _Agent-output verifier (B2B fintech/ops)_
   New territory in the corpus: reconcile agent claims against the system of record instead of trusting the trace. Stack spans tool/function-call instrumentation, state-diff auditing, system-of-record connectors, and adversarial test harnesses against public agent traces. Strongest learn-signal of the new batch because the verification model itself is the engineering work.

3. **540-does-this-problem-actually-exist-for-people-using-codin** — score 6.5/10
   _Persistent project-memory CLI for coding agents (`repobrain`)_
   Indexes git history, PR descriptions/comments, and Slack/Notion into a living store of decisions, rejected approaches, and conventions; surfaces via CLI/REST/MCP so Cursor/Claude Code can query before acting. Stack spans git-mining, embeddings, MCP-server authoring, agent tool-calling, and PR-driven suggestion UX — exactly the niche where the next dev-tool wedge lives.

4. **238-a-musician-from-lebanon-cannot-sell-his-music-strea** — score 6.5/10
   _Direct-sales music platform for under-banked regions (Lebanon)_
   Combines streaming, direct-checkout, regional PSP routing, and rights management — an unusual full-stack with content + payments + geo-restriction logic. Cold path: countries where Bandcamp/PayPal are blocked.

5. **583-as-a-former-cyber-security-analyst-i-noticed-multiple-s** — score 6.0/10
   _Fully-local AI-code security scanner (OWASP top 10 + cred leak + .env hygiene)_
   Stack spans AST-based static analysis for 7 languages (PHP/JS/Python/...), taint tracking for IDOR/CSRF/SQLi/CMDi, a CI token + attested-PDF report pipeline for agency-tier clients, and a "no code leaves the box" local-first deployment model. Rare corner where the demo is a red-team diff against a generated vuln, and the security domain forces the engineer to think about trust boundaries rather than just CRUD.

## Top 5 — Fun to Build

1. **240-the-lack-of-a-service-that-creates-hyper-personalized-g** — score 7.5/10
   _Hyper-personalized gamified English courses_
   Duolingo-format for narrow professional niches (barista in a vegan coffee shop, founder pitch deck). Combination of LLM content generation, gamification loops, voice UX, and a satisfying buyer demo (show, don't tell).

2. **218-photographer-loses-2030-of-clients-to-spam-needs-an-ai-** — score 6.5/10
   _AI voice clone for photographer's inbound calls_
   Voice cloning + conversational agent + booking integration; a satisfying end-to-end demo (call comes in → AI answers → photographer gets a confirmed booking). Visual polish story is built around the call-quality itself.

3. **583-as-a-former-cyber-security-analyst-i-noticed-multiple-s** — score 6.0/10
   _Security-scanner demo — the red-team diff is the show_
   Side-by-side "agent-generated code / scanner-found-this" panel is the entire demo loop; founders with Google/MS/Meta VDP recognition give the project a built-in credibility row. The attractive part is the agent-output attack surface — every new model release is a fresh corpus to test — and the agency tier's "attested PDF" report is a visually delicious artefact.

4. **206-a-designer-needs-an-ai-agent-to-eliminate-the-manual-dr** — score 5.5/10
   _Designer AI agent for responsive cross-device adaptation_
   Estonia-based designer with explicit WTP (€20–30/project). Computer-vision + diff + Figma plugin territory; high reward in seeing the agent reshuffle a desktop layout into a tablet layout in real time.

5. **239-hours-of-manual-searching-for-parts-for-chinese-car** — score 5.5/10
   _Visual parts-search for Chinese cars (Russia)_
   Multimodal search (photo → text query → part catalogue); interesting because it combines a real-world messy problem with a tight, satisfying demo and a niche user base that has few competitors.

---

## Changelog

- **2026-08-15 (cron run #5)** — re-ranked 411 projects after a fresh scrape added 7 new Reddit r/SaaS/r/startups captures (590–596). All 7 are low-substance discussion posts: 590 (events-passport founder asking whether to pivot to managed service — no WTP signal, advice question), 591 (SEO deindexing help request — no product), 592 (research request asking r/SaaS to volunteer pain points — no product), 593 (a real gap: social-media alerts with semantic search across Reddit + X.com, but no WTP stated and explicit "no PR" framing — undercuts GTM), 594 ($8 MRR AMA with no body text), 595 (image-only post about AI-agentified company), 596 (career rant with no product). **None displace any Top-5 slot.** The strongest in the batch was 593 (semantic Reddit + X alerts, money 4.0 / learn 5.5 / fun 4.5) — all scores below the current #5 entry (239, fun 5.5). The existing Top-5 in Money, Learn, and Fun remains unchanged. New-batch score ceiling: money 4.5 (590), learn 5.5 (593), fun 4.5 (593). Replaces the 2026-08-15 cron-run #4 ranking.

- **2026-08-15 (cron run #4)** — re-ranked 404 projects after a fresh scrape added 14 new Reddit r/SaaS captures (576–589). 13 of the 14 are meta-discussion posts (advice questions, "is X worth it?", cold-outreach laments, "new here", co-founder searches) — none displace the Money Top-5 or the Learn Top-4. **583 SaaSecure** (local AI-code scanner, $79 lifetime / $199 agency, OWASP top 10 + CI token + attested PDF) is the only real product in the batch and lands at **Learn #5 (6.0)** and **Fun #3 (6.0)** — B2B with WTP, but the founder already has a live site + VDP recognition so it does not displace 564's Money #3 spot at 7.5. Displaced from prior rankings: 564 (Fun #5: tie-breaking with 583's higher learn ceiling bumped 564 down a notch, and 583's tighter demo made it the more attractive Fun entry). New-batch score ceiling: money 7.5 (583, ties Money #3 but does not displace), learn 6.0 (583), fun 6.0 (583). Replaces the 2026-08-14 cron-run #3 ranking.

- **2026-08-14 (cron run #2)** — re-ranked 375 projects after a fresh scrape added 26 new Reddit r/SaaS captures (535–560). Most of the new batch are meta discussion posts (advice questions, motivation posts, screenshots) — they did not displace the existing top-5 in Money. Three new entries slotted into Learn (540 repobrain CLI, 536 CapyTrader, 557 indiatrusty decision engine) and one into Fun (546 UGC creative studio), displacing 285 KYC-orchestrator and 244 business-guide planner respectively. New-batch score ceiling: money 6.5 (540), learn 6.5 (540/536/238 tie), fun 5.5 (546). Replaces the 2026-08-14 cron-run #1 ranking.

- **2026-08-14 (cron run #3)** — re-ranked 390 projects after a fresh scrape added 15 new Reddit r/SaaS captures (561–575). This batch is almost entirely low-substance discussion posts (advice questions, "how did you find customers", "are books useful", negotiation advice) — none displace the Money Top-3. Two new entries reached the rankings: **564 agent-verifier** landed at Money #3 (7.5) and Learn #2 (6.5) and Fun #5 (5.5) — strongest all-rounder in the batch thanks to a concrete production failure mode and B2B design-partner outreach; **573 SOC 2 scramble** at Money #5 (7.0); **572 billing-dimension margin** at Learn #5 (6.0). Displaced from prior rankings: 004 cross-city handoff, 200 social-media lead finder (Money); 536 CapyTrader, 557 indiatrusty decision engine (Learn); 546 UGC creative studio (Fun). New-batch score ceiling: money 7.5 (564), learn 6.5 (564), fun 5.5 (564).

- **2026-08-14** — evaluated 249 projects (ProblemHunt + Reddit r/SaaS, fresh fetch). New top picks: 207-payment-routing, 010-tech-agency, 001-photographer, 252-payment-onboarding, 240-gamified-english, 238-direct-music, 218-voice-clone, 200-social-search, 004-handoff, 006-mover, 007-qa, 005-fieldstaff, 008-transit, 009-legal, 003-breeder, 002-screen-agent. Scores: avg money 3.1, learn 2.8, fun 3.3. Replaces the previous hand-edit (which covered only the first 10 projects).

- **<hand-edit, pre-cron>** — evaluated 10 projects. Manually ranked before the scraper was wired into the cron pipeline. Replaced by the 2026-08-14 cron-driven re-rank.
