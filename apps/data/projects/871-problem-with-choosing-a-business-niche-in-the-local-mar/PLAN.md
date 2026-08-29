---
id: "871"
slug: problem-with-choosing-a-business-niche-in-the-local-mar
title: Problem with choosing a business niche in the local market
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/ai/tl9r966991-problem-with-choosing-a-business-niche-i"
  captured: "2025-10-29"
category: ai
date: "2025-10-29"
tags: [AI, Business, Psychology, Education, Other]
country: India
wtp:
  raw: $50 one-time
  currency: USD
  min: 50
  max: 50
  period: one-time
  mrrMid: 50
tech: [Retrieval-augmented generation over local market sources, Python data ingestion, DuckDB analytics, Streamlit report builder, WhatsApp Business API delivery, PDF report generation]
---
# Problem with choosing a business niche in the local market

## Tech Stack

- **Retrieval over local sources:** the differentiator is grounding, so the system is retrieval-first — a corpus of local market documents and datasets per city, cited per claim. A general model answering from pre-trained knowledge is the failure the author already experienced.
- **Ingestion:** Python jobs to collect and normalise regional market material per city, with a recorded collection date so staleness is visible rather than hidden.
- **Analytics:** DuckDB for the profitability comparison — the manufacturing-versus-white-label maths is small-table analytics on assumptions the user can see and edit, not something an LLM should be asked to compute.
- **Report builder:** templated generation to PDF, since what the author is buying is a business plan with step-by-step instructions he can act on and show people.
- **Delivery:** WhatsApp Business API, because WhatsApp is the contact channel the author himself lists.

## Architecture

A report is a pipeline run, not a chat. The user's intake — city, sector experience, candidate models — selects a slice of the local corpus. The retrieval step pulls the material relevant to that city and sector, with citations. The comparison step runs an explicit profitability model per candidate business model, with the assumptions surfaced as editable inputs so the user can challenge them. Generation then writes the plan around those two grounded artefacts, and every claim carries the source it came from. Nothing about the pipeline is novel; the work is entirely in assembling a local corpus worth retrieving from, and that is also where the plan can fail.

## Milestones

1. **M0 — Data feasibility.** Before building anything: establish whether current, city-level market and cost data for Kolkata is obtainable, and at what price. If it is not, the product cannot be honest and the milestone is a negative finding. End of week 3.
2. **M1 — One-city corpus.** Ingest and normalise Kolkata local market sources with collection dates and citation metadata. End of week 6.
3. **M2 — Model comparison engine.** Manufacturing versus white label profitability with visible, editable assumptions. End of week 8.
4. **M3 — Report generation.** Personalised plan with step-by-step instructions and per-claim citations, delivered as PDF over WhatsApp. End of week 10.
5. **M4 — First paying report.** Sell one $50 report to the author and measure whether it beats what he already got from ChatGPT. End of week 12.
6. **M5 — Second city.** Repeat the corpus build for one more Indian city and measure the marginal cost of adding a region. End of week 18.

## Risks

- **The data may not exist.** Everything rests on current, city-level Indian market data being obtainable. The source names no such source, and if the only available material is the same general web content ChatGPT already searches, the product's one differentiator disappears.
- **A general research tool may already suffice.** A commenter suggested Grok and Perplexity, on the reasoning that ChatGPT is limited to pre-trained data plus web search. That hypothesis is untested. If a research-specialised assistant answers the question adequately, a $50 report has no space to exist.
- **$50 has to cover data plus generation.** One report priced at $50, with any human review at all, is thin. Recurring revenue depends on a subscription the author will only consider after seeing real results.
- **Recommendation liability.** The product tells someone which business to start, and this specific user has a history of ventures that failed and a family that no longer backs him. Presenting a comparison with visible assumptions is defensible; presenting a confident recommendation is not.
- **Co-founder, not customer.** The author states he is looking for a business co-founder to build the solution. His $50 is a stated willingness to pay, but the relationship he is proposing is partnership, which is a weaker demand signal than a purchase.
