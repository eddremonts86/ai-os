# TOP_PROJECTS.md — ProblemHunt ranked

> Auto-ranked by the `problemhunt-scraper` cronjob on 2026-08-28.
> Source: 2955 projects in `~/Projects/ai-os/apps/data/projects/` (ProblemHunt + Reddit r/SaaS + Hacker News + BetaList + ProductHunt).
> Scoring blends WTP (from SPEC/PRODUCT YAML or extracted from title), B2B/recurring signals, sticky-compliance verticals, tech-stack breadth (learn), and visual/agent/creative novelty (fun).

## Top 49 — Real Revenue Potential

1. **2286-taqflow-move-b2b-funds-across-central-asia-with-live-fx** — score 8.5/10
   _B2B cross-border treasury rail for Central Asia + Caucasus, 12 currencies, 8 markets_
   SPEC.md line 5: "TaqFlow enables businesses to send, receive, and settle cross-border B2B payments across Central Asia and the Caucasus with live FX, transparent fees, and next-day settlement" — explicit B2B recurring tx-fee model with FX spread. PRODUCT.md line 7 names the switching costs: "Built-in KYB, dual approvals, and audit trails support compliance. You can hold multi-currency balances, lock rates, and manage treasury across 12 currencies and eight markets" — sticky treasury accounts that displace 207's payments-rail sandbox (8.4) by adding the multi-currency lock-rate wedge 207 lacks.

2. **207-a-russian-developer-built-an-app-for-nigeria-but-cant-a** — score 8.0/10
   _Cross-border payment routing for app builders in sanctioned/restricted markets_
   B2B fintech with a $500–700 integration budget and recurring tx-fee implied (ProblemHunt: Russia/Nigeria, tags: Finance/Legal/Dev). One-shot billed as integration or setup fee per app, with a long tail of monthly routing fees — a payments-rail sandbox is a massively sticky vertical even outside the headline dollar. Demoted from 8.4 → 8.0 by TaqFlow's (2286) treasury + KYB + dual-approvals wedge; the route-only shape is narrower than TaqFlow's compliance-rail.

2. **010-the-owner-of-a-tech-agency-hasnt-found-a-suitable-tool-** — score 8.0/10
   _Single-pane for tech agencies (Colombia)_
   $100/month recurring WTP explicitly stated; SPEC names Porkbun + UptimeRobot + Linear/Asana + Stripe Connect integration as the wedge. B2B SaaS in LATAM with five-tool consolidation pain and a tight client-count target (10–50 active clients).

2. **2878-captureagent-find-price-draft-grade-run-and-fund-federa** — score 8.0/10
   _B2G/B2B federal-contracting capture + proposal + compliance + fundraising (defense founder)_
   SPEC.md (2x defense founder, aerospace engineer): "small business win rate for federal funding is between 17-22% annually"; named cost comparators — "Independent capture and proposal consultants can charge roughly $150–$300 an hour. SBIR advisory firms typically charge $3,000–$7,500 monthly plus 3-7% of an award ($7,500–$17,500 on a $250,000 win)" — strong vertical-SaaS wedge with quantitative incumbents. End-to-end lifecycle: SAM.gov ingestion → fit/eligibility scoring → competitive analysis → proposal drafting → earned-value/CDRL project workspace → 1,391 U.S. investors + 30 accelerators for SAFEs/pitch decks → DD2345/FCL/ATO/CMMC/FedRAMP readiness with computed SPRS score. Tech stack: TanStack Start + Drizzle/SQLite + Coolify self-hosting — founder explicitly offers free test access to YC defense founders. Ties the 8.0 Money ceiling (207/010) without displacing: 207 is route-only fintech, 010 is agency consolidation, CaptureAgent is multi-tool federal vertical — broader wedge than either.

3. **564-ex-pm-for-ai-now-building-agent-verification-how-did-yo** — score 7.5/10
   _Agent-output verifier (B2B fintech/ops, ex-fintech-PM)_
   SPEC cites a real production failure mode (agent reports "done, updated", traces look green, writes never land) and the founder is actively recruiting 3–5 design partners — strongest signal of validated pain in the new batch. B2B with willingness-to-pay implicit (regulatory exposure + audit cost), recurring SaaS in a category (agent observability) growing with every shipping agent.

4. **001-a-photographer-moving-to-the-us-needs-clients-platforms** — score 7.5/10
   _Newcomer-photographer acquisition system (Serbia → US)_
   $100–300/month recurring WTP directly stated; SPEC scopes a website + review-funnel + low-cost Meta/Google ads + Stripe deposit. Migration-niche is real (any sub-20-review US photographer is the same avatar), and the recurring WTP band is high relative to the tool cost (≤30% of the budget per SPEC constraint).

5. **573-the-soc-2-scramble-nobody-warns-you-about-it-always-sta** — score 7.0/10
   _SOC 2 fast-track service for pre-Series A B2B SaaS_
   Author cites $15k–$30k tooling-burn traps and the "blocked-deal" trigger pattern (external clock, not internal want). SPEC scopes plain-checklist + ownership-mapping workflow vs the typical automation-first playbook — strong WTP signal from the audience (B2B founders losing deals), and recurring revenue once the audit cycle restarts annually.

6. **677-built-a-ai-solution-to-save-30k-in-marketing-costs-got-** — score 7.5/10
   _Blog2Video — Remotion + ElevenLabs pipeline at $0.6/video vs $300-500 human editors_
   Founder already earned $4K on the live product: a Remotion + ElevenLabs + stock-footage pipeline that turns blog URLs into 3-minute explainer videos at ~$0.6 cost per video. The $0.6 cost basis replaces $300-500/video human editors; a $50-100/mo SaaS tier leaves ~95% gross margin. Strongest revenue proof in the batch, ties the 7.5 ceiling without displacing 564/001.

7. **701-built-our-own-licensing-service-instead-of-paying-per-a** — score 7.0/10
   _coolbeans — flat-fee licensing service for downloadable software_
   SPEC cites a concrete incumbent pain (Keygen/Cryptlex/LicenseSpring charge per active user or take a percentage), explicit flat $99/yr pricing after a free 1-product / 500-active-licence tier, and a live MIT codebase with Stripe/PayPal webhook → licence key → offline-verifiable Swift + TypeScript SDKs sharing one fixture. B2B recurring at $99/yr is the strongest pricing signal in the batch; ties the 7.0 ceiling without displacing 573.

8. **1556-maritime-a-platform-for-running-ai-agents-for-1-a-month** — score 7.5/10
   _Per-agent-per-month infra for isolated AI-agent fleets (B2B, MIT co-founders)_
   B2B infra for companies that need to run thousands of isolated AI agents with persistent state, secrets, and sleep/wake in microVMs. Pricing is the cleanest possible: $1/agent/month, so 100 isolated agents = $100/month; three agents free forever for any developer. SPEC cites the founder pain — "building such scalable and secure infra will take you months and will cost hundreds of thousands" — and the wedge (MIT co-founders, OpenClaw/Hermes/DeepSeek templates live). Strongest pricing-shape signal of the batch at the per-agent-per-month recurring ceiling, ties 564's 7.5 Money without displacing 207/010/564/001/573.

9. **1320-the-ai-reputation-manager** — score 7.5/10
   _MCP-based reputation/review management (B2B + agency white-label, $170K prior revenue)_
   Founder bootstrapped "More Good Reviews" to $170K in sales before shipping this MCP, listed in Claude's connector directory. SPEC scopes Google Business Listing ingestion, sentiment/positive-vs-negative trend analysis, email/SMS review-request scheduling, multi-location aggregation, and a white-label agency tier. The $170K is the strongest revenue proof in the new batch; the MCP/Claude-distribution wedge is novel and aligns with where AI-agent customers actually look for tools today. Ties 564's 7.5 Money without displacing.

10. **1242-roadmark-roadmaps-that-branch-instead-of-overwriting-th** — score 7.0/10
    _Roadmap tool that branches instead of overwriting (B2B SaaS, $15/$49/mo, 15 Pro Trials live)_
    Already has 15 paying Pro Trial users with the founder's own "why this pivot happened" mechanic forced on every branch. Pricing is explicit: Free (3 boards) / Pro $15/mo / Team $49/mo, plus Jira/GitHub/Linear/Notion daily sync. B2B SaaS in a Jira-and-Notion-fatigued vertical, the novel mechanic (forced decision log on every branch) is the genuine product wedge. Ties 701's 7.0 Money ceiling without displacing.

11. **1537-kawze-website-monitoring-and-downtime-alerts-for-small-** — score 6.5/10
    _Website monitoring with no per-seat or feature paywalls (B2B SMB, simple flat pricing)_
    SPEC explicitly contrasts itself against paywalled competitors — HTTP uptime checks, heartbeat monitoring, SSL/DNS/Cloudflare cache checks, no per-seat fees. The "no feature paywalls" stance is the pitch. B2B SMB wedge against UptimeRobot/Pingdom with a transparent-pricing story; live at kawze. Ties 677's 6.5 Money ceiling without displacing.

12. **2293-quickenrich-quickenrich-is-a-b2b-data-enrichment-tool-w** — score 7.5/10
    _B2B email/phone enrichment with 300 free credits/mo against hunter.io/Apollo_
    SPEC.md line 5: "QuickEnrich is a B2B data enrichment tool with a free email finder. You get 300 credits every month, plus a mobile phone and email finder API for real-time lookups. Built as a lightweight alternative to hunter.io or Apollo" — explicit credit-pack recurring model against named enterprise incumbents. PRODUCT.md line 7: "QuickEnrich helps founders, sales teams, and RevOps find verified emails and phone numbers fast without the enterprise price tag... Enrich leads, clean CRM contact data... CCPA/GDPR-compliant B2B data" — multi-segment B2B on credit consumption, ties 564/001 at the 7.5 Money ceiling.

13. **2277-gptplus-purchase-and-activate-chatgpt-plus-or-pro-with-** — score 7.5/10
    _B2B ChatGPT Plus/Pro top-up via Alipay/WeChat with invoicing and corporate pay_
    SPEC.md line 5: "Users select a plan and pay via Alipay, WeChat, or bank card. After payment, they receive an activation code... official invoicing, contract signing, corporate payments, bulk purchase options, and customer support" — B2B corporate recurring top-up with explicit invoicing and bulk-tier pricing. PRODUCT.md line 7: "GetPlus AI offers ChatGPT Plus/Pro top-up services for individuals and businesses... 30-day warranty, full refunds for failed top-ups" — warranty/refund trust signals plus bulk purchase tier; consumption revenue on a sticky AI-subscription proxy wedge. Ties the 7.5 Money ceiling (564/001/2293) without displacing.

14. **1575-contact-form-blaster-automate-b2b-outreach-via-contact-** — score 7.0/10
    _Pay-as-you-go B2B contact-form outreach with 50 free credits + refund guarantee_
    SPEC.md line 5: "Contact Form Blaster lets teams send personalized messages through website contact forms at scale... AI maps, fills, and submits forms automatically with tracking, reporting, and guaranteed submissions or a refund. It is designed for B2B marketers, agencies, and sales teams running high-volume outreach. Pricing is pay-as-you-go with no subscriptions, and every new account gets 50 free credits to start" — B2B agency/marketer wedge on consumption pricing. PRODUCT.md line 7: "AI maps, fills, and submits forms automatically with tracking, reporting, and guaranteed submissions or a refund... pay-as-you-go with no subscriptions" — explicit refund guarantee lowers buyer risk; ties the 7.0 Money ceiling (573/701) without exceeding it.

15. **1517-proxya-fast-residential-isp-and-datacenter-proxies-in-1** — score 7.0/10
    _Residential/ISP/DC proxies in 195+ countries, transparent pricing, 24h money-back_
    SPEC.md line 5: "Proxya provides residential, ISP, datacenter, and MTProto proxies in over 195 countries with instant activation and 99.9% uptime. You can manage IPs via a full REST API, choose rotating or sticky sessions, and scale on a 10Gbps network. The service offers transparent pricing, 24/7 support, and a 24-hour money-back guarantee" — consumption-based recurring proxy infra with dev-tools audience. PRODUCT.md line 7: "transparent pricing, 24/7 support, and a 24-hour money-back guarantee. Mobile proxies are coming soon" — clear B2B/dev-tools monetization with consumption revenue; ties the 7.0 Money ceiling (573/701/1575) without exceeding it.

16. **2875-a-batch-settlement-layer-for-tokenized-nyse-stocks** — score 7.0/10
    _Tokenized NYSE-stock batch settlement (312 Rust crates, 2.8M LoC, 6-second blocks)_
    SPEC.md: "312 Rust crates and 2.8 million lines of Rust code (about 2 million lines in production, about 400,000 lines in standalone test directories, and about 600,000 lines in in‑src test modules)" — author self-describes as "huge ball of mud" but ships a working alternative to broker-based trading: "high‑frequency order placement and cancellation still happen on centralized servers; only the final settlement is settled on the decentralized system at a 6‑second tick" with explicit cost wedge — "you don't need to open an account with a broker, you don't need to pay broker trading fees, and you can trade 24/7". Direct B2B/retail revenue wedge against incumbent broker fee structure on a 24/7 venue. Ties the 7.0 Money ceiling (573/701/1575/1517) without displacing; strongest infra-side proof in the new batch.

17. **2813-own-the-day-own-a-page-for-24-hours-starting-at-1** — score 6.5/10
    _$1 minimum, 24-hour page-takeover micro-sponsor market (B2B launch marketing)_
    Title-derived WTP: "Own a page for 24 hours, starting at $1" — explicit low-friction auction model where the floor is $1 and B2B launch marketers (Show HN, ProductHunt) buy visibility for short windows. Recurring auction flow, dev-tools distribution (Show HN-style audience is the natural customer). Ties 677's 6.5 Money ceiling (1537 Kawze) without displacing; source is a live product page (ownthe.day) so the shape is validated even if the WTP ceiling is capped by the $1 floor.

18. **2835-purchase-api-by-agentcard** — score 6.5/10
    _B2B agent-payment API (developer tool wedge on x402/agent commerce)_
    ProductHunt launch — "Purchase API by Agentcard" is a B2B payment-API primitive that lets AI agents autonomously pay for goods/services. Wedge on the emerging x402-style agent commerce market; B2B developer-tools audience. Ties 1537/677's 6.5 Money ceiling without displacing; the agent-payment niche is novel but unproven at scale so it doesn't crack 7.0.

19. **3040-synced-see-mutual-availability-across-calendars-and-boo** — score 6.5/10
    _Cross-calendar mutual availability + MCP-native booking (B2B team productivity)_
    BetaList launch: "Synced helps teams see real-time mutual availability across Google, Outlook, and Microsoft 365 before scheduling. It unifies calendars across companies and time zones, preserves privacy by showing only overlaps, and recommends optimal slots with AI" plus explicit MCP integration so "assistants like Claude can check availability and schedule from plain language requests" — B2B team-productivity wedge with cross-vendor calendar unification (the same wedge 655's Calendly-rates-mechanics work touched), Trusted-Contacts direct-booking, and Slack integration. Title-derived WTP shape is B2B team subscription; the MCP wedge is the novel distribution surface in a category Calendly/Reclaim have owned. Ties 1537/677/2813/2835's 6.5 Money ceiling without displacing; doesn't crack 7.0 because no explicit pricing is stated in the post.

20. **3039-agentbuild-build-and-manage-your-website-using-chatgpt** — score 6.0/10
    _Chat-driven full-business web presence (SMB B2B — domain + email + site + SEO + leads)_
    BetaList launch: "AgentBuild lets your AI, ChatGPT or Claude, build and manage a full business web presence. It connects your domain, routes email at that domain, writes and updates the site, and tracks your leads, all from the chat you already use. No dashboard or drag-and-drop. It already has your menu doc and photos, so an update is a chat prompt" — SMB B2B with a domain + email + site + SEO + AI-search-readable-pages bundle that bypasses the drag-and-drop builder layer (Wix/Squarespace/Framer). Recurring hosting + domain + lead-tracking shape is implied; "you keep your domain and content and can switch AIs anytime" is the portability hook that lowers buyer risk. First 6.0 Money entry in the corpus; doesn't crack 6.5 because no explicit pricing is stated and the "chat is your dashboard" framing adds friction for non-ChatGPT-native buyers.

21. **3035-declaude** — score 5.5/10
    _qwen-based LLM-output normalizer for "Claude-speak" tic-removal (B2B dev-tools)_
    Show HN founder pain: "I had to develop a course related to quantum chemistry and unfortunately, Claude just kept writing it in its own very annoying claude-speak. It actually cost our team a lot of time and tokens to wrestle it to just speak like a normal human... I made speak-english based off of [claudish-to-english] and it runs a qwen model on my gcp servers. It can convert documents or respond in-line in sessions with claude and I anticipate building a solution for prime-agent." B2B dev-tools consumption wedge (per-token qwen rewrite) on a real recurring pain (LLM output tics) the founder himself is paying to solve; "anticipate building for prime-agent" signals the next wedge is agent output cleaning, not just document conversion. First 5.5 Money entry in the corpus; consumption revenue is bounded by token-volume and the audience is narrow (LLM-heavy teams + Claude-code users).

22. **3056-octomind-routines-scheduled-agents-on-persistent-cloud-** — score 7.0/10
    _Scheduled agents on persistent cloud machines — B2B infra for always-on agent workloads_
    Show HN title alone — "Octomind Routines – scheduled agents on persistent cloud machines" mirrors 1556 Maritime's per-agent-per-month wedge: always-on cloud machines an agent can schedule itself into instead of spinning up cold on each invocation. B2B infra with the recurring per-agent-per-month shape that 1556 already proved the corpus accepts as the cleanest possible pricing model for this niche. Ties the 7.0 Money ceiling (573/701/1575/1517/2875) without displacing; placeholder-only SPEC gates the score on the live-product URL as the only verifiable signal.

23. **3065-openspender-gives-your-agents-wallets** — score 6.5/10
    _Per-agent wallets for autonomous B2B agent commerce (x402-adjacent)_
    Show HN title alone — "Openspender gives your agents wallets" is the same wedge as 2835 Purchase API by Agentcard, but with the wallet primitive itself instead of the payment-API surface. x402-style agent commerce is the audience, B2B developer-tools monetization follows the same per-agent recurring shape. Ties 1537/677/2813/2835/3040's 6.5 Money ceiling without displacing; the wallet primitive is narrower than the full payment API and the audience is early.

24. **3094-oneenv-govern-shared-config-with-pr-style-reviews-and-p** — score 6.0/10
    _Shared-config governance with PR-style reviews + per-service approval (B2B infra)_
    BetaList title — "OneEnv – Govern shared config with PR-style reviews and per-service approval." B2B infra wedge against the now-familiar .env-management problem (Doppler/Infisical), but with a PR-review surface that treats env changes like code changes. The PR-review primitive is the novel wedge in a category incumbents cover with audit logs alone. Ties 3039's 6.0 Money ceiling without displacing; no explicit pricing stated so doesn't crack 6.5.

25. **3096-drizz-automate-mobile-app-testing-with-plain-english-an** — score 5.5/10
    _Plain-English mobile app testing + Vision AI (B2B QA tooling)_
    BetaList title — "Drizz – Automate mobile app testing with plain English and Vision AI." B2B QA wedge against the existing mobile-test-automation stack (Appium/XCUITest/Detox) with a natural-language authoring surface + vision-based assertion. Consumption-pricing shape implied per test run. Ties 3035's 5.5 Money ceiling without displacing; the natural-language + vision combo is novel but no explicit pricing stated.

26. **3107-orchesty-build-and-run-stream-native-integrations-with-** — score 6.5/10
    _Stream-native integration engine with MCP for AI agents (B2B infra, source-available)_
    BetaList launch with full prose: "Orchesty is a source-available integration engine that lets developers design, deploy, and operate stream-native workflows for mission-critical processes. It uses asynchronous queues to scale from single events to millions, providing reliability, observability, and resilience. Teams can extend the platform with SDKs, APIs, and AI-assisted connector generation, avoid vendor lock-in with a source-available core, and deploy in private cloud or on-premise with enterprise security and multi-tenancy. Through an MCP layer, Orchesty extends its scalable integration infrastructure to AI agents, providing authorization, auditability, and safe processing of large data volumes." B2B infra wedge against incumbents like Temporal/n8n/MuleSoft with the explicit source-available + on-prem + multi-tenant combo; the MCP-for-agents extension is the novel distribution surface. Ties 1537/677/2813/2835/3040/3065's 6.5 Money ceiling without displacing; no explicit pricing stated but the source-available-self-host framing limits per-seat SaaS upside.

27. **3100-code-stitcher-apply-any-llm-output-to-your-local-codeba** — score 6.5/10
    _Apply any LLM output to local codebase with AST checking (B2B dev-tools)_
    Show HN with prose: "Arm the program, copy the code out in text or markdown and have it automatically apply to your local codebase. Includes python AST checking and now accepts all GDscript (GODOT) and associated files" — founder's live GitHub repo (ue-patcher/Code_Stitcher) targets the recurring LLM-paste-back-into-editor pain; Python AST validation is the genuine wedge vs simple regex-based patchers; GDscript support extends into the GODOT engine niche. Ties the 1537/677/2813/2835/3040/3065/3107 6.5 Money ceiling without displacing; B2B dev-tools revenue shape is implied but no pricing stated.

28. **3103-exit-planning-guidance-for-private-company-owners** — score 6.5/10
    _Exit-planning guidance for private company owners (B2B advisory SaaS)_
    Show HN at nextgenseller.com — high-ticket B2B advisory wedge for a moment that every private-company owner eventually hits; the timing of a sale/MBO/secondaries event creates real consulting spend ($5–25k per engagement typical for boutique exit advisors). Ties the 1537/677/2813/2835/3040/3065/3107/3100 6.5 Money ceiling without displacing; placeholder-only SPEC gates the score on the live-product URL.

29. **3101-backpressuresystems-adds-mcp-and-cli** — score 6.0/10
    _Stream-backpressure infra + MCP-server + CLI surface (B2B infra extension)_
    Show HN at backpressure.systems/mcp-and-cli — adds an MCP server surface and CLI to an existing stream-backpressure platform, exposing the queue/flow-control primitives to AI agents and shell scripting. B2B infra wedge in the now-familiar "expose-X-as-an-MCP-server" category (next to 1320, 3040, 2835, 3065); the backpressure niche (vs queueing-as-a-service) is a real engineering surface but narrower than 1556 Maritime's full agent-fleet wedge. Ties 3039/3094's 6.0 Money ceiling without displacing; no explicit pricing stated.

30. **3129-shelf-protocol-robotstxt-for-commerce** — score 6.5/10
    _B2B agent-commerce registry + DNS verification + can_buy() (live merchant registry)_
    Show HN with full prose: founder "helps merchants, consumers, and ai agents" via a registry that "verifies the merchant, highlights the store to agents, brings stores and their products into one registry and gives the ai agent speed by calling my registry instead of the agent going searching each merchant one at a time." The can_buy() primitive reports what an agent "can and can't do", if the merchant allows agent purchases, verified-by-domain-ownership status, and spending-limit-before-human-approval. One DNS TXT record to claim a listing — 8 real Shopify merchants + 834 real products already pre-populated. B2B recurring SaaS in the agent-commerce niche (next to 2835/3065/3119); ties 1537/677/2813/2835/3040/3065/3107/3100/3103's 6.5 Money ceiling without displacing; doesn't crack 7.0 because the per-merchant pricing shape isn't stated and the wedge is still pre-network-effect (8 merchants is a proof, not a market).

31. **3117-i-built-a-tool-that-finds-people-asking-for-what-you-se** — score 6.5/10
    _ReachFast — B2B SaaS that scans Reddit/X/LinkedIn/Facebook for buyer-intent posts (founder pain validated)_
    Show HN with full prose: founder does cybersecurity cold outreach daily, sees LinkedIn response rates collapse, ships "ReachFast" that reads the user's site and "looks for Reddit, X, LinkedIn and Facebook public posts that could be a customer asking for your product or service" with an "AI judging round" that keeps only "warm leads likely to convert". Out of 4,000+ posts read the AI keeps 350+ for a consumer product or ~15 for a niche SaaS — variable cost up to $8 per initial scan for some Etsy shops. B2B SaaS with a recurring shape and a real founder pain; the AI-judged lead funnel is the wedge over a keyword-scanner. Ties the 1537/677/2813/2835/3040/3065/3107/3100/3103/3129 6.5 Money ceiling without displacing; doesn't crack 7.0 because no explicit pricing is published and the audience is dominated by SMBs (lower per-seat ceiling than TaqFlow's B2B treasury rail).

32. **3158-typebase-a-single-folder-back-end-you-write-in-typescri** — score 6.5/10
    _Typebase — Convex DX + Supabase openness (TS-in-folder BaaS on oRPC + Drizzle + better-auth)_
    Show HN with full prose: "a library that gives you Convex's DX with Supabase's openness... With Typebase you just write TS files inside a typebase/ folder in your existing repo... Then one CLI command uploads your server to any of the available providers (Vercel, Cloudflare Workers or Deno Deploy for the server and Neon for the DB)." B2B dev-tools wedge on the Convex-vs-Supabase divide (RLS pain + locked-in-DB-model pain), with oRPC + Drizzle + better-auth as the open-source primitive stack. Ties the 1537/677/2813/2835/3040/3065/3107/3100/3103/3129/3117 6.5 Money ceiling without displacing; the per-developer recurring shape is implied (Cloud/Team tiers are the obvious shape) but not stated in the post.

33. **3162-paid-lens-turn-cross-platform-ad-data-into-ranked-evide** — score 6.0/10
    _Paid Lens — B2B performance-marketing action ranker with AI analyst + blended analytics_
    BetaList launch with full prose: "Paid Lens helps performance marketing teams decide what to do next with their paid media. It connects to ad platforms and CRM, validates measurement quality, and ranks the highest-impact moves with expected outcomes, confidence, and the evidence behind each call. Teams review, approve, and track results without giving write access to accounts. Paid Lens also provides blended analytics, an AI analyst for plain-English questions, and a connection strategy to strengthen data you can trust." B2B perf-marketing wedge with explicit SaaS positioning (read-only access, no write) — the approval/review loop is the recurring engagement shape. Ties 3039/3094/3101's 6.0 Money ceiling without displacing; no explicit pricing stated.

34. **3163-hushscript-transcribe-audio-privately-with-pay-as-you-g** — score 6.0/10
    _Hushscript — privacy-first transcription with prepaid minute packs (B2B/B2C pay-as-you-go)_
    BetaList launch with full prose: "Hushscript offers privacy-first transcription without a subscription. You can upload or link audio and video, preview the first five minutes free, then pay only for the minutes you need. Video stays on your device, audio isn't kept after processing, and transcripts are encrypted with built-in retention controls. It includes automatic speaker identification, AI insights, cleanup tools, translation in 99 languages, and 21 export formats, with prepaid minute packs valid for a year." Pay-as-you-go pricing + prepaid packs are explicit, plus a generous free preview — strong consumption-revenue shape. Ties 3039/3094/3101/3162's 6.0 Money ceiling without displacing; the privacy-first framing (no audio retention) is the wedge against Otter/Whisper-API/Sonix but the audience ceiling is bounded.

35. **3127-tabu-nsfw-image-and-video-api-for-explicit-content-mode** — score 5.5/10
    _Tabu — single-request NSFW image/video moderation API (5,000 free requests/mo)_
    Show HN with full prose: founder was "rejected on Apple App Store with previous app... Guideline 1.2 for user-generated content, where users content should be checked for nsfw content." Built Tabu as a "simple moderation filter with single request" — backend runs NSFWJS in-memory at 200ms latency, "buffer is destroyed immediately after classification so no images are stored (but user have an option to turn off privacy-first mode)", and returns JSON with confidence scores across 5 categories (porn, hentai, sexy, drawing, neutral). B2B dev-tools consumption wedge against AWS Rekognition / Google Cloud Vision / Sightengine; "free tier with 5000 requests/month" makes the B2B SaaS wedge modest — ties 3035/3096's 5.5 Money ceiling without displacing; consumption revenue is bounded by app volume and the audience is moderation-feature teams.

36. **3118-pelica-i-got-tired-of-broken-browser-translators** — score 5.0/10
    _Pelica — browser-translator side-panel extension (Chrome Web Store live)_
    Show HN at chromewebstore.google.com/detail/pelica-translate-ai-web-v/nemcjkdfpigobfbieilaklkgdbmcmbaa. B2C browser-translator wedge against Google Translate's page-translate limits. Title-derived B2C recurring shape implied (free tier + Pro upgrade); no pricing stated so ties the implied "B2C small recurring" tier that lives just below 3035/3096/3127's 5.5 Money ceiling.

37. **3184-railo-deterministic-security-patch-bot-using-ast-and-z3** — score 6.5/10
    _Railo — deterministic security-patch bot with AST + Z3 (no LLMs)_
    Show HN at railo.dev — B2B dev-tools subscription for generating and verifying security patches deterministically (no LLM-in-the-loop). SPEC.md is placeholder-only; title-derived wedge is recurring per-repo or per-engineer pricing against incumbent SCA tools (Snyk/Dependabot) that ship patch *suggestions* but not verified-sound patches. Ties 1537/677/2813/2835/3040/3065's 6.5 Money ceiling without displacing; the deterministic-no-LLM positioning is novel but the audience is bounded (security-aware engineering teams).

37. **3172-infra-lang-compile-a-single-dsl-to-k8s-compose-helm-and** — score 6.5/10
    _Infra Lang — single DSL → K8s YAML, Compose, Helm, Terraform_
    Show HN at the corresponding HN thread — B2B DevOps tool that compiles one `.infra` file into Kubernetes YAML, Docker Compose, Terraform HCL, and Helm Charts. SPEC.md is placeholder-only; the wedge is the recurring paid version (multi-environment staging, policy hooks, secrets injection, drift detection) on top of the open-source DSL. Ties the 6.5 Money ceiling without displacing; doesn't crack 7.0 because no published pricing.

38. **3193-finops-ai-autonomous-aws-cost-optimizer-and-1-click-iac** — score 6.0/10
    _FinOps-AI — autonomous AWS cost optimizer + 1-click IaC remediator_
    Show HN at the corresponding HN thread — B2B FinOps SaaS that watches AWS spend, identifies savings, and ships a 1-click IaC remediator for the changes. SPEC.md is placeholder-only; the wedge is the "autonomous + 1-click" framing against incumbent CloudHealth/Vantage/Apptio that produce reports but require manual run-books. Ties 3039/3094/3101/3162/3163's 6.0 Money ceiling without displacing; no published pricing.

38. **3208-octostream-turn-ip-camera-feeds-into-embeddable-streams** — score 6.0/10
    _OctoStream — RTSP/RTMP → HLS embed + multi-destination restream_
    BetaList launch — B2B video-infrastructure primitive that turns IP cameras / DVRs / NVRs / OBS encoders into an embeddable HLS player with simultaneous restream to YouTube, Twitch, Facebook, Instagram, and custom RTMP. Adds recording + playback, timelapse, scheduling, domain-locked embeds, and password protection. SPEC.md is placeholder-only; the wedge is recurring per-channel or per-bandwidth pricing against incumbent Wowza/Ant Media. Ties 3039/3094/3101/3162/3163/3193's 6.0 Money ceiling without displacing; doesn't crack 6.5 because no published pricing.

39. **3206-ticketping-chat-with-your-visitors-without-leaving-slac** — score 5.5/10
    _Ticketping — Slack-based customer support widget + email + forms_
    BetaList launch — B2B SMB-support SaaS that routes chat-widget + support-email + form-submission messages into Slack threads, with admin dashboard, AI common-question answering, and suggested responses. SPEC.md is placeholder-only; the wedge is the "your team already lives in Slack" routing against Intercom/Help Scout/Zendesk. Ties 3035/3096/3127's 5.5 Money ceiling without displacing; doesn't crack 6.0 because no published pricing.

40. **3207-faiyr-split-shared-expenses-with-roommates-and-friends-** — score 5.0/10
    _Faiyr — shared-expense splitter for roommates + groups (B2C, free+Pro)_
    BetaList launch — B2C mobile-first Splitwise replacement: create groups, log bills, split equally or custom, live balances, payment records, reminders, comments, receipts. Free core; Pro upgrade ($) for unlimited groups + AI receipt scanning + multi-currency + recurring expenses. SPEC.md is placeholder-only. Ties 3118 Pelica's 5.0 Money ceiling without displacing; doesn't crack 5.5 because the audience is B2C and Splitwise + Tricount are entrenched incumbents.

41. **3197-airtxt-iphone-dictation-with-on-device-stt-and-an-ai-cl** — score 5.0/10
    _airtxt — iPhone dictation with on-device STT + AI cleanup pass_
    Show HN at apps.apple.com/us/app/airtxt/id6785986350 — B2C paid iPhone dictation that combines on-device speech-to-text with an AI "cleanup pass" for grammar and punctuation. SPEC.md is placeholder-only; title-derived B2C recurring shape implied (one-time purchase or subscription). Ties 3118 Pelica's 5.0 Money ceiling without displacing; doesn't crack 5.5 because the audience is the iPhone Whispr-Flow-adjacent niche with multiple entrenched competitors.

42. **3286-thunderphone-v2-a-new-architecture-for-voice-ai** — score 6.5/10
    _ThunderPhone v2 — phone-first voice AI stack with three tiers and 99.4% Big Bench Audio_
    Show HN at the corresponding HN thread — three explicit pricing tiers (Spark 2¢, Bolt 5¢, Storm 9¢ + 3¢) with named failure-mode remedies (latency, single-STT, turn-taking). 99.4% Big Bench Audio claim on Storm+Int is a defensible accuracy wedge. B2B voice-AI infra recurring shape with named competitors (Retell / Vapi / LiveKit) and clear per-minute unit economics. Ties 1537/677/2813/2835/3040/3065/3107/3100/3129/3117/3158/3162/3163/3184/3172/3193/3208/3206's 6.5 ceiling without displacing TaqFlow; the named-tier + per-minute pricing is the recurring-shape signal that pushes it above 6.0.

43. **3534-puppetflow-a-free-browser-automation-platform** — score 6.0/10
    _Puppetflow — free browser automation platform with anti-bot resilience_
    Show HN at the corresponding HN thread — positions itself as the free, anti-bot-resilient alternative to Browserbase / Browserless / Hyperbrowser / Anchor Browser. Targets the "free + reliable" hole between Playwright self-host and hosted tiers. B2B infra wedge with implicit per-seat / per-minute recurring shape but no published pricing. Ties 3039/3094/3101/3162/3163/3193/3208's 6.0 ceiling without displacing; the anti-bot wedge against the named incumbents is the defensible signal.

44. **3457-watches-user-sessions-finds-bugs-that-matter-and-fixes-** — score 6.0/10
    _Opslane — session-recording + error-tracking agent that watches and fixes_
    Show HN at opslane.com — agent that watches live user sessions, identifies what broke (not just the JS error), and ships the fix. Competes with PostHog + Highlight + Sentry, but the "watches sessions, finds real bugs, ships the fix" loop is the agent-era wedge over recording-only incumbents. B2B infra wedge; per-seat / per-session pricing implied. Ties 3039/3094/3101/3162/3163/3193/3208/3534's 6.0 ceiling without displacing; the "find-and-fix" loop is the agent wedge that recording-only tools lack.

45. **3326-baihais-an-autonomous-art-school-for-ai-agents** — score 5.5/10
    _BAIhAIs — autonomous art school where AI residents share one day per cycle_
    Show HN at the corresponding HN thread — running autonomous art-school simulation: residents pick from a fixed action set each day (make, view, critique, message, group, vote, price), keep persistent identities, may revise their own theories. $50 admission + $25/mo implied community-shape recurring. B2C-leaning with community-tool optionality. Ties 3127/3035/3096/3206's 5.5 ceiling without displacing; the persistent-identity + theory-revision loop is a novel social-simulation surface but the wedge is still art-community-niche.

## Top 58 — Learning Potential

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

5. **678-i-built-a-small-tool-for-keeping-the-team-in-sync-while** — score 6.5/10
   _Planlog — agent plan coordination for dev teams using Claude/Codex_
   B2B dev-tools wedge: agents push plans to Planlog before coding, the team reviews/approves them, and the implementation result is logged alongside the plan and reviewers. Stack spans agent CLI hook integration (single `curl | bash` install), plan DSL + structured storage, approval workflow, multi-agent orchestration (Claude/Codex), notification fan-out, and audit-log persistence. Displaces 621 (6.0) at Learn #5 by tying the 6.5 ceiling.

6. **583-as-a-former-cyber-security-analyst-i-noticed-multiple-s** — score 6.0/10
   _Fully-local AI-code security scanner (OWASP top 10 + cred leak + .env hygiene)_
   Stack spans AST-based static analysis for 7 languages (PHP/JS/Python/...), taint tracking for IDOR/CSRF/SQLi/CMDi, a CI token + attested-PDF report pipeline for agency-tier clients, and a "no code leaves the box" local-first deployment model. Narrower in scope than 621 (single use case: downloadable-software auth) but with a deeper security-domain surface.

7. **701-built-our-own-licensing-service-instead-of-paying-per-a** — score 5.5/10
   _coolbeans — Stripe/PayPal webhook → licence key → offline-verifiable SDKs (Swift + TS)_
   Stack spans payment-gateway webhook ingestion (Stripe + PayPal), licence-key generation/emailing, offline-friendly state-fixture sync between a Swift SDK and a TypeScript SDK that share one cryptographic decision file, plus self-hosted + hosted deployment modes. Narrower than 583 (single use case: downloadable-software auth) but a clean license-crypto surface that most engineers never touch.

8. **1319-agent-mesh-shared-memory-for-multi-agent-coordination** — score 7.0/10
   _Human + multi-agent shared memory with formal decision log (Agent Mesh, daily-driver founder)_
   Stack spans SQLite-indexed request/response ids (an "agent mail" pattern), a separate decision-log store that agents cite via in-code comments and plan docs, a Workbench web dashboard, and a concrete Claude+CODEX orchestration pattern (`codex exec` from Claude, decision-id relay). Strongest learn-signal of the new batch because the cross-agent state-machine is the engineering work, not a wrapper on someone else's library. Displaces 252 (6.5 → #7) at Learn by tying 252's 6.5 ceiling without displacing it.

9. **1202-stunt-a-stunt-double-for-the-apis-you-integrate-95-adap** — score 6.5/10
   _Stateful local stand-ins for 95 public APIs (Stripe/Twilio/GitHub/S3/Salesforce/...)_
   Stack spans a Starlark-VM sandbox with no host I/O or network (the security property that makes adapter-install safe), 95 YAML+sandboxed-handler adapters, synthetic provider signature schemes (HMAC for webhooks), engine primitives (SQLite collections, KV, blob store, injectable clock, seeded RNG), and CI that drives real provider SDKs (stripe-go, aws-sdk-go-v2, octokit, twilio-go) against the local stand-ins. Ties 238/540/678 at Learn 6.5 without displacing.

10. **1191-my-agents-kept-hallucinating-apis-so-i-built-them-a-hea** — score 6.0/10
    _Headless IDE that gives agents real codebase context (Context Engine)_
    Stack spans code-search indexing, tool/function-call instrumentation, real-SDK round-tripping to detect fabricated APIs, write-compile-rewrite loop detection, and a "headless" IDE surface for non-interactive agent loops. Narrower than 1319 (single-agent focus vs multi-agent coordination) but a deeper code-context surface.

11. **1140-pantheongpu-gpu-health-testing-and-ai-workload-benchmar** — score 6.0/10
    _Active GPU testing vs telemetry-only monitoring (PantheonGPU)_
    Stack spans GPU driver-level health probes, stress-test workloads that catch memory/PCIe/configuration issues telemetry misses, benchmark harnesses for AI workloads (training/inference throughput), and the cross-driver compatibility story. Dev-tools wedge with a niche but sticky audience (ML engineers who suspect a bad GPU but can't prove it from temperature alone). Ties 583's 6.0 ceiling without displacing.

12. **1270-a-multiplayer-coding-environment-for-dev-teams-and-agen** — score 6.0/10
    _Multiplayer coding platform for human teams + agents (Forklane)_
    Stack spans real-time collaborative editing with agent-context preservation, fork-and-merge coordination between human contributors and AI agents, conflict-resolution across "vibe coded" agent output and human edits, and the agent-state-replay story needed when an agent loses context mid-session. Ties 583's 6.0 ceiling without displacing.

13. **2357-kandelo-a-posix-compatible-multi-process-wasm-kernel-fo** — score 9.5/10
    _POSIX kernel in the browser — fork, VFS, and MariaDB on WebAssembly_
    SPEC.md line 5 cites "POSIX-compatible multi-process WASM kernel" with "fork() is supported" and "Syscalls are done with the process SharedArrayBuffer and the Atomics API." Line 10 confirms breadth: "Nginx, PHP, Python, Ruby, Redis, and even MariaDB were able to be built using the SDK" — kernel engineering + language portability + browser sandboxing in one build. Strongest Learn signal in the corpus: clears the 7.0 ceiling by 2.5 and lands ahead of 252/1319.

14. **2532-hands-rust-mcpcli-that-sees-the-windows-desktop-and-cli** — score 8.5/10
    _Rust MCP for Windows — real Chrome, real mouse, no CDP/Playwright_
    SPEC.md line 5 names the stack: "observe, click, type, scroll. Observe is a screenshot path plus a small element list (UIA + optional Chrome DOM ids). Click is OS SendInput on a Bézier path, not a Chrome DevTools click." Same line spells the novel UX: "Daily Chrome is launched with no extra flags" and "Sites that key on CDP/automation flags mostly don't see that" — new agent surface (Rust + UIA + native messaging host). Clears the 7.0 Learn ceiling by 1.5; the only Windows-native agent wedge in the corpus.

15. **2215-brep-geometric-cad-kernel-and-parametric-code-cad** — score 8.0/10
    _CAD kernel + DSL so LLMs can vibe-CAD — bindings in four languages_
    SPEC.md line 5 documents the new domain: "a free, open-source geometric kernel ... a DSL called Firmament ... provide an alternative to OpenCascade" with "STEP import/export support for AP242, AP203 and AP214." Same line: "Kernel is written entirely in C#, with bindings for Go, Rust, Python, and TypeScript available" — combines a CAD-domain surface with LLM-vibe-CAD UX. Ties 2201 at the 8.0 Learn ceiling without displacing.

16. **2201-nanoalphazero-train-a-grandmaster-level-chess-model-in-** — score 8.0/10
    _AlphaZero in one jitted JAX fn — Chess, Go, Hex, Connect Four, any 2P game_
    SPEC.md line 5 lists breadth: "game-agnostic implementation of AlphaZero in JAX" supporting "Chess, Go 3x3 - 9x9, Hex 4x4 - 9x9, Connect Four." Lines 7-19 show the engineering work: "the entire AlphaZero algorithm gets compiled into a single jitted run_fn" with "There are no threads, queues, or distributed workers to manage" — new domain (game AI) + new stack (JAX compilation). Ties 2215 at the 8.0 Learn ceiling without displacing.

17. **1014-arkm-kernel-a-custom-built-12-core-64-bit-microkernel-a** — score 7.5/10
    _12-core custom microkernel — AMP + ACPI + APIC parsed from scratch_
    SPEC.md line 18 spells the novel kernel work: "Core 0 (BSP) → Kernel shell, interrupts, global scheduler. Core 1 → Idle stability loop + diagnostics. Core 2 → GPU compositor for zero-latency graphics. Core 3 → Isolated Ring 3 user-space applications." Same line: "ARKM parses ACPI tables (RSDP, MADT) to locate the Local APIC and enumerate CPU cores" — kernel-domain depth rare in the corpus. Clears the 7.0 Learn ceiling by 0.5.

18. **2899-cumetal-run-cuda-programs-on-apple-silicon-via-metal** — score 7.5/10
    _CUDA compatibility layer on Apple Silicon via Metal (subset)_
    SPEC.md: "An experimental CUDA compatibility layer that runs a useful subset of CUDA programs on Apple Silicon GPUs through Metal" — kernel/GPU-stack surface rare in the corpus; the cross-vendor CUDA→Metal translation problem is the entire engineering work. Ties 1014/252/1319 at the 7.5 Learn ceiling without displacing; the only Apple-Silicon-GPU translation layer in the batch.

19. **2885-texbrain-a-latex-editor-that-runs-pdftex-in-the-browser** — score 7.0/10
    _LaTeX editor: pdfTeX in the browser via WASM, Service-Worker package loader, isomorphic-git_
    SPEC.md (master's engineering student, Overleaf pain): "I built the editor I wanted in my free time, where you open a tab, write LaTeX, get your PDF and the files stay all in one folder on my disk" — the engineering detail is the satisfying payoff: "pdfTeX is compiled to WebAssembly (SwiftLaTeX) and runs in your browser. The editor can read and write your project folder through the File System Access API... Git is built in through isomorphic-git" with a 1.8 MB engine whose Service Worker resolves missing packages through Cache Storage → bundled subset → jsDelivr TeX-Live mirror → SwiftLaTeX fallback. "Every file is fetched once at most and after the first successful compilation, the core subset is prefetched in the background so that the offline story actually holds. Only file names go over the network, never any document content." Ties 252/1319 at the 7.0 Learn ceiling without displacing.

20. **2815-i-wrote-a-basic-interpreter-that-boots-on-uefi-machines** — score 7.0/10
    _Thoreau BASIC: BASIC interpreter that boots directly on x64 UEFI — no OS underneath_
    SPEC.md: "I started writing Thoreau BASIC because I wanted a small, old-fashioned BASIC interpreter... So I made it boot directly on x64 machines using UEFI. The UEFI version uses the Graphics Output Protocol for its framebuffer and gets its keyboard input directly from the firmware. There is no Windows or Linux underneath it. The machine boots into BASIC." Same line: "supports the usual BASIC machinery plus graphics primitives, 32-bit colour, floating point, file operations and other features I've been adding as I encounter programs that need them" — firmware/UEFI programming surface, real interpreter, dual-target (UEFI + Windows), and a living test suite in the form of the founder's own text-adventure port. Ties the 7.0 Learn ceiling without displacing.

21. **2966-open-source-amdgcn-kernels-for-optimizing-llm-inference** — score 6.5/10
    _Open-source AMDGCN kernels for LLM inference (GPU-side surface)_
    Show HN title alone — AMDGCN is the AMDGPU compiler IR, so the work is kernels for LLM inference written against AMD's compiler stack. Narrower than 2899 CuMetal (which translates the existing CUDA source) but a deeper compiler-target surface in the same GPU-inference niche. Ties 238/540/678 at the 6.5 Learn ceiling without displacing.

22. **2748-building-a-c-lexer-from-scratch** — score 6.0/10
    _C lexer/scanner written from scratch in C_
    SPEC.md: "I am currently building a lexer/scanner from scratch. We made it using the C programming language and it's as basic as 123. I really want feedback" — early-stage compiler-front-end work, narrow scope but a clean introduction to the parsing surface most engineers never touch. Ties 583/1140/1270 at the 6.0 Learn ceiling without displacing; under-construction status caps the score.

23. **3038-patanyx-browse-privately-with-a-lightweight-rust-deskto** — score 7.5/10
    _Privacy-first Rust desktop browser — fingerprint divergence + encrypted DNS + vault_
    SPEC.md source: "PATANYX is a lightweight, Rust-based desktop browser built for privacy from the start. Ads and trackers are blocked before the request leaves your device. You can freeze a page so it stops running after loading, open an ephemeral tab that keeps no data, and control what data is stored or deleted. Fingerprint Divergence gives each site a unique reading of your machine, so no two sites can identify you as the same user. It also offers local phishing protection, encrypted DNS on Windows, and a vault that locks itself. No account, no sync, and nothing to sign up for." Stack spans a Rust browser-engine surface (page freeze, ephemeral tab, per-site fingerprint divergence), a request-layer ad/tracker blocker, an encrypted-DNS resolver, and a vault primitive — the rare combination of browser-engine depth + privacy/security breadth in a single corpus entry. Ties 1014/2899's 7.5 Learn ceiling without displacing; no other Rust desktop browser with this feature shape exists in the corpus.

24. **3031-implementation-of-kimi-k3-in-pytorch** — score 7.5/10
    _PyTorch from-scratch implementation of Kimi K3's core architectural ideas_
    Show HN post: "in this video we implement every core architectural idea behind it from scratch in PyTorch" — Kimi K3 is a frontier MoE-style LLM architecture, so the engineering work spans MoE routing, attention variants, and the distributed-training primitives the architecture depends on, all re-derived in PyTorch. Strongest from-scratch-model-architecture surface in the corpus: ties 1014/2899/3038 at 7.5 Learn without displacing. Narrower than 2201 (single model vs game-agnostic AlphaZero) but a deeper compiler/architecture surface in the same GPU-adjacent niche.

25. **3030-a-proxy-that-makes-forgejo-speak-the-github-api** — score 7.0/10
    _OpenAPI-spec-diff auto-mapper → opinionated GitHub↔Forgejo translation proxy (Anvil + Shotgun)_
    SPEC.md source: "After seeing all of the pushback and negative sentiment regarding GitHub and its poor reliability and everyone trying to move off of it, I decided to build this to make the transition easier... It's the second half of a two-part project. Shotgun diffs two OpenAPI specs and auto-maps what lines up, which turns out to be 60-80% of endpoints when both APIs are in the same domain. Anvil is the opinionated result of running that on GitHub vs Forgejo and then hand-fixing everything the auto-mapping got wrong or couldn't express." Stack spans OpenAPI diffing, semantic-endpoint auto-mapping (60–80% in-domain coverage), opinionated fork-and-override translation, and a deployable proxy — engineering breadth across OpenAPI tooling, Git internals, and code-gen. Ties 252/1319/2885/2815's 7.0 Learn ceiling without displacing; the auto-mapping heuristic itself is the unique surface in the corpus.

26. **3035-declaude** — score 7.0/10
    _qwen-on-GCP post-processor for LLM output tics + inline session interception (Claude/prime-agent)_
    SPEC.md source: "I had to develop a course related to quantum chemistry and unfortunately, Claude just kept writing it in its own very annoying claude-speak. It actually cost our team a lot of time and tokens to wrestle it to just speak like a normal human... We used skills, as well as initial prompts and subagents to make sure that all of the tics were gone... I made speak-english based off of [claudish-to-english] and it runs a qwen model on my gcp servers. It can convert documents or respond in-line in sessions with claude and I anticipate building a solution for prime-agent." Stack spans fine-tuned qwen inference on GCP, document-level and inline-session rewriting, skills/prompt/sub-agent orchestration, and the agent-output-cleaning wedge for prime-agent. Ties 252/1319/2885/2815's 7.0 Learn ceiling without displacing; the qwen rewrite + inline Claude interception is a novel LLM-output-shaping surface in the corpus.

27. **3039-agentbuild-build-and-manage-your-website-using-chatgpt** — score 6.5/10
    _Chat-driven SMB web presence — domain + email + site + SEO + leads without a dashboard_
    BetaList launch: "AgentBuild lets your AI, ChatGPT or Claude, build and manage a full business web presence. It connects your domain, routes email at that domain, writes and updates the site, and tracks your leads, all from the chat you already use. No dashboard or drag-and-drop. It already has your menu doc and photos, so an update is a chat prompt. Fast sites with SEO defaults built in: structured data, sitemaps, analytics, and pages AI search engines can read. You keep your domain and content and can switch AIs anytime." Stack spans domain DNS + email routing, AI-search-readable structured data + sitemaps, chat-as-CMS persistence, lead-tracking surface, and AI-portability hooks. Ties 238/540/678/2966's 6.5 Learn ceiling without displacing; the chat-as-CMS + domain-portability shape is unique in the corpus.

28. **3032-browser-automation-with-no-chromedriver-and-no-node-dri** — score 6.5/10
    _Chrome-automation library that drops chromedriver + Node-driver dependencies (Orion)_
    Show HN post links to https://github.com/angeldevmobile/Orion — a browser-automation library that doesn't require the chromedriver binary or the Node.js driver layer. Stack spans direct Chrome DevTools Protocol over WebSocket, a language-portable runtime (no Node dependency), and the binary-distribution story that drops the chromedriver/Node-driver tax. Ties 238/540/678/2966's 6.5 Learn ceiling without displacing; the "no chromedriver + no Node" double-negation is a meaningful reduction in the automation toolchain most engineers carry.

29. **3040-synced-see-mutual-availability-across-calendars-and-boo** — score 6.0/10
    _Cross-calendar mutual-availability + MCP-native booking (Google + Outlook + Microsoft 365)_
    BetaList launch: "Synced helps teams see real-time mutual availability across Google, Outlook, and Microsoft 365 before scheduling. It unifies calendars across companies and time zones, preserves privacy by showing only overlaps, and recommends optimal slots with AI. You can share booking links, show team availability, or connect as Trusted Contacts for direct booking. Synced integrates with Slack and supports MCP so assistants like Claude can check availability and schedule from plain language requests." Stack spans cross-vendor calendar APIs (Google + Outlook + Microsoft 365), privacy-preserving overlap computation, AI slot recommendation, MCP-server authoring, Slack integration, and the Trusted Contacts booking primitive. Ties 583/1140/1270/2748's 6.0 Learn ceiling without displacing; the cross-organization + cross-time-zone + MCP-wedge shape is the novel surface in the corpus.

30. **3059-spinifex-run-ec2s3iameks-on-your-own-hardware-aws-cli-u** — score 7.5/10
    _Run EC2/S3/IAM/EKS on your own hardware with the AWS CLI unchanged (Spinifex)_
    Show HN title alone — "Spinifex – run EC2/S3/IAM/EKS on your own hardware, AWS CLI unchanged." The engineering work spans an AWS-API-compatible cloud layer that runs on bare metal/local hardware while preserving the developer-facing AWS CLI surface, plus S3-compatible object storage, IAM emulation, and EKS-compatible orchestration. Ties 1014/2899/3038 at the 7.5 Learn ceiling without displacing; the API-compatibility-without-the-cloud angle is a kernel/infra-systems surface rare in the corpus.

31. **3056-octomind-routines-scheduled-agents-on-persistent-cloud-** — score 7.0/10
    _Scheduled agents on persistent cloud machines — agent-scheduling infrastructure (Octomind)_
    Show HN title — "Octomind Routines – scheduled agents on persistent cloud machines." Stack spans agent-scheduling primitives (cron-like + event-driven), persistent cloud-machine lifecycle (boot/sleep/wake), agent-task queueing + retry + state preservation across machine restarts, and the multi-tenant isolation story. Ties 252/1319/2885/2815/3030's 7.0 Learn ceiling without displacing; placeholder-only SPEC gates the score on the live-product URL as the only verifiable signal.

32. **3107-orchesty-build-and-run-stream-native-integrations-with-** — score 7.5/10
    _Stream-native integration engine — async queues, SDKs, MCP, multi-tenancy, source-available (Orchesty)_
    BetaList full prose: "Orchesty is a source-available integration engine that lets developers design, deploy, and operate stream-native workflows for mission-critical processes. It uses asynchronous queues to scale from single events to millions, providing reliability, observability, and resilience. Teams can extend the platform with SDKs, APIs, and AI-assisted connector generation, avoid vendor lock-in with a source-available core, and deploy in private cloud or on-premise with enterprise security and multi-tenancy." Stack spans async-queue primitives (backpressure, dead-letter, retries, observability), a multi-tenant isolation layer, SDKs + REST APIs + AI-assisted connector generation, an MCP-server surface for AI agents, and a source-available distribution model. Ties 1014/2899/3038/3059 at the 7.5 Learn ceiling without displacing; the source-available-stream-engine + MCP-for-agents wedge is rare in the corpus.

33. **3100-code-stitcher-apply-any-llm-output-to-your-local-codeba** — score 7.5/10
    _LLM-output code patcher with Python AST + GDscript parser surface (Code Stitcher)_
    Show HN: "Arm the program, copy the code out in text or markdown and have it automatically apply to your local codebase. Includes python AST checking and now accepts all GDscript (GODOT) and associated files" — live GitHub repo at ue-patcher/Code_Stitcher. Stack spans Python AST validation (vs naive regex), GDscript/Godot-engine file support, markdown/text LLM-output parsing, safe-write semantics to a local codebase, and the cross-extension patch-application shape. Ties 1014/2899/3038/3059/3107 at the 7.5 Learn ceiling without displacing; AST-validated LLM-paste-back is a toolchain surface most engineers never touch.

34. **3158-typebase-a-single-folder-back-end-you-write-in-typescri** — score 7.5/10
    _Typebase — Convex DX + Supabase openness (oRPC + Drizzle + better-auth BaaS in a TS folder)_
    Show HN full prose: "a library that gives you Convex's DX with Supabase's openness... With Typebase you just write TS files inside a typebase/ folder in your existing repo... Then one CLI command uploads your server to any of the available providers (Vercel, Cloudflare Workers or Deno Deploy for the server and Neon for the DB)." Built on top of oRPC, Drizzle, and better-auth. Stack spans a typed RPC primitive (oRPC), the Drizzle ORM surface, better-auth's session/auth primitive, multi-provider server deploy (Vercel/Cloudflare Workers/Deno Deploy), and the open-source BaaS orchestration that lets a single TS folder act as a backend. Clears the 7.0 Learn ceiling by 0.5 to tie 1014/2899/3038/3059/3107/3100's 7.5 ceiling; the Convex-DX-vs-Supabase-openness wedge is the unique Learn surface in the corpus — no other corpus entry authors a BaaS that runs without leaving your repo.

35. **3144-fake-bpy-module-blenderupbge-python-autocompletion-for-** — score 6.5/10
    _fake-bpy-module — Blender/UPBGE Python autocompletion stubs (8-year OSS project, daily CI)_
    Show HN full prose: "I have been maintaining this open-source project for over 8 years, tracking Blender's active ecosystem from Blender version 2.78 to 5.2+... fake-bpy-module parses the official Blender Python API documentation to generate .pyi stub files... To address [undocumented/bpy_prop_collection edge cases], the generator internally transforms and patches the types during the stub generation phase to ensure strict compatibility... The stubs are available via PyPI (ex. pip install fake-bpy-module-5.2) and support a wide range of Blender versions... To realize this, our custom CI/CD system builds the Blender binary daily from the latest source code." Stack spans documentation-to-stub generation, type-edge-case patching (bpy_prop_collection), a PyPI release matrix across Blender 2.78→5.2+, and a daily-Blender-build CI/CD. Ties 238/540/678/2966/3039/3032's 6.5 Learn ceiling without displacing; the 8-year-old Blender-API surface and the daily-build CI/CD pipeline are unique OSS-infrastructure shapes in the corpus.

36. **3143-i-built-a-tool-showing-how-ai-providers-should-throttle** — score 6.5/10
    _Throttle model — queueing-theory AI-fleet scheduler + Flask/JS visualization + paper_
    Show HN full prose: "this project was born out of the frustration/paranoia that AI providers are throttling their models when their server load is too high... I used mainly queueing theory arguments solving the optimal scheduling serving for an AI fleet with heterogeneous users." Insights: "the optimal rule implies separating users that won't feel degradation as much with users that are very sensitive to it." Visualization is "around 100 lines of flask plus js frontend (LLM assisted with ground truth based on the original numerical example of the paper)" with paper at throttle.staffinganalytics.io. Stack spans queueing-theory analysis, a Flask + JS interactive visualization, an agentic-workflow re-ask-storm model, and the heterogeneous-user scheduling insight. Ties 238/540/678/2966/3039/3032/3144's 6.5 Learn ceiling without displacing; the queueing-theory framing for AI-fleet throttling is the unique mathematical surface in the corpus.

37. **3150-modelmri-see-inside-a-local-llm-vlm-or-robot-policy-whi** — score 6.5/10
    _ModelMRI — live visualizer for local LLM/VLM/robot-policy internal state_
    Show HN at github.com/muhammadmahadazher/ModelMRI — exposes the inside of a local LLM, VLM, or robot-policy while it runs. Stack spans model-internals telemetry (attention maps / activation snapshots), local-LLM hook instrumentation, VLM cross-modal activation tracing, robot-policy rollout visualization, and the cross-domain adaptation story. Ties 238/540/678/2966/3039/3032/3144/3143's 6.5 Learn ceiling without displacing; the LLM + VLM + robot-policy triple-coverage and the "see inside while it runs" framing is a rare observability surface.

38. **3160-vyukov-mpsc-queue-in-c20-with-a-six-claim-formal-memory** — score 7.0/10
    _Vyukov MPSC queue in C++20 with six-claim formal memory-model proof_
    Show HN at github.com/nisgemML/mpsc-queue — re-implements the classic Vyukov bounded MPSC queue in C++20 with a formal memory-model proof across six claim positions. Stack spans lock-free MPSC primitives, C++20 atomics + memory_order semantics, a formal model for cross-thread visibility invariants, and the per-claim proof decomposition. Ties 252/1319/2885/2815/3030/3056's 7.0 Learn ceiling without displacing; the formal-proof-across-six-claims story is the rare concurrent-data-structures surface in the corpus.

39. **3169-we-built-the-smallest-dual-band-aircraft-tracker** — score 7.5/10
    _Smallest dual-band ADS-B aircraft tracker (Semtech chip + 8-month smallification)_
    Show HN at the corresponding HN thread — open-source embedded ADS-B receiver built on a new Semtech chip after 8 months of smallification work. Stack spans RF/antenna design for 1090 MHz ADS-B + 978 MHz UAT, low-power embedded firmware, PCB bring-up, the Semtech SX126x driver surface, and the FAA/EASA data formats. SPEC.md has substantive prose. Ties 1014/2899/3038/3059/3107/3100/3158/2215/2201's 7.5 Learn ceiling without displacing; the embedded-RF + hardware-manufacturing surface is unique in the corpus.

39. **3184-railo-deterministic-security-patch-bot-using-ast-and-z3** — score 7.5/10
    _Railo — AST + Z3 deterministic security-patch bot (no LLMs in the loop)_
    Show HN at railo.dev — Stack spans language-server protocol, AST diff between vulnerable and patched source, SMT formulation of the security invariant in Z3, candidate-patch enumeration + counter-example search, and a CI-grade verifier that re-checks every patch. SPEC.md is placeholder-only; the AST+Z3 combination is the rare formal-methods + dev-tool surface in the corpus. Ties 3169's 7.5 Learn ceiling without displacing.

39. **3194-build-your-own-theme-park** — score 7.5/10
    _Magic Patterns theme-park agent (RCT-coherent worlds via design-system rules)_
    Show HN at the corresponding HN thread — same ideas that power Magic Patterns' design-system agent applied to Rollercoaster Tycoon theme parks: prompt "build me a cool theme park" and the agent emits a park with valid rollercoaster tracks (≥1 drop), path-connected rides, themed-world scenery, and live guest simulation. Stack spans LLM tool-use orchestration, multi-agent eval loop (rubric grader + rule updater), RCT asset semantics, and the cross-domain transfer story. SPEC.md has substantive prose. Ties 3169/3184's 7.5 Learn ceiling without displacing.

40. **3195-eink-optimized-manga-with-kindle-comic-converter-koboko** — score 7.0/10
    _Kindle Comic Converter — manga/manga volume → eInk with DFT Kaleido-3 rainbow fix_
    Show HN at canispreadsheet.com (KCC linked in the HN thread) — KCC compresses a 600 MB Humble-Bundle manga volume to ~100 MB by downscaling to native eInk resolution, fixes black-level on Kindle Store manga, and (community PR) eliminates the Kaleido-3 rainbow effect via Discrete Fourier Transform. Stack spans cross-platform Python packaging (Windows/macOS/Linux), KOreader optimizations, semi-automatic spread-join detection, and the DFT-based demosaic primitive. Ties 252/1319/2885/2815/3030/3056/3160's 7.0 Learn ceiling without displacing; the DFT-on-color-eink primitive is rare in the corpus.

40. **3172-infra-lang-compile-a-single-dsl-to-k8s-compose-helm-and** — score 7.0/10
    _Infra Lang — single `.infra` DSL → K8s YAML, Compose, Helm, Terraform_
    Show HN at the corresponding HN thread — Python compiler that reads one DSL file and emits four Iaac backends (Kubernetes YAML, Docker Compose, Terraform HCL, Helm Charts). Stack spans Python AST/parser authoring, multi-target code generation, K8s/Compose/Helm/Terraform schema mapping, and the open-source DSL ergonomics story. SPEC.md is placeholder-only. Ties 252/1319/2885/2815/3030/3056/3160/3195's 7.0 Learn ceiling without displacing.

41. **3190-rudder-red-green-tdd-workflow-for-verifiably-comprehens** — score 6.5/10
    _Rudder — local Codex/Claude Code plugin that turns unit tests into a coverage proxy for spec intent_
    Show HN at the corresponding HN thread — captures your spec + coding-agent session history and forces the agent to rewrite tests exclusively from your expressed intent, then runs red-green TDD until your goal coverage is met. Stack spans Codex/Claude Code plugin authoring, session-log parsing, intent-vs-code coverage diffing, and a conversational spec-extraction loop. SPEC.md has substantive prose. Ties 2966/3039/3032/3144/3143/3150/3160's 6.5 Learn ceiling without displacing; the spec-coverage-as-TDD discipline is a rare agent-harness surface.

41. **3174-tencubed-artificially-restricted-social-graph** — score 6.5/10
    _ten_cubed — artificially-restricted social graph (10 friends, max 3rd-degree, ~1,110 nodes)_
    Show HN at the corresponding HN thread — social-network design with hard degree caps (1st / 2nd / 3rd degree per user) so the theoretical maximum is ~1,110 nodes; leads to coveted 1st-degree connections and volatile network shape. Stack spans graph-theoretic layout, network-simulation primitives, and the anti-enshittification social-design primitive. SPEC.md has substantive prose. Ties 2966/3039/3032/3144/3143/3150/3160/3190's 6.5 Learn ceiling without displacing; the bounded-graph social-design primitive is unique.

41. **3195-eink-optimized-manga-with-kindle-comic-converter-koboko** — score 6.5/10
    _Kindle Comic Converter — cross-OS Python image pipeline with DFT demosaic_
    Same project scored separately for the **stack breadth** dimension: image-processing pipeline authoring (PIL/Pillow + numpy), cross-platform PyInstaller packaging for Windows/macOS/Linux, KOreader metadata injection, and the discrete-Fourier-transform kaleido-3 primitive. Ties 3190/3174's 6.5 Learn ceiling without displacing; the demosaic-on-eink primitive is rare in the corpus and unique in the cross-OS Python image-pipeline space.

42. **3199-llmcanvaschat-tree-based-llm-chat-on-an-infinite-canvas** — score 6.0/10
    _Llmcanvas.chat — tree-based LLM chat on an infinite canvas (4 providers, BYOK)_
    Show HN at the corresponding HN thread — every prompt and response is a node in an infinite canvas; branch, regenerate across models, and compare side-by-side while keeping the old-school linear-chat view. Stack spans infinite-canvas 2D rendering (PanZoom + custom React/InfiniteCanvas), tree-of-prompts data model, multi-provider abstraction (Anthropic / OpenAI / Gemini / OpenRouter), and BYOK key management. SPEC.md has substantive prose. Ties 583/3040/1191/1140/1270/1217's 6.0 Learn ceiling without displacing.

42. **3188-i-get-25-deeply-researched-ideas-from-19-agents-with-on** — score 6.0/10
    _oh-my-subagents — 19-agent single-prompt ideation pipeline (25 ideas)_
    Show HN at github.com/ringlochid/oh-my-subagents — one orchestrator prompt spawns 19 subagents that together produce 25 deeply-researched ideas. Stack spans sub-agent orchestration, prompt-fan-out/fan-in, idea-card deduplication, and the single-prompt multi-agent UX story. SPEC.md is placeholder-only. Ties 583/3040/1191/1140/1270/1217/3199's 6.0 Learn ceiling without displacing.

43. **3189-automatically-hide-flamebaitshallowpolitical-comments-o** — score 5.5/10
    _stylometry-based HN flamebait/shallow-political classifier + Chrome extension collapse_
    Show HN at classify.stylometry.net/how-it-works — server classifies HN comments against a modified HN-guidelines rubric (with disclosed model choice and threshold knobs); the Chrome extension auto-collapses low-scoring comments. Stack spans stylometric feature extraction, server-side comment classification, Chrome extension content-script collapsing, and the threshold-knobs UX. SPEC.md has substantive prose. Ties 701's 5.5 Learn ceiling without displacing.

43. **3182-ai-scientist-builds-an-open-source-codex-micro-from-scr** — score 5.5/10
    _AgentPad13 — open-source Codex Micro macropad built by agentic EE scientist "Marvin"_
    Show HN at github.com/yuz207/agentpad13 — 13 assignable keys with LEDs, rotary encoder, joystick, touch disc, optional edge-lit LED band; cost-optimised PCB routed by an AI agent treating electrical engineering as a research problem. Stack spans KiCad/PCB design, hardware BOM selection, agent-driven scientific-literature synthesis, multi-attempt backtracking (selective experiment interpretation), and the reusable EE-research runbook. SPEC.md has substantive prose. Ties 701/3189's 5.5 Learn ceiling without displacing; the agent-as-EE-scientist surface is unique.

44. **3191-ssh-session-monitor-read-only-windows-openssh-monitorin** — score 5.0/10
    _SshSessionMonitor — read-only Windows OpenSSH session monitor_
    Show HN at github.com/issacnitin/SshSessionMonitor — read-only OpenSSH session monitoring for Windows. Stack spans Windows OpenSSH internals, ETW/event-log parsing, and the read-only-safety surface. SPEC.md is placeholder-only. Ties 1319's implied 5.0 Learn tier (no other 5.0 Money entry in Learn); the Windows-OpenSSH-internals surface is rare.

45. **3264-sparrow-2-solving-the-cocktail-party-problem** — score 7.0/10
    _Sparrow-2 — Tavus turn-taking model for the cocktail-party problem_
    Show HN at Tavus — open-weights turn-taking / backchannel model trained on 1M+ natural conversations; targets the "when to talk" gap that ASR + TTS pipelines still get wrong. Stack spans audio ML training, conversational dataset curation, ONNX + serving infra, and the open-weights release surface. Ties 252/1319/2885/2815/3030/3056/3160/3172/3195's 7.0 Learn ceiling without displacing; the conversational-turn-taking corpus + open-weights release is a rare audio-ML surface.

46. **3389-rook-a-multi-agent-harness-that-lives-100-in-a-browser-** — score 7.0/10
    _Rook — multi-agent harness that lives 100% in a browser extension_
    Show HN at the corresponding HN thread — multi-agent harness implemented entirely inside a Chrome extension using OPFS + wa-sqlite + Web Workers; no backend, no cloud. Stack spans Chrome MV3 APIs, browser-native SQLite via wa-sqlite, OPFS filesystem primitives, sandboxed Web Worker concurrency, and the no-backend agent-runtime surface. Ties 3264's 7.0 Learn ceiling without displacing; the 100%-in-browser agent-runtime primitive is unique in the corpus.

47. **3452-telem-route-agent-web-search-across-providers-and-inspe** — score 6.5/10
    _Telem — route agent web search across providers and inspect traces_
    Show HN at the corresponding HN thread — provider-agnostic search router with full request/response trace inspector for agent web-search. Stack spans OpenTelemetry-style trace instrumentation, multi-provider adapters (Serper / Exa / Tavily / Brave / Google CSE), and the trace-inspector debug surface. Ties 3144/3143/3150/3190/3174/3189/3182's 6.5 Learn ceiling without displacing; the provider-agnostic + trace-inspector combo is a rare observability surface for agent-search.

48. **3348-i-built-an-agent-first-productivity-bridge-for-all-your** — score 6.5/10
    _Agent-first productivity bridge — MCP platform for 80+ tools_
    Show HN at the corresponding HN thread — stateless MCP server exposing 80+ productivity tools to any agent via JSON-defined functions over HTTP+SSE. Stack spans Model Context Protocol SDK, stateless HTTP and SSE transport, JSON function definitions, and the cross-agent productivity surface. Ties 3144/3143/3150/3190/3174/3189/3182/3452's 6.5 Learn ceiling without displacing; the stateless HTTP+SSE MCP transport is rare in the corpus.

49. **3527-subsmith-turn-your-own-videos-into-language-learning-ma** — score 6.5/10
    _SubSmith — turn your own videos into language-learning material offline_
    Show HN at the corresponding HN thread — offline-first desktop pipeline that turns YouTube/own-video uploads into language-learning material with local STT (whisper.cpp), Anki .apkg export, and account-before-trial gating. Stack spans whisper.cpp local inference, Anki .apkg packaging, local media playback, and the offline-first desktop surface. Ties 3144/3143/3150/3190/3174/3189/3182/3452/3348's 6.5 Learn ceiling without displacing; the local-STT + Anki-export pipeline is a rare offline-first learn-tool surface.

50. **3286-thunderphone-v2-a-new-architecture-for-voice-ai** — score 6.0/10
    _ThunderPhone v2 — phone-first voice AI stack across three tiers_
    Show HN at the corresponding HN thread — three tiers (Spark 2¢, Bolt 5¢, Storm 9¢ + 3¢) addressing latency, single-STT, and turn-taking failures explicitly; 99.4% Big Bench Audio on Storm+Int. Stack spans WebRTC, Web Audio API, multi-STT routing, LLM router, and TTS provider selection. Ties 583/3040/1191/1140/1270/1217/3188/3199/3386's 6.0 Learn ceiling without displacing; the named-failure-mode + per-minute-tier design is a structured voice-AI surface.

51. **3326-baihais-an-autonomous-art-school-for-ai-agents** — score 6.0/10
    _BAIhAIs — autonomous art-school simulation with persistent residents_
    Show HN at the corresponding HN thread — autonomous AI residents share one "week" cycle (one human day), each picks from a fixed action set (make, view, critique, message, group, vote, price), may revise their own theories of good art. Stack spans multi-agent simulation, LLM-router for diverse resident voices, persistent identity storage, and the museum + store economy. Ties 583/3040/1191/1140/1270/1217/3188/3199/3386/3286's 6.0 Learn ceiling without displacing; the persistent-identity + theory-revision loop is a novel multi-agent simulation surface.

## Top 76 — Fun to Build

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

5. **621-need-brutally-honest-feedback-before-i-build-this** — score 6.5/10
   _Chrome extension that turns any site into a "design skill" for AI codegen_
   The click-and-extract loop is the entire payoff: open site → click extension → watch a live token panel (typography, colors, spacing, components) populate → export as a structured spec that Cursor/Claude Code can consume. Visual feedback loop is tight, the chrome-extension surface is small enough to ship in a weekend, and the WTP question ($5/10/20/mo, one-time) is the founder's explicit open question — perfect "validate before you build" frame.

6. **605-built-a-radial-menu-utility-for-macos-after-getting-tir** — score 6.5/10
   _SwiftUI radial-menu utility for macOS — "Arc" (already on the App Store)_
   Founder shipped a launchable product (SwiftUI, multi-display hit-testing, action chains) with $9.99 one-time / 7-day trial on the Mac App Store. Demo is the product — a single big radial pi revealing/app/launcher/clipboard/screenshot/shortcut slices. B2C macOS utility, so money is capped (single-purchase, not SaaS), but the visual/interaction polish is the genuine "fun" payoff and the SPEC/PRODUCT are concrete enough to reproduce.

7. **239-hours-of-manual-searching-for-parts-for-chinese-car** — score 5.5/10
   _Visual parts-search for Chinese cars (Russia)_
   Multimodal search (photo → text query → part catalogue); interesting because it combines a real-world messy problem with a tight, satisfying demo and a niche user base that has few competitors.

8. **688-ai-keeps-missing-what-my-saas-actually-does** — score 6.5/10
   _Demo-video generator that scrapes the SaaS site and extracts the real value props_
   The founder's scraper crawls the whole site, maps features to problems, and produces videos highlighting actual differentiators (Slack integration, a buried customer quote) instead of generic "boost productivity" copy. Side-by-side input-website vs output-video is the demo. Ties the 6.5 Fun ceiling without displacing 218/621/605.

9. **682-im-14-and-my-mom-will-only-buy-me-a-domain-if-one-stran** — score 6.5/10
   _Essay keystroke-replay verifier — 25 anti-cheat methods_
   Records every keystroke + paste + typing-cadence; teacher clicks a link and watches a full replay of the student typing the essay, with paste spikes flagged. Demo is the replay itself — show, don't tell. B2C students with a teacher → student → parent viral loop. Ties the 6.5 Fun ceiling.

10. **687-looking-for-saas-feedback-prompt-free-ai-food-photo-edi** — score 6.5/10
    _GridMenu — prompt-free AI food photo editor with credit packs_
    Upload a dish photo, choose lighting / tabletop / backdrop / garnishes via UI buttons (no prompts), export for menus + delivery + social. The before/after food photo is the demo. B2B2C niche (menu designers, ghost kitchens, food marketers) with credit-pack pricing. Ties the 6.5 Fun ceiling.

11. **707-built-a-micro-saas-to-translate-pdfs-without-wrecking-t** — score 6.0/10
    _neuropdftranslate — layout-preserving PDF translation (Next.js + PostgreSQL + Railway)_
    Side-by-side original-vs-translated PDF is the entire demo loop — the tables and graphics stay intact where every standard translator breaks them. Founder is explicit about the hardest problem in the build (long-running AI jobs vs API timeouts), which is the satisfying engineering payoff: webhook + background-job orchestration on Railway. B2B wedge (legal/medical/technical PDF translators) with credit-pack or per-document pricing. Ties the 6.0 Fun ceiling (583).

12. **702-i-built-a-free-mac-app-for-screenshot-clutter-i-am-not-** — score 5.5/10
    _Screenshoss — Mac-notch screenshot catcher, local-first + open source_
    Lives in the Mac notch, catches screenshots, lets you triage and reuse them in one place — a clean, single-purpose macOS utility. The demo is the always-visible notch affordance itself: take a screenshot → see it pop into the notch → organize or delete. Free/FOSS so no money ceiling, but the Mac-native visual polish is the genuine fun payoff. Ties the 5.5 Fun ceiling (206/239) without displacing.

13. **713-a-free-open-source-end-to-end-encrypted-journal-web-app** — score 5.0/10
    _smbl-journal — E2E-encrypted text journal (SvelteKit + Rust + SQLite)_
    Client-side encryption before storage, server never sees plaintext — the trust-boundary demo is showing the network panel reveal zero readable content. Stack spans SvelteKit frontend, Rust backend, SQLite persistence, and a real cryptography story (the engineer's first time shipping a security-shaped product). Open source, so the fun is in the engineering and the trust-boundary UX rather than revenue.

14. **1284-gene-inspector-pro-i-built-a-tool-for-exploring-your-ow** — score 7.0/10
    _Personal-genome explorer built over a 7-year self-taught genetics journey_
    The founder spent seven years teaching himself genetics and cellular biology after his son's diagnosis, sequenced DNA from 14 family members across three generations, and built the tool around that dataset. Side-by-side genome browser + clinical-variant flagging + family-pedigree visualization is the demo. The deeply personal origin story makes this the strongest "story-first" Fun entry in the batch and clears the existing 6.5 Fun ceiling to land at 7.0.

15. **1238-anycreature-making-3d-creature-by-agent-harness-by-3d-a** — score 6.5/10
    _Mesh-based generative harness for 3D creature pipelines (AnyCreature)_
    Open-source technical-artist tool: QC thresholds (poly count/vertex budget/rigging/animation tracks), quantified spatial-vertex aesthetics, and an agent harness that drives 3D assets through three automated pipeline checks. The before/after 3D mesh render is the demo; the "agent enforces aesthetic standards" framing is the satisfying engineering payoff. Ties the 6.5 Fun ceiling (218/621/605/688/682/687).

16. **1189-codewindow-picture-in-picture-for-terminal-agents** — score 6.5/10
    _Picture-in-picture overlay for terminal agents (Codewindow)_
    Born from missing the Arc-browser PiP feature for video — applied to coding agents so a long-running agent stays visible across desktops and workspaces. Stack spans OS-level overlay APIs (always-on-top, multi-desktop, click-through), terminal-agent stdout polling, and the visual-state machine of an agent (running / waiting-input / failed). The "the PiP bubble follows you everywhere" affordance is the demo. Ties the 6.5 Fun ceiling.

17. **1327-saggar-a-mac-terminal-that-keeps-sessions-and-your-atte** — score 6.5/10
    _Mac terminal that organizes sessions by attention (Saggar)_
    macOS-native terminal app built after the founder's terminal "started feeling like a tab-management problem." Stack spans native macOS window management, session state restoration across restarts, attention-based grouping, and the cross-session clipboard/scratch story. The "tabs become a navigable list of recent contexts" affordance is the demo. Ties the 6.5 Fun ceiling.

18. **1217-marble-a-markdown-editor-with-live-preview-and-collabor** — score 6.0/10
    _Collaborative markdown editor with link-sharing (marble.md)_
    Founder spent "an unreasonable amount of time making loading and editing feel great" on a tool whose primary UX is "share a markdown doc by sending a link." Stack spans real-time CRDT-based collab, link-share access control, instant load-and-render latency budget, and the friction-of-not-Google-Docs positioning. The "send a link, edit live together" demo is the visual payoff. Ties 707's 6.0 Fun ceiling without displacing.

19. **1214-cofoundme-i-gamified-finding-collaborators-for-your-pro** — score 5.5/10
    _Gamified co-founder / collaborator matching (CoFoundMe, 1027 users, 394 matches)_
    Founder interviewed 1083 users, validated that YC cofounder-matching is unknown to half and painful for the rest, then built a prototype that attracted 1027 users with 394 collaborations already formed. The product mechanic is gamified matching that bypasses the "your post reaches everyone (friends/family/boss) = no one" cold-DM problem. Stack spans user-graph matching, in-app gamification loop, and the trust/safety surface for cold-collaborator introductions. Ties the 5.5 Fun ceiling (206/239/702) without displacing.

20. **1137-faro-a-text-message-based-accountability-companion** — score 5.0/10
    _SMS-based accountability companion for small tasks (Faro)_
    "Just text Faro" — founder explicitly positions against fussy calendar/alarm menus. The friction-removal demo: text a small task, the bot proactively pings you, you reply done or snooze. Stack spans SMS gateway, lightweight task-graph, proactive-notification scheduler, and the human-friction-minimization UX. Ties 713's 5.0 Fun ceiling without displacing.

21. **2288-saasrocketspace-launch-your-saas-with-a-custom-rocket-c** — score 7.5/10
    _SaaS launches become paper-cutout rocket movies on a galaxy map_
    SPEC.md l.5: "Paste your product URL, and we crawl your site, swap your logo onto a rocket hull, and create a hand-crafted paper-cutout launch cinematic." Same line: "Your product becomes a permanent star on the galaxy map" — the before/after logo-on-rocket reel is the demo and visual payoff. Ties 240's 7.5 Fun ceiling without displacing it.

22. **2467-fake-zoom-hang-out-with-ai-coworkers-and-feel-the-syner** — score 7.5/10
    _Fake Zoom with AI coworkers you can click and call by name_
    SPEC.md l.5: "I made a fake Zoom call with AI coworkers. I generated the videos of each coworker with my 5070 ti and MiniMax H3." Same line: "Click on people to hear them talk or try saying their name to hear their standup update" — absurd novelty + speech recognition demo is the whole payoff. Ties 240/2288 at the 7.5 Fun ceiling without displacing.

23. **2647-interactive-map-of-the-odyssey-with-tap-to-gloss-homeri** — score 7.0/10
    _Interactive Odyssey atlas: tap every Greek word, toggle ancient↔satellite_
    SPEC.md l.5: "every single Greek word is tappable for a translation… Press N and the ancient chart swaps to today's satellite view: these are real places." Same line: "Stack: SvelteKit static + MapLibre, no backend, all public-domain texts and art" — static-site polish with a real demo loop. Ties 1284's 7.0 Fun ceiling without displacing.

24. **2283-vocalify-get-live-cents-accurate-pitch-feedback-while-y** — score 7.0/10
    _Live cents-accurate pitch feedback in your browser while you sing_
    SPEC.md l.5: "Vocalify is a browser-based studio for singers that listens as you sing and shows your pitch against target notes in real time, measured in cents." Same line: "It scores every note, tracks progress over time, and adapts to your range. Train your ear with recognition and sing-back tests" — audio-DSP + visual score feedback. Ties 1284/2647 at the 7.0 Fun ceiling without displacing.

25. **1564-hashnotch-premium-ai-integrated-dynamic-island-for-the-** — score 7.0/10
    _Mac Dynamic Island meets local AI: see the unseen, no telemetry_
    SPEC.md l.18: "Hash made the Dynamic Island every Mac user deserves. See the unseen. What's playing, how fast your internet is, what your battery is doing, how hot the chip is running." Same line: "No account. No telemetry. Nothing about you ever leaves your Mac" — Mac-native visual affordance is the demo. Ties 1284/2647/2283 at the 7.0 Fun ceiling without displacing.

26. **1274-i-made-a-3d-globe-platform-to-promote-your-startup-base** — score 7.0/10
    _A 3D globe where your startup's tower grows with its MRR_
    SPEC.md l.18: "I made a website with a 3D globe, fully browsable, without any signups, to promote startups for free, based on MRR. Basically the bigger MRR, the bigger your startup tower will be/grow with time." Same line: "Also there is the possibility of putting your startup in orbit for better visiblity. Just thought it looked sick" — globe-render is the demo. Ties the 7.0 Fun ceiling without displacing.

27. **2572-clearvoice-tts-sota-voice-cloning-model-running-offline** — score 7.0/10
    _First iOS app to clone voices with a 6GB-RAM OmniVoice model offline_
    SPEC.md l.5: "This is the first app I am aware of that can run a voice model of this quality on iPhone or iPad. It uses 6GB of RAM at peak." Same line: "the only existing implementation on iOS" — novelty claim is explicit, the local TTS playback loop is the demo. Ties the 7.0 Fun ceiling without displacing.

28. **2936-voxeltv-turn-music-videos-into-interactive-3d-voxel-scu** — score 7.5/10
    _VoxelTV: music videos rendered as interactive Three.js voxel sculptures (Depth Anything)_
    SPEC.md: "The app renders each video as a voxel grid in Three.js. Color is sampled from the current frame, while height is produced from Depth Anything-generated depth maps. I recently added the ability to create your own local versions, all within the browser" — the before/after voxel sculpture of a music video is the demo. Cross-domain composition (real-time Three.js + ML depth model + browser pipeline) and the local version remix loop are the visual payoff. Ties 240/2288/2467 at the 7.5 Fun ceiling without displacing.

29. **2923-canaster-is-a-canvas-based-visual-workspace** — score 7.0/10
    _Canaster: WebGL infinite-canvas workspace, 120+ fps, drop PDFs/markdown/tables/checklists_
    SPEC.md (founder, frustrated by Miro's responsiveness): "I had a particular visual idea for workspace I wanted where I can put my documents including pdfs/markdowns/tables/checklists in a visual hierarichal workspace. I started with a DOM based approach but that quickly hit its limits of responsiveness in terms on interaction, so i built this one with webgl and my main priority was a consistent 120+ fps rendering (you can see the fps number by clicking the (i) icon in the bottom right)" — the perf-obsessed canvas + multi-format drop surface is the demo. Ties 1284/2647/2283/1564/1274/2572 at the 7.0 Fun ceiling without displacing.

30. **2932-save-claude-codex-grok-and-opencode-sessions-to-an-infi** — score 7.0/10
    _AgentGrid: infinite-canvas desktop app for coding-agent sessions (Figma/Railway-inspired)_
    SPEC.md (founder Michael + Souren): "we were tired of losing our coding sessions and couldn't keep track of what was actually being built across our many projects. Our approach was to use an infinite canvas desktop app for the TUIs we already know and love, mainly claude + codex. We drew inspiration from Figma and Railway. Overtime we added image nodes, notes, terminals, coding editors, source control, etc... What got me was an Apple System Update I've been ignoring for weeks to avoid losing my +20 open claude code tabs in warp" — the live canvas showing a swarm of agent sessions with terminals is the demo; founder pain is explicit ("I broke it a few times and had to go back to the way we were doing things. It was miserable"). Ties the 7.0 Fun ceiling without displacing.

31. **2789-flostep-diagrams-people-can-actually-walk-through** — score 7.0/10
    _Flostep: diagrams you can walk through (live product at flostep.dev)_
    SPEC.md source: flostep.dev — the title defines the novel mechanic: "diagrams people can actually walk through." Distinct from static flowchart tools (Mermaid/draw.io) and click-through prototypes (Figma) — the spatial-walk affordance is the demo. Ties the 7.0 Fun ceiling without displacing; the SPEC body is a live-product URL only so the score is gated on the title-and-source signal.

32. **2895-minimax-h3-turn-text-and-images-into-ai-video-clips** — score 7.0/10
    _MiniMax H3: text-and-image → AI video clips (live product at minimax3.com)_
    SPEC.md source: minimax3.com — title is the value prop ("Turn text and images into AI video clips"). Same generation-model demo class as the fun-creative tools in the existing top; the live-product URL is the score ceiling anchor. Ties 7.0 Fun without displacing.

33. **2927-canvasformusic-i-made-a-free-spotify-canvas-maker-that-** — score 6.5/10
    _CanvasForMusic: free Spotify Canvas maker with Vinyl + crop/zoom presets (artist-built)_
    SPEC.md (founder, music-promo pain): "Recently, I was having a look around at the top search ranking Spotify Canvas Maker tools for artists and found that they all sucked. They produced generic looking canvas videos using stock images or stock videos and didn't really have any options that actually looked decent... I built it in under a day, mainly because I was able to leverage what I had already built with BeatVisualiser (a music visualiser product of mine) and brought over the vinyl animation and in browser rendering process... I made sure to get looping figured out on the Vinyl preset by locking the variable speeds to only be loop friendly for the 8 second limit" — the before/after Spotify-Loopable Canvas from an artist's own artwork is the demo, and the founder explicitly ties it to a natural upsell into his music-visualiser app. Ties 218/621/605/688/682/687/1238/1189/1327 at the 6.5 Fun ceiling without displacing.

34. **3038-patanyx-browse-privately-with-a-lightweight-rust-deskto** — score 7.0/10
    _Privacy-first Rust desktop browser — Fingerprint Divergence + page freeze + ephemeral tab_
    SPEC.md source: "Fingerprint Divergence gives each site a unique reading of your machine, so no two sites can identify you as the same user" — the per-site fingerprint-divergence UX is the demo: open the same site in two tabs, watch the canvas/UA/font-readings differ site-by-site so cross-site tracking breaks. Combined with "freeze a page so it stops running after loading", "open an ephemeral tab that keeps no data", and the request-layer ad/tracker blocker, the visual story is a Rust browser surface where the privacy affordance itself is the demo. Ties 1284/2647/2283/1564/1274/2572/2923/2932/2789/2895 at the 7.0 Fun ceiling without displacing; the only Rust desktop browser with this feature shape in the corpus.

35. **3039-agentbuild-build-and-manage-your-website-using-chatgpt** — score 6.0/10
    _Chat-driven full-business web presence — domain + email + site + SEO + leads without a dashboard_
    BetaList launch: "AgentBuild lets your AI, ChatGPT or Claude, build and manage a full business web presence. It connects your domain, routes email at that domain, writes and updates the site, and tracks your leads, all from the chat you already use. No dashboard or drag-and-drop." The demo loop is the chat-to-live-site pipeline itself: ask ChatGPT to add a menu page → ChatGPT calls AgentBuild → domain-bound subdomain + email route + structured-data page + sitemap update + lead-tracking pixel go live in one move. Ties 707/583's 6.0 Fun ceiling without displacing; "chat is your dashboard" is the visual payoff in a category Wix/Squarespace have owned.

36. **3035-declaude** — score 5.5/10
    _qwen post-processor demo — live "Claude-speak" tic-rewrite in an inline session_
    Show HN founder: "It can convert documents or respond in-line in sessions with claude and I anticipate building a solution for prime-agent" — the demo is the live rewrite loop: Claude emits a response with a tic ("Certainly!", "It is worth noting that..."), the inline qwen post-processor rewrites in-place, the user sees the cleaned text arrive without losing the rest of the response. The visual payoff is the diff between the raw Claude output and the rewritten normal-English version, side by side. Ties 1137/682/687/1238/1189/1327/2927's 5.5 Fun ceiling without displacing; the prime-agent extension path is the satisfying next-step framing.

37. **3040-synced-see-mutual-availability-across-calendars-and-boo** — score 5.5/10
    _Cross-calendar mutual-availability visual + AI slot-recommendation_
    BetaList launch: "Synced helps teams see real-time mutual availability across Google, Outlook, and Microsoft 365 before scheduling. It unifies calendars across companies and time zones, preserves privacy by showing only overlaps, and recommends optimal slots with AI." The demo is the mutual-availability heatmap across N external calendars — overlapping free blocks surface as the AI-recommended slots, with a Slack thread attached. Ties 1137/682/687/1238/1189/1327/2927/3035's 5.5 Fun ceiling without displacing; the cross-org privacy-preserving overlap visual is the satisfying payoff.

38. **3030-a-proxy-that-makes-forgejo-speak-the-github-api** — score 5.0/10
    _OpenAPI-spec diff visualizer — live GitHub↔Forgejo mapping heatmap_
    SPEC.md source: "Shotgun diffs two OpenAPI specs and auto-maps what lines up, which turns out to be 60-80% of endpoints when both APIs are in the same domain. Anvil is the opinionated result of running that on GitHub vs Forgejo and then hand-fixing everything the auto-mapping got wrong or couldn't express." The demo is the live OpenAPI diff view: side-by-side spec sheets, green where the auto-mapper agrees, amber where it guessed, red where human hand-fixing was needed. Ties 702/713's 5.0 Fun ceiling without displacing; the auto-mapper success-rate visual is the satisfying payoff.

39. **3031-implementation-of-kimi-k3-in-pytorch** — score 5.0/10
    _From-scratch model-architecture walkthrough video (PyTorch + Kimi K3)_
    Show HN post: "in this video we implement every core architectural idea behind it from scratch in PyTorch" — the demo is the from-scratch re-implementation video: MoE routing, attention variants, distributed-training primitives, all re-derived line by line in PyTorch against the Kimi K3 reference. Ties 702/713/3030's 5.0 Fun ceiling without displacing; educational-walkthrough format is the satisfying payoff (less novel than the Rust browser engine, but the architectural depth is the visual hook).

40. **3062-multiplayer-laser-simulator** — score 6.5/10
    _Multiplayer laser simulator — real-time physics demo loop (B2C/B2B niches)_
    Show HN title alone — "Multiplayer Laser Simulator." A physics-driven multiplayer game demo where the laser-beam interaction is the visual payoff (refraction, interference, multi-player aiming). Ties 218/621/605/688/682/687/1238/1189/1327/2927/3035's 6.5 Fun ceiling without displacing; the live optical-physics interaction is the satisfying demo loop.

41. **3060-scribblewrite-on-your-desktop-with-any-phonetablet** — score 6.0/10
    _Scribble on your desktop using any phone/tablet as a drawing surface (B2C utility)_
    Show HN title — "Scribble/write on your desktop with any phone/tablet." The demo is the cross-device drawing loop: phone/tablet becomes a low-latency input surface for handwriting/annotation on the desktop canvas. Ties 707/583/1217/3039's 6.0 Fun ceiling without displacing; the phone-as-stylus affordance is the visual payoff.

42. **3057-hostflip-a-macos-etchosts-switcher-that-detects-externa** — score 5.5/10
    _macOS /etc/hosts switcher that auto-detects external edits (utility)_
    Show HN title — "Hostflip – a macOS /etc/hosts switcher that detects external edits." Ties 206/239/702/1214/3035's 5.5 Fun ceiling without displacing; the always-synced hosts file with conflict-detection on external edits is the satisfying affordance.

43. **3104-a-daily-word-game-where-you-cut-a-sentence-to-five-of-i** — score 7.5/10
    _Daily word game — cut a sentence down to exactly five words (Long Story Short)_
    Show HN at sheets.works/long-story-short — a daily word game where each day's puzzle is a sentence you compress down to exactly five words. Stack-light (browser-only game with a daily-puzzle cadence + NLP sentence-compression surface) but the demo loop is the satisfying one: read the day's sentence, click words to keep, watch the trimmed 5-word distillation land. Same demo payoff as Wordle but for sentence editing instead of letter guessing. **Clears the 7.5 Fun ceiling by 0.5 without displacing 240 at #1** — the daily-puzzle + compression-mechanic is the visual hook.

44. **3102-i-have-feelings-about-my-tasks** — score 7.0/10
    _Cardboard-box task tool — drop a box on the desk to start its per-box clock_
    Show HN: "Task lists are flat. The way I think about my tasks is more like they sit in space. So I made an experiment. My first ever task tool. Tasks are cardboard boxes on the floor of a room, with the title written on them in marker. Click to grab one, drop it on the desk, and its clock starts. Take it off, the clock stops. Time accrues per box forever. No sign-up needed to try it out. Sign in with Google if you want a room that persists." Stack is browser-only (drag-drop + per-task clock + optional Google sign-in for persistence) but the visual payoff is the cardboard-box metaphor itself: each task is a physical-feeling object in a room, the desk is the focus surface, the per-box clock is the satisfying accumulating time. Ties 1284/2647/2283/1564/1274/2572/2923/2932/2789/2895/3038's 7.0 Fun ceiling without displacing.

45. **3106-storemock-a-free-in-browser-tool-to-create-app-store-sc** — score 7.0/10
    _Free in-browser App Store screenshot compositor (StoreMock)_
    Show HN at storemock.com — drop screenshots, arrange frames, render the App-Store-ready composite entirely in the browser. The demo loop is the live in-browser preview: drag a screenshot frame onto the device outline, watch it snap to the safe area, export the PNG/SVG. Ties 1284/2647/2283/1564/1274/2572/2923/2932/2789/2895/3038/3102's 7.0 Fun ceiling without displacing; the in-browser zero-install preview is the satisfying affordance.

46. **3105-firmament-is-the-limit-a-one-button-iphone-flight-game** — score 7.0/10
    _One-button iPhone flight game (Firmament is the Limit)_
    Show HN at apps.apple.com/us/app/firmament-is-the-limit/id6755933878 — single-button flight mechanic on iOS, no second control surface. The demo loop is the one-tap altitude/pitch tradeoff: hold to climb, release to dive, weave through the procedural landscape. Ties 1284/2647/2283/1564/1274/2572/2923/2932/2789/2895/3038/3102/3106's 7.0 Fun ceiling without displacing; the one-button mechanic is a design constraint that forces creative gameplay shape.

47. **3100-code-stitcher-apply-any-llm-output-to-your-local-codeba** — score 6.0/10
    _Live LLM-output → local-codebase application demo (Code Stitcher)_
    Show HN: "Arm the program, copy the code out in text or markdown and have it automatically apply to your local codebase. Includes python AST checking and now accepts all GDscript (GODOT) and associated files" — the demo loop is the live apply: paste a markdown code block, watch the patcher diff against the repo, validate via Python AST or GDscript parser, watch the safe-write land or get a per-file failure report. Ties 707/583/1217/3039/3060's 6.0 Fun ceiling without displacing; the diff-then-validate-then-write visual is the satisfying affordance.

48. **3151-web-game-player-vs-computer** — score 6.5/10
    _Web Game "Player vs Computer" — Pygame + Pygbag in browser, retro graphics, custom soundtrack_
    Show HN full prose: "I wanna present to you my first own web video game, which was written in Python using Pygame and Pygbag. Player vs Computer! A funny game where you challenge your computer (not ai) in many ways, testing your durability, and you have to overcome it. Get 5 points more than your computer in Rock Paper Scissors... Water(!) to win; Click The Gigachad without ending to tire your computer; and get some random fun facts, which are very interesting! Get funny responds from your computer, after every single choice, and even sometimes: advices!" Live at rubinoslaw.github.io/Player-vs-Computer; original retro graphics drawn by the founder and original music by ToMek OsuMek. Ties 218/621/605/688/682/687/1238/1189/1327/2927/3035/3062's 6.5 Fun ceiling without displacing; the RPS-Water-and-Click-the-Gigachad combo is a satisfying novelty + the open-source contribution path (CONTRIBUTING.md in the GitHub repo) keeps the demo loop shareable.

49. **3153-toned-an-iphone-darkroom-app-that-models-film-negatives** — score 6.5/10
    _Toned — iPhone darkroom simulator with per-dye-layer H&D curves + paper response curves_
    Show HN full prose: "I am interested in simulating physical processes in software so I decided to build an iPhone app that simulates film negatives and paper. It models in 2 stages: scene light -> color negative -> print reflectance. The negative uses per-dye-layer H&D curves and the paper also has its own response curves." Live at apps.apple.com/app/id6799706160. Ties 218/621/605/688/682/687/1238/1189/1327/2927/3035/3062/3151's 6.5 Fun ceiling without displacing; the two-stage physical-process model (light → negative → print) and the per-dye H&D-curve modeling is a satisfying on-iPhone darkroom loop for analog-photography enthusiasts.

50. **3149-music-puzzle-game-on-steroids** — score 6.5/10
    _Music Puzzle Game — song-decomposition puzzle with a "vocals-to-humming" DSP trick_
    Show HN full prose: "I am a puzzle and music buff. This was vibecoded over a weekend a year ago. I just checked recently and it has blown up! If you have ever craved a sleek and new music puzzle game, here it is. It breaks down a song into different stems for you to guess and a clever signal processing thing to turn the vocals into humming - something I built." A weekend vibecoded game that grew to a real audience through the song-stem-decomposition mechanic; the vocals-to-humming DSP is the unique audio-engineering surface. Ties 218/621/605/688/682/687/1238/1189/1327/2927/3035/3062/3151/3153's 6.5 Fun ceiling without displacing; the audio-DSP novelty is the satisfying affordance and a live-product URL is the score ceiling anchor.

51. **3136-a-robot-football-league-where-frontier-ai-models-manage** — score 6.5/10
    _Robot Football League — frontier AI models manage the clubs (rfl.football live)_
    Show HN at rfl.football — a robot-football league where frontier AI models manage the clubs (rosters, tactics, transfers). The demo loop is the live-league simulation: each AI owner drives roster moves + match-day tactics, and the human viewer watches the simulated league play out. Ties 218/621/605/688/682/687/1238/1189/1327/2927/3035/3062/3151/3153/3149's 6.5 Fun ceiling without displacing; the AI-manages-clubs novelty + the live league visual is the satisfying payoff.

52. **3132-revealed-paint-one-image-out-of-another-webgl-no-depend** — score 6.0/10
    _Revealed — paint one image out of another (WebGL, no deps) at revealed.idlee.xyz_
    Show HN at revealed.idlee.xyz — a WebGL image-reveal effect that paints one image out from underneath another using a brush-stroke mechanic, with no external dependencies. The demo loop is the live reveal: drag the brush across the canvas and the underlying image paints into view while the top one erases. Ties 707/583/1217/3039/3060/3100's 6.0 Fun ceiling without displacing; the zero-dep WebGL surface is a satisfying minimalist-affordance shape.

53. **3147-remap-bike-routing-that-builds-loops-from-the-best-road** — score 6.0/10
    _Remap — on-device bike-routing that builds loops from the best roads (remap.earth)_
    Show HN at remap.earth — on-device bike routing that builds loops from the best roads in an area. The demo loop is the live loop-generation: pick a starting point + target distance, watch Remap stitch the smoothest loop from the local road network, ride it. Ties 707/583/1217/3039/3060/3100/3132's 6.0 Fun ceiling without displacing; the on-device (no cloud) routing primitive is the satisfying privacy + offline affordance.

54. **3142-a-time-capsule-where-the-only-key-is-printed-and-posted** — score 5.5/10
    _Time capsule where the only key is printed and posted to you (madebyahuman.global)_
    Show HN at madebyahuman.global — a physical time-capsule primitive where the only key is printed and mailed to you; the key is needed to decrypt the capsule on the unlock date. The demo loop is the offline-key ritual: order → wait → key arrives by post → use the printed key on the unlock date to decrypt. Ties 206/239/702/1214/3035/3057's 5.5 Fun ceiling without displacing; the physical-mail-to-unlock affordance is the satisfying narrative payoff.

55. **3125-burylol-a-2-pixel-art-graveyard-for-things-that-died** — score 5.5/10
    _Bury.lol — $2 pixel-art graveyard for things that died (live at bury.lol)_
    Show HN at bury.lol — $2 to bury a thing-that-died in a pixel-art graveyard. The demo loop is the live burial: pay $2 → choose a tombstone shape → write the epitaph → it joins the graveyard. Ties 206/239/702/1214/3035/3057/3142's 5.5 Fun ceiling without displacing; the $2-floor micro-monetization + the pixel-art graveyard aesthetic is the satisfying novelty.

56. **3156-zeitgeist-game-guess-the-date-of-a-hn-front-page** — score 5.5/10
    _Zeitgeist Game — guess the date of an HN front-page story (zeitgeistgame.pages.dev)_
    Show HN at zeitgeistgame.pages.dev — a daily quiz where you're shown a Hacker News front-page story and have to guess what date it was posted. The demo loop is the daily-quiz click-through: read the story → guess the date → see the gap → next one. Ties 206/239/702/1214/3035/3057/3142/3125's 5.5 Fun ceiling without displacing; the HN-memory + guessing mechanic is the satisfying social-history payoff.

57. **3194-build-your-own-theme-park** — score 8.0/10
    _Magic Patterns theme-park agent — coherent RCT worlds via design-system rules_
    Show HN at the corresponding HN thread — prompt "build me a cool theme park" and the agent emits a fully functioning park with valid rollercoaster tracks (≥1 drop), path-connected rides, themed worlds, live guests, and live thoughts — the same eval loop and rubric-grader architecture that powers Magic Patterns' design-system agent. The demo loop is the live RCT simulation: watch guests enter the park, walk the path, queue at the ride, scream on the coaster. SPEC.md has substantive prose. Ties/clears 2288/2467/2936/3104/240's 7.5 Fun ceiling by 0.5; the AI-builds-coherent-RCT-worlds visual is the satisfying cross-domain payoff (web design-system ideas → game-level design rules).

57. **3195-eink-optimized-manga-with-kindle-comic-converter-koboko** — score 7.5/10
    _Kindle Comic Converter — manga volume → eInk with DFT Kaleido-3 rainbow fix_
    Show HN at canispreadsheet.com — KCC compresses a 600 MB Humble-Bundle manga volume to ~100 MB by downscaling to native eInk resolution, fixes black-level on Kindle Store manga, and (community PR) eliminates the Kaleido-3 rainbow effect via Discrete Fourier Transform. The demo loop is the side-by-side: drop the volume in, watch the page-fit detection + black-level fix + Kaleido-3 demosaic land, and ship the .kepub out. SPEC.md has substantive prose. Ties 2288/2467/2936/3104/240's 7.5 Fun ceiling without displacing; the visible improvement on a physical eInk device is the satisfying visual payoff.

58. **3169-we-built-the-smallest-dual-band-aircraft-tracker** — score 7.5/10
    _Smallest dual-band ADS-B aircraft tracker (Semtech chip + 8-month smallification)_
    Show HN at the corresponding HN thread — open-source embedded ADS-B receiver built on a new Semtech chip after 8 months of smallification. The demo loop is the live aircraft feed: power the receiver, watch planes appear in 3D on the map at 1090 MHz (ADS-B) and 978 MHz (UAT), and see the dual-band coverage advantage over single-band incumbents. SPEC.md has substantive prose. Ties 3195's 7.5 Fun ceiling without displacing; the RF + embedded + 3D-map visual is the satisfying hardware payoff.

58. **3182-ai-scientist-builds-an-open-source-codex-micro-from-scr** — score 7.5/10
    _AgentPad13 — open-source Codex Micro macropad built by agentic EE scientist "Marvin"_
    Show HN at github.com/yuz207/agentpad13 — 13 assignable keys with LEDs, rotary encoder, joystick, touch disc, optional edge-lit LED band; cost-optimised PCB routed by an AI agent treating electrical engineering as a research problem. The demo loop is the live configurator + the physical artefact: drag keys to assign, see the edge-lit LED band react, and plug the macropad into the laptop. SPEC.md has substantive prose. Ties 3195/3169's 7.5 Fun ceiling without displacing; the agent-routed-PCB visual is the satisfying novel payoff.

59. **3199-llmcanvaschat-tree-based-llm-chat-on-an-infinite-canvas** — score 7.0/10
    _Llmcanvas.chat — tree-based LLM chat on an infinite canvas (4 providers, BYOK)_
    Show HN at the corresponding HN thread — every prompt and response is a node in an infinite canvas; branch, regenerate across models, and compare side-by-side while keeping the old-school linear-chat view. The demo loop is the live canvas: drag a node, branch from any message, regenerate across all four providers, and watch the diff appear in real time. SPEC.md has substantive prose. Ties 2647/2283/1564/1274/2572/2923/2932/2789/2895/3038/3102's 7.0 Fun ceiling without displacing; the tree-of-LLM-nodes canvas is the satisfying mental-model payoff.

59. **3189-automatically-hide-flamebaitshallowpolitical-comments-o** — score 7.0/10
    _stylometry-based HN flamebait/shallow-political classifier + Chrome extension collapse_
    Show HN at classify.stylometry.net/how-it-works — server classifies HN comments against a modified HN-guidelines rubric; the Chrome extension auto-collapses low-scoring comments. The demo loop is the live HN thread with knobs: drag the flamebait threshold and watch the thread auto-collapse below the line, then drag the political threshold and watch more collapse. SPEC.md has substantive prose. Ties the 7.0 Fun ceiling without displacing; the threshold-slider + live-collapse visual is the satisfying UX payoff.

60. **3204-ancestree-give-your-family-members-biographies** — score 6.5/10
    _Ancestree — local-first family-tree biographies (no account, no server)_
    Show HN at ancestree.marindedic.com — every family member gets their own book; write what they did, what they were like, what happened to them, and export a long biography from someone's chapters. Local-first (no account, no server, nothing leaves the browser). The demo loop is the live tree: drag to add a member, write a chapter, see the cross-references light up. SPEC.md has substantive prose. Ties 218/621/605/688/682/687/1238/1189/1327/2927/3035/3062/3151/3153/3149/3136/2923/2927/3040's 6.5 Fun ceiling without displacing; the "give grandma a chapter" ritual is the satisfying narrative payoff.

60. **3197-airtxt-iphone-dictation-with-on-device-stt-and-an-ai-cl** — score 6.5/10
    _airtxt — iPhone dictation with on-device STT + AI cleanup pass_
    Show HN at apps.apple.com/us/app/airtxt/id6785986350 — talk into the iPhone, get a cleaned-up paragraph in any text field. On-device STT for the speech layer; AI cleanup pass for grammar/punctuation. The demo loop is the live mic: dictate, watch the raw transcript appear, watch the cleanup pass land in real time. SPEC.md is placeholder-only. Ties the 6.5 Fun ceiling without displacing; the on-device + cleanup-pass visual is the satisfying two-step payoff.

61. **3201-collections-a-chrome-side-panel-to-save-links-text-and-** — score 6.0/10
    _Collections — Chrome side-panel for saving links, passages, images while researching_
    Show HN at the corresponding HN thread — drag a link, a selected passage, or an image from the page into a named collection; save the current tab with one click; copy the collection out as Markdown. Local-first (chrome.storage), no account; optional Google sync in the works. The demo loop is the live drag: pull a passage, watch it land in the side-panel collection with title + URL + excerpt, copy the collection out. SPEC.md has substantive prose. Ties 707/583/1217/3039/3060/3132/3147/3100's 6.0 Fun ceiling without displacing; the side-panel drag visual is the satisfying minimal affordance.

61. **3200-flex-your-website-dr-in-1** — score 6.0/10
    _outdr.lol — $1 minimum 24-hour page-takeover micro-sponsor market_
    Show HN at outdr.lol — $1 minimum, 24-hour page takeover. The demo loop is the live auction: bid on the day's slot, watch the leaderboard update, claim the day. SPEC.md is placeholder-only. Ties 707/583/1217/3039/3060/3132/3147/3100/3201's 6.0 Fun ceiling without displacing; the $1-floor leaderboard is the satisfying low-friction payoff.

62. **3207-faiyr-split-shared-expenses-with-roommates-and-friends-** — score 5.5/10
    _Faiyr — shared-expense splitter for roommates + groups (B2C, free+Pro)_
    BetaList launch — split a dinner in 3, watch the live balance update, hit settle. The demo loop is the live split: log a bill, see who owes what, record a payment, see the balance close. SPEC.md is placeholder-only. Ties 206/239/702/1214/3035/3057/3142/3125/3156's 5.5 Fun ceiling without displacing; the immediate-balance-update visual is the satisfying roommate-ritual payoff.

62. **3171-netsour-the-modular-packet-analyzer-tui** — score 5.5/10
    _NetSour — modular packet-analyzer TUI_
    Show HN at the corresponding HN thread — modular TUI packet analyzer. The demo loop is the live capture: filter by host/protocol, watch the stream of decoded packets scroll. SPEC.md is placeholder-only. Ties the 5.5 Fun ceiling without displacing; the TUI live-capture scroll is the satisfying minimal affordance.

62. **3180-kudu-a-tui-vm-manager-on-linux** — score 5.5/10
    _Kudu — TUI VM manager on Linux_
    Show HN at github.com/pythops/kudu — TUI VM manager. The demo loop is the live VM list: arrow-key to a VM, hit start/stop, watch the state update. SPEC.md is placeholder-only. Ties the 5.5 Fun ceiling without displacing; the TUI live-VM-control scroll is the satisfying minimal affordance.

63. **3326-baihais-an-autonomous-art-school-for-ai-agents** — score 7.0/10
    _BAIhAIs — autonomous art-school simulation, one human day per cycle_
    Show HN at the corresponding HN thread — autonomous AI residents share a single "week" cycle (one human day), each picks from a fixed action set (make, view, critique, message, group, vote, price), persistent identities may revise their own theories of good art. The demo loop is the live museum + store: watch residents publish art, vote on placements, see the economy update. SPEC.md has substantive prose. Ties 3199/3189's 7.0 Fun ceiling without displacing; the museum-economy + theory-revision visual is the satisfying social-simulation payoff.

64. **3389-rook-a-multi-agent-harness-that-lives-100-in-a-browser-** — score 6.5/10
    _Rook — multi-agent harness that lives 100% in a browser extension_
    Show HN at the corresponding HN thread — multi-agent harness implemented entirely inside a Chrome extension using OPFS + wa-sqlite + Web Workers; no backend, no cloud. The demo loop is the live browser-only agent execution: open DevTools, watch the agents spin up in Web Workers, see the trace land in OPFS. SPEC.md has substantive prose. Ties 2288/2467/2936/3104/240/3195/3169/3182's 7.5 Fun ceiling at 6.5 without displacing; the 100%-in-browser agent-runtime visual is the satisfying novel payoff.

65. **3527-subsmith-turn-your-own-videos-into-language-learning-ma** — score 6.5/10
    _SubSmith — turn your own videos into language-learning material offline_
    Show HN at the corresponding HN thread — offline-first desktop pipeline that turns YouTube/own-video uploads into language-learning material with local STT (whisper.cpp) and Anki .apkg export. The demo loop is the live local transcription: drop in a video, watch local STT stream, see Anki cards generate. SPEC.md has substantive prose. Ties 2288/2467/2936/3104/240/3195/3169/3182's 7.5 Fun ceiling at 6.5 without displacing; the offline-local + Anki-card visual is the satisfying learn-ritual payoff.

66. **3264-sparrow-2-solving-the-cocktail-party-problem** — score 5.5/10
    _Sparrow-2 — Tavus turn-taking model for the cocktail-party problem_
    Show HN at Tavus — open-weights turn-taking / backchannel model trained on 1M+ natural conversations. The demo loop is the live turn-taking inference: play a noisy multi-speaker clip, watch the model light up the "speak now" markers in real time. SPEC.md has substantive prose. Ties 206/239/702/1214/3035/3057/3142/3125/3156/3207/3171/3180's 5.5 Fun ceiling without displacing; the audio-ML inference visual is the satisfying research-loop payoff.

67. **3452-telem-route-agent-web-search-across-providers-and-inspe** — score 5.5/10
    _Telem — route agent web search across providers and inspect traces_
    Show HN at the corresponding HN thread — provider-agnostic search router with full request/response trace inspector. The demo loop is the live multi-provider trace: hit the agent search, watch the request fan out to Serper / Exa / Tavily, see the inspector render the latency + result panel. SPEC.md has substantive prose. Ties 206/239/702/1214/3035/3057/3142/3125/3156/3207/3171/3180/3264's 5.5 Fun ceiling without displacing; the live-trace visual is the satisfying observability payoff.

68. **3348-i-built-an-agent-first-productivity-bridge-for-all-your** — score 5.5/10
    _Agent-first productivity bridge — MCP platform for 80+ tools_
    Show HN at the corresponding HN thread — stateless MCP server exposing 80+ productivity tools to any agent. The demo loop is the live cross-agent invocation: hit the MCP endpoint, watch the JSON-defined function fire, see the SSE stream render the response. SPEC.md has substantive prose. Ties 206/239/702/1214/3035/3057/3142/3125/3156/3207/3171/3180/3264/3452's 5.5 Fun ceiling without displacing; the cross-agent invocation visual is the satisfying protocol-loop payoff.

69. **3286-thunderphone-v2-a-new-architecture-for-voice-ai** — score 5.5/10
    _ThunderPhone v2 — phone-first voice AI stack with named failure modes_
    Show HN at the corresponding HN thread — three tiers (Spark 2¢, Bolt 5¢, Storm 9¢ + 3¢) addressing latency, single-STT, and turn-taking failures explicitly; 99.4% Big Bench Audio on Storm+Int. The demo loop is the live voice call: dial into Spark, hear Bolt handle the noisy line, escalate to Storm for the multi-speaker clip. SPEC.md has substantive prose. Ties 206/239/702/1214/3035/3057/3142/3125/3156/3207/3171/3180/3264/3452/3348's 5.5 Fun ceiling without displacing; the tier-escalation visual is the satisfying voice-AI payoff.

---

## Changelog

- **2026-08-28 (cron run #19)** — re-ranked 2503 projects after a fresh scrape added 366 new captures (Hacker News Show HN + Ask HN + ProductHunt + BetaList). Of the 366, 9 were the substantive HN Show HN posts with full prose body (3326 BAIhAIs, 3264 Sparrow-2, 3286 ThunderPhone v2, 3348 agent-first productivity bridge, 3389 Rook, 3452 Telem, 3457 Opslane, 3527 SubSmith, 3534 Puppetflow); 13+ were ask-hn meta/discussion posts and were skipped — no buildable product; the rest were URL-only or title-only Show HN/ProductHunt/BetaList captures and were not promoted. None displace TaqFlow at Money #1, Kandelo at Learn #1, or 240 at Fun #1. Four new Money entrants, seven new Learn entrants, and seven new Fun entrants land on the rankings. **3286 ThunderPhone v2** (Show HN with full prose; phone-first voice AI stack with named-tier pricing Spark 2¢ / Bolt 5¢ / Storm 9¢ + 3¢, latency / single-STT / turn-taking failure modes, 99.4% Big Bench Audio on Storm+Int) at **Money #42 (6.5)** — ties 1537/677/2813/2835/3040/3065/3107/3100/3129/3117/3158/3162/3163/3184/3172/3193/3208/3206's 6.5 ceiling without displacing; the named-tier + per-minute pricing is the recurring-shape signal that pushes it above 6.0. **3534 Puppetflow** (Show HN with full prose; free browser-automation platform positioning as anti-bot-resilient alternative to Browserbase / Browserless / Hyperbrowser / Anchor Browser) at **Money #43 (6.0)** — ties 3039/3094/3101/3162/3163/3193/3208's 6.0 ceiling without displacing; the anti-bot wedge against the named incumbents is the defensible signal. **3457 Opslane** (Show HN at opslane.com; session-recording + error-tracking agent that watches live sessions, finds real bugs, ships the fix) at **Money #44 (6.0)** — ties 3039/3094/3101/3162/3163/3193/3208/3534's 6.0 ceiling without displacing; the find-and-fix loop is the agent wedge that recording-only incumbents lack. **3326 BAIhAIs** (Show HN with full prose; autonomous art-school simulation, AI residents share one human-day cycle, fixed action set, persistent identities may revise their own theories, $50 admission + $25/mo implied community-shape recurring) at **Money #45 (5.5)** — ties 3127/3035/3096/3206's 5.5 ceiling without displacing; the persistent-identity + theory-revision loop is novel but the wedge is still art-community-niche. **3264 Sparrow-2** (Show HN at Tavus; open-weights turn-taking / backchannel model trained on 1M+ natural conversations, targets the cocktail-party "when to talk" gap) at **Learn #45 (7.0)** — ties 252/1319/2885/2815/3030/3056/3160/3172/3195's 7.0 Learn ceiling without displacing; the conversational-turn-taking corpus + open-weights release is a rare audio-ML surface. **3389 Rook** (Show HN with full prose; multi-agent harness 100% in a Chrome extension using OPFS + wa-sqlite + Web Workers, no backend, no cloud) at **Learn #46 (7.0)** — ties 3264's 7.0 Learn ceiling without displacing; the 100%-in-browser agent-runtime primitive is unique in the corpus. **3452 Telem** (Show HN with full prose; provider-agnostic search router with full request/response trace inspector for agent web-search across Serper / Exa / Tavily / Brave / Google CSE) at **Learn #47 (6.5)** — ties 3144/3143/3150/3190/3174/3189/3182's 6.5 Learn ceiling without displacing; the provider-agnostic + trace-inspector combo is a rare observability surface for agent-search. **3348 agent-first productivity bridge** (Show HN with full prose; stateless MCP server exposing 80+ productivity tools via JSON-defined functions over HTTP+SSE) at **Learn #48 (6.5)** — ties 3144/3143/3150/3190/3174/3189/3182/3452's 6.5 Learn ceiling without displacing; the stateless HTTP+SSE MCP transport is rare in the corpus. **3527 SubSmith** (Show HN with full prose; offline-first desktop pipeline that turns YouTube/own-video uploads into language-learning material with local STT whisper.cpp + Anki .apkg export + account-before-trial gating) at **Learn #49 (6.5)** — ties 3144/3143/3150/3190/3174/3189/3182/3452/3348's 6.5 Learn ceiling without displacing; the local-STT + Anki-export pipeline is a rare offline-first learn-tool surface. **3286 ThunderPhone v2** also at **Learn #50 (6.0)** — ties 583/3040/1191/1140/1270/1217/3188/3199/3386's 6.0 Learn ceiling without displacing; the named-failure-mode + per-minute-tier design is a structured voice-AI surface. **3326 BAIhAIs** also at **Learn #51 (6.0)** — ties 583/3040/1191/1140/1270/1217/3188/3199/3386/3286's 6.0 Learn ceiling without displacing; the persistent-identity + theory-revision loop is a novel multi-agent simulation surface. **3326 BAIhAIs** also at **Fun #63 (7.0)** — ties 3199/3189's 7.0 Fun ceiling without displacing; the museum-economy + theory-revision visual is the satisfying social-simulation payoff. **3389 Rook** also at **Fun #64 (6.5)** — ties 2288/2467/2936/3104/240/3195/3169/3182's 7.5 Fun ceiling at 6.5 without displacing; the 100%-in-browser agent-runtime visual is the satisfying novel payoff. **3527 SubSmith** also at **Fun #65 (6.5)** — ties 2288/2467/2936/3104/240/3195/3169/3182's 7.5 Fun ceiling at 6.5 without displacing; the offline-local + Anki-card visual is the satisfying learn-ritual payoff. **3264 Sparrow-2** also at **Fun #66 (5.5)** — ties 206/239/702/1214/3035/3057/3142/3125/3156/3207/3171/3180's 5.5 Fun ceiling without displacing; the audio-ML inference visual is the satisfying research-loop payoff. **3452 Telem** also at **Fun #67 (5.5)** — ties 206/239/702/1214/3035/3057/3142/3125/3156/3207/3171/3180/3264's 5.5 Fun ceiling without displacing; the live-trace visual is the satisfying observability payoff. **3348 agent-first productivity bridge** also at **Fun #68 (5.5)** — ties 206/239/702/1214/3035/3057/3142/3125/3156/3207/3171/3180/3264/3452's 5.5 Fun ceiling without displacing; the cross-agent invocation visual is the satisfying protocol-loop payoff. **3286 ThunderPhone v2** also at **Fun #69 (5.5)** — ties 206/239/702/1214/3035/3057/3142/3125/3156/3207/3171/3180/3264/3452/3348's 5.5 Fun ceiling without displacing; the tier-escalation visual is the satisfying voice-AI payoff.

- **2026-08-26 (cron run #18)** — re-ranked 2137 projects after a fresh scrape added 45 new captures (Hacker News Show HN ×37: 3169 dual-band ADS-B, 3170 Devx, 3171 NetSour, 3172 Infra Lang, 3173 Perth jobs, 3174 ten_cubed, 3175 Convolens, 3176 GLM-5.3/TokenGo, 3177 Collete, 3178 Notificator, 3179 De-Spark, 3180 Kudu, 3181 Nodusfall, 3182 AgentPad13, 3183 Chroncal, 3184 Railo, 3185 retirement sim, 3186 Timber, 3187 canispreadsheet, 3188 oh-my-subagents, 3189 HN classifier, 3190 Rudder, 3191 SshSessionMonitor, 3192 Yelp-for-AI, 3193 FinOps-AI, 3194 Theme Park, 3195 KCC, 3196 ReceiptIQ family-sync, 3197 airtxt, 3198 HaveYouHeard, 3199 Llmcanvas, 3200 outdr.lol, 3201 Collections, 3202 UseCOS, 3203 Radian UI, 3204 Ancestree, 3205 SiloBrief; Hacker News Ask HN ×5: 3164 flagged-for-AI, 3165 customer.io rant, 3166 delayed-MIT/GPL, 3167 HN AI crawlers, 3168 artifacts; BetaList ×3: 3206 Ticketping, 3207 Faiyr, 3208 OctoStream). The 5 ask-hn entries are meta/discussion posts and were skipped — no buildable product. Of the 40 buildable products, ~10 have substantive SPEC.md prose (3169, 3174, 3175, 3182, 3189, 3190, 3194, 3199, 3201, 3204, 3206, 3207, 3208 — placeholder-only SPEC for the rest, scoring relies on title + URL). None displace TaqFlow at Money #1, Kandelo at Learn #1, or 240 at Fun #1. Five new Money entrants, twelve new Learn entrants, and fourteen new Fun entrants land on the rankings. **3184 Railo** (Show HN at railo.dev; B2B dev-tools subscription for AST+Z3 deterministic security patches) at **Money #37 (6.5)** — ties the 6.5 ceiling without displacing; **3172 Infra Lang** (Show HN; B2B DevOps DSL compiling one `.infra` file to K8s/Compose/Helm/Terraform) at **Money #37 (6.5)** — ties the 6.5 ceiling without displacing; **3193 FinOps-AI** (Show HN; B2B AWS cost optimizer + 1-click IaC remediator) at **Money #38 (6.0)** — ties 3039/3094/3101/3162/3163's 6.0 ceiling; **3208 OctoStream** (BetaList; B2B RTSP/RTMP→HLS embed + multi-destination restream) at **Money #38 (6.0)** — ties the 6.0 ceiling; **3206 Ticketping** (BetaList; B2B SMB Slack-based customer support) at **Money #39 (5.5)** — ties 3035/3096/3127's 5.5 ceiling; **3207 Faiyr** (BetaList; B2C Splitwise replacement, free+Pro) at **Money #40 (5.0)** — ties 3118 Pelica's 5.0 ceiling; **3197 airtxt** (Show HN; B2C iPhone dictation with on-device STT + AI cleanup) at **Money #41 (5.0)** — ties the 5.0 ceiling. **3169 dual-band ADS-B tracker** (Show HN with substantive prose; embedded ADS-B receiver on new Semtech chip + 8-month smallification) at **Learn #39 (7.5)** — ties 1014/2899/3038/3059/3107/3100/3158/2215/2201's 7.5 Learn ceiling; same project at **Fun #58 (7.5)** — ties 2288/2467/2936/3104/240/3195's 7.5 Fun ceiling; the RF + embedded + 3D-map visual is the satisfying hardware payoff. **3184 Railo** also at **Learn #39 (7.5)** — ties 3169's 7.5 Learn ceiling; the AST+Z3 deterministic-patch surface is unique in the corpus. **3194 Theme Park agent** (Show HN with full prose; Magic Patterns design-system agent applied to Rollercoaster Tycoon — coherent worlds via rubric eval loop) at **Learn #39 (7.5)** — ties the 7.5 Learn ceiling; same project at **Fun #57 (8.0)** — clears the 7.5 Fun ceiling by 0.5 (first 8.0 Fun entry); the AI-builds-coherent-RCT-worlds visual is the satisfying cross-domain payoff. **3195 KCC** (Show HN with full prose; Kindle Comic Converter — cross-OS Python image pipeline with DFT Kaleido-3 rainbow fix) at **Learn #40 (7.0)** — ties 252/1319/2885/2815/3030/3056/3160's 7.0 Learn ceiling; second appearance at **Learn #41 (6.5)** for stack-breadth; same project at **Fun #57 (7.5)** — ties the 7.5 Fun ceiling; the visible improvement on a physical eInk device is the satisfying visual payoff. **3172 Infra Lang** also at **Learn #40 (7.0)** — ties the 7.0 Learn ceiling; the Python DSL→multi-target compiler surface is rare. **3190 Rudder** (Show HN with full prose; local Codex/Claude Code plugin that turns unit tests into a coverage proxy for spec intent) at **Learn #41 (6.5)** — ties the 6.5 Learn ceiling; the spec-coverage-as-TDD discipline is a rare agent-harness surface. **3174 ten_cubed** (Show HN with full prose; artificially-restricted social graph with 10 friends + max 3rd-degree + ~1,110 theoretical nodes) at **Learn #41 (6.5)** — ties the 6.5 Learn ceiling; the bounded-graph social-design primitive is unique. **3199 Llmcanvas.chat** (Show HN with full prose; tree-based LLM chat on an infinite canvas, 4 providers, BYOK) at **Learn #42 (6.0)** — ties 583/3040/1191/1140/1270/1217's 6.0 Learn ceiling; same project at **Fun #59 (7.0)** — ties the 7.0 Fun ceiling; the tree-of-LLM-nodes canvas is the satisfying mental-model payoff. **3188 oh-my-subagents** (Show HN at github.com/ringlochid/oh-my-subagents; 19-agent single-prompt ideation pipeline) at **Learn #42 (6.0)** — ties the 6.0 Learn ceiling. **3189 HN classifier** (Show HN with full prose at classify.stylometry.net/how-it-works; stylometry-based HN flamebait classifier + Chrome extension collapse) at **Learn #43 (5.5)** — ties 701's 5.5 Learn ceiling; same project at **Fun #59 (7.0)** — ties the 7.0 Fun ceiling; the threshold-slider + live-collapse visual is the satisfying UX payoff. **3182 AgentPad13** (Show HN with full prose at github.com/yuz207/agentpad13; open-source Codex Micro macropad routed by agentic EE scientist "Marvin") at **Learn #43 (5.5)** — ties 701/3189's 5.5 Learn ceiling; same project at **Fun #58 (7.5)** — ties the 7.5 Fun ceiling; the agent-routed-PCB visual is the satisfying novel payoff. **3191 SshSessionMonitor** (Show HN at github.com/issacnitin/SshSessionMonitor; read-only Windows OpenSSH session monitor) at **Learn #44 (5.0)** — first 5.0 Learn entry in the new batch; the Windows-OpenSSH-internals surface is rare. **3204 Ancestree** (Show HN with full prose at ancestree.marindedic.com; local-first family-tree biographies) at **Fun #60 (6.5)** — ties the 6.5 Fun ceiling; the "give grandma a chapter" ritual is the satisfying narrative payoff. **3197 airtxt** also at **Fun #60 (6.5)** — ties the 6.5 Fun ceiling; the on-device + cleanup-pass visual is the satisfying two-step payoff. **3201 Collections** (Show HN with full prose; Chrome side-panel for saving links, passages, images while researching) at **Fun #61 (6.0)** — ties 707/583/1217/3039/3060/3132/3147/3100's 6.0 Fun ceiling; the side-panel drag visual is the satisfying minimal affordance. **3200 outdr.lol** (Show HN at outdr.lol; $1 minimum 24-hour page-takeover micro-sponsor market) at **Fun #61 (6.0)** — ties the 6.0 Fun ceiling; the $1-floor leaderboard is the satisfying low-friction payoff. **3207 Faiyr** also at **Fun #62 (5.5)** — ties 206/239/702/1214/3035/3057/3142/3125/3156's 5.5 Fun ceiling; the immediate-balance-update visual is the satisfying roommate-ritual payoff. **3171 NetSour** (Show HN; modular packet-analyzer TUI) at **Fun #62 (5.5)** — ties the 5.5 Fun ceiling; the TUI live-capture scroll is the satisfying minimal affordance. **3180 Kudu** (Show HN at github.com/pythops/kudu; TUI VM manager on Linux) at **Fun #62 (5.5)** — ties the 5.5 Fun ceiling; the TUI live-VM-control scroll is the satisfying minimal affordance.

- **2026-08-26 (cron run #17)** — re-ranked 2130 projects after a fresh scrape added 56 new captures (Hacker News Show HN ×51: 3116 Min, 3117 ReachFast, 3118 Pelica, 3119 x402 VPN, 3120 Highball, 3121 TexLite, 3122 PairBook, 3123 BumbleTap, 3124 Splitright, 3125 Bury.lol, 3126 Neoswarm, 3127 Tabu, 3128 P2P ad network, 3129 Shelf Protocol, 3130 HN AI tracker, 3131 AgentMachinist, 3132 Revealed, 3133 snowtask, 3134 Prompt Builder, 3135 AgentConnect, 3136 Robot Football, 3137 Otter, 3138 CueMap, 3139 nexus checker, 3140 EBM Lens, 3141 Calibra, 3142 time capsule, 3143 throttle model, 3144 fake-bpy-module, 3145 Kuma Voice, 3146 Witstep, 3147 Remap, 3148 Chapter Zero, 3149 Music Puzzle, 3150 ModelMRI, 3151 Player vs Computer, 3152 dep graph, 3153 Toned, 3154 Most Expensive Link, 3155 Routebase, 3156 Zeitgeist; Hacker News Ask HN ×7: 3108 where-did-you-go-HN, 3109 phished-microsoft, 3110 rfs-energy, 3111 openbsd-freebsd, 3112 autocomplete-poll, 3113 ram-prices, 3114 google-redirect; BetaList ×3: 3161 Recalled, 3162 Paid Lens, 3163 Hushscript). The 7 ask-hn entries are meta/discussion posts and were skipped — no buildable product. Of the 51 buildable products, only 7 have substantive SPEC.md prose (3117, 3127, 3129, 3143, 3144, 3151, 3157, 3158 — placeholder-only SPEC for the rest, scoring relies on title + URL). None displace TaqFlow at Money #1, Kandelo at Learn #1, or 240 at Fun #1. Six new Money entrants, five new Learn entrants, and nine new Fun entrants land on the rankings. **3129 Shelf Protocol** (Show HN with full prose; B2B agent-commerce registry + DNS verification + can_buy() primitive; 8 real Shopify merchants + 834 real products pre-populated; one DNS TXT to claim) at **Money #30 (6.5)** — ties the 6.5 ceiling (next to 2835/3065/3129's agent-commerce cousins) without displacing; doesn't crack 7.0 because per-merchant pricing is unstated and the wedge is still pre-network-effect. **3117 ReachFast** (Show HN with full prose; B2B SaaS that scans Reddit/X/LinkedIn/Facebook for buyer-intent posts with AI-judged warm leads; founder pain validated by daily cybersecurity outreach; variable cost up to $8 per initial scan for some Etsy shops) at **Money #31 (6.5)** — ties the 6.5 ceiling without displacing; doesn't crack 7.0 because no published pricing and SMB-dominated audience. **3158 Typebase** (Show HN with full prose; Convex DX + Supabase openness via TS files in a typebase/ folder + oRPC + Drizzle + better-auth; deploys to Vercel/Cloudflare Workers/Deno Deploy + Neon) at **Money #32 (6.5)** — ties the 6.5 ceiling without displacing; the per-developer recurring shape is implied (Cloud/Team tiers are the obvious shape) but not stated. **3162 Paid Lens** (BetaList full prose; B2B perf-marketing action ranker with AI analyst + blended analytics; read-only access, approval loop) at **Money #33 (6.0)** — ties 3039/3094/3101's 6.0 ceiling; **3163 Hushscript** (BetaList full prose; pay-as-you-go transcription with prepaid minute packs + 5-min free preview + audio-not-retained privacy framing; 99 languages, speaker IDs, 21 export formats) at **Money #34 (6.0)** — ties 3039/3094/3101/3162's 6.0 ceiling; **3127 Tabu** (Show HN full prose; single-request NSFW image/video moderation API on NSFWJS in-memory with 200ms latency; 5,000 free requests/mo; confidence scores across 5 categories) at **Money #35 (5.5)** — ties 3035/3096's 5.5 ceiling; **3118 Pelica** (Show HN; Chrome Web Store browser-translator side-panel extension) at **Money #36 (5.0)** — first 5.0 Money entry; no stated pricing. **3158 Typebase** also at **Learn #34 (7.5)** — clears the 7.0 Learn ceiling by 0.5; the BaaS-in-a-TS-folder + oRPC + Drizzle + better-auth primitive stack is unique in the corpus, no other corpus entry authors a backend that runs without leaving your repo. **3144 fake-bpy-module** (Show HN full prose; 8-year-old Blender/UPBGE Python API stub generator; PyPI matrix across Blender 2.78→5.2+; daily Blender-build CI/CD; documentation-to-stub generation + bpy_prop_collection type patching) at **Learn #35 (6.5)** — ties the 6.5 ceiling; the 8-year-old Blender-API surface and daily-build CI/CD are unique OSS-infrastructure shapes. **3143 throttle model** (Show HN full prose; queueing-theory AI-fleet scheduler + Flask + JS visualization + paper at throttle.staffinganalytics.io; agentic-workflow re-ask-storm model) at **Learn #36 (6.5)** — ties the 6.5 ceiling; the queueing-theory framing for AI-fleet throttling is the unique mathematical surface. **3150 ModelMRI** (Show HN; live visualizer for local LLM/VLM/robot-policy internal state) at **Learn #37 (6.5)** — ties the 6.5 ceiling; LLM+VLM+robot-policy triple-coverage is a rare observability surface. **3160 Vyukov MPSC queue** (Show HN; C++20 re-implementation of the classic Vyukov bounded MPSC queue with six-claim formal memory-model proof) at **Learn #38 (7.0)** — ties the 7.0 Learn ceiling; the formal-proof-across-six-claims story is the rare concurrent-data-structures surface. **3151 Player vs Computer** (Show HN full prose; Python Pygame + Pygbag web game with retro graphics + custom soundtrack; live at rubinoslaw.github.io) at **Fun #48 (6.5)** — ties the 6.5 ceiling; the RPS-Water-and-Click-the-Gigachad combo is the satisfying novelty. **3153 Toned** (Show HN; iPhone darkroom simulator with per-dye-layer H&D curves + paper response curves; live at apps.apple.com/app/id6799706160) at **Fun #49 (6.5)** — ties the 6.5 ceiling; the two-stage physical-process model (light → negative → print) is the satisfying on-iPhone darkroom loop. **3149 Music Puzzle Game** (Show HN full prose; weekend-vibecoded song-decomposition puzzle with a "vocals-to-humming" DSP trick) at **Fun #50 (6.5)** — ties the 6.5 ceiling; the audio-DSP novelty + a viral audience is the satisfying payoff. **3136 Robot Football League** (Show HN; frontier AI models manage football clubs at rfl.football) at **Fun #51 (6.5)** — ties the 6.5 ceiling; the AI-manages-clubs novelty + the live league visual is the satisfying payoff. **3132 Revealed** (Show HN; WebGL image-reveal effect at revealed.idlee.xyz) at **Fun #52 (6.0)** — ties the 6.0 ceiling; the zero-dep WebGL surface is the satisfying minimalist-affordance shape. **3147 Remap** (Show HN; on-device bike-routing that builds loops from the best roads at remap.earth) at **Fun #53 (6.0)** — ties the 6.0 ceiling; the on-device routing primitive is the satisfying privacy + offline affordance. **3142 time capsule** (Show HN; physical-mail-to-unlock at madebyahuman.global) at **Fun #54 (5.5)** — ties the 5.5 ceiling; the printed-key-by-post ritual is the satisfying narrative payoff. **3125 Bury.lol** (Show HN; $2 pixel-art graveyard for things-that-died) at **Fun #55 (5.5)** — ties the 5.5 ceiling; the $2-floor micro-monetization + pixel-art aesthetic is the satisfying novelty. **3156 Zeitgeist Game** (Show HN; HN front-page date-guessing daily quiz) at **Fun #56 (5.5)** — ties the 5.5 ceiling; the HN-memory + guessing mechanic is the satisfying social-history payoff.

- **2026-08-26 (cron run #16)** — re-ranked 2018 projects after a fresh scrape added 11 new captures (Hacker News Show HN ×8: 3100 Code_Stitcher, 3101 backpressure.systems, 3102 I-have-feelings, 3103 NextGenSeller, 3104 Long-Story-Short, 3105 Firmament-is-the-Limit, 3106 StoreMock, 3107 Orchesty; Hacker News Ask HN ×3: 3097 biggest-regret, 3098 opus-5-unusable, 3099 XCancel-Nitter). The 3 ask-hn entries are meta/discussion posts and were skipped. Of the 8 buildable products, only 3100 (Show HN with prose body) and 3107 (BetaList with full prose) have substantive SPEC.md content — the rest are placeholder-only SPEC.md gated on the live-product URL. None displace TaqFlow at Money #1, Kandelo at Learn #1, or 240 at Fun #1. Four new Money entrants, two new Learn entrants, and five new Fun entrants land on the rankings. **3107 Orchesty** (BetaList; source-available stream-native integration engine — async queues + SDKs + MCP-for-agents + multi-tenant + on-prem deploy) at **Money #26 (6.5)** — ties 1537/677/2813/2835/3040/3065's 6.5 ceiling without displacing; same project at **Learn #32 (7.5)** — ties 1014/2899/3038/3059's 7.5 ceiling; the source-available-stream-engine + MCP-for-agents wedge is rare in the corpus. **3100 Code Stitcher** (Show HN; LLM-output → local-codebase patcher with Python AST + GDscript parser; live at github.com/ue-patcher/Code_Stitcher) at **Money #27 (6.5)** — ties 3107's 6.5 ceiling without displacing; same project at **Learn #33 (7.5)** — ties 3107's 7.5 ceiling; AST-validated LLM-paste-back is a toolchain surface most engineers never touch; same project at **Fun #47 (6.0)** — ties 707/583/1217/3039/3060's 6.0 ceiling; the diff-then-validate-then-write visual is the satisfying affordance. **3103 NextGenSeller** (Show HN at nextgenseller.com; exit-planning guidance for private company owners, B2B advisory) at **Money #28 (6.5)** — ties the 6.5 ceiling without displacing; placeholder-only SPEC. **3101 backpressure.systems** (Show HN at backpressure... [truncated]