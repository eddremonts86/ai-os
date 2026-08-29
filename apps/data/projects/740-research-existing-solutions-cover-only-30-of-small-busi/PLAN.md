---
id: "740"
slug: research-existing-solutions-cover-only-30-of-small-busi
title: "Research: existing solutions cover only 30% of small businesses' concerns about potential legal risks. They need a different product."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/validated/hmj0kxg8c1-research-existing-solutions-cover-only-3"
  captured: "2026-05-15"
category: validated
date: "2026-05-15"
tags: [Validated, Legal, Business, Other]
wtp:
  raw: $99 one-time for the research document
  currency: USD
  min: 99
  max: 99
  period: one-shot
tech: [Next.js, Postgres, Playwright site crawler, LLM risk-classification pipeline, Resend, Stripe]
---
# Research: existing solutions cover only 30% of small businesses' concerns about potential legal risks. They need a different product.

## Tech Stack

- **Playwright crawler:** the product's input is a live storefront, so the scanner has to render it the way a regulator or a complainant would see it — client-rendered product claims, cookie writes that only happen after consent interaction, checkout flows behind JavaScript. A fetch-and-parse crawler would miss precisely the risks the incumbents also miss.
- **LLM risk-classification pipeline with a rule layer underneath:** deterministic checks for the things that are mechanically detectable (missing disclosures, trackers firing before consent, unreachable contact details), and a model pass for the judgement calls (claims that read as guarantees, pricing presented in a way that hides total cost). Findings from the model layer are labelled as such, because an owner acting on a legal finding needs to know which are measured.
- **Postgres:** sites, scans, findings, jurisdiction rules and remediation state. Findings are versioned per scan so an owner can see what appeared, what was fixed and what came back.
- **Next.js:** the report is the product surface. Server-rendered, per-finding pages that are readable and linkable, since the owner will forward one to whoever maintains the site.
- **Resend:** scheduled scan results and new-finding alerts by email. The owner does not log in to check; they need to be told when the storefront changed into a risk.
- **Stripe:** whatever the eventual model is, one-time scan or subscription, it needs a payment surface. The pricing decision itself waits for the research document.

## Architecture

Three layers, and the boundary between them is the whole point. The **crawl layer** takes a domain and produces evidence: rendered pages, network requests, cookies set before and after consent, form fields, checkout steps. Evidence is stored, so a finding can always be traced to what was observed rather than to what a model concluded.

The **rule layer** turns evidence into findings, and every rule carries a jurisdiction scope. This is the constraint the respondents' spread across countries imposes: a rule with no jurisdiction is a rule that produces a fine in one country and noise in another. Deterministic rules run first; the model pass runs over remaining evidence for risk categories that resist rules, and its findings are flagged as inferred.

The **report layer** ranks findings, explains each in plain language, and splits remediation into self-fixable and needs-a-lawyer. Remediation state persists across scans so the scheduled re-scan can say "this returned" — which is what turns a one-time audit into a recurring product.

The 28 respondents sit outside the architecture but inside the plan: the finding categories go back to them before the rule library is built out, because the research document already contains the answer to what they want and this is the cheap substitute for having it.

## Milestones

1. **M0 — Get the research.** Acquire the $99 document, or exhaust the free-access path, and reconcile its target-audience profile, product description and monetization model against this plan. Everything downstream is cheaper after this. Week 1.
2. **M1 — Crawl and evidence store.** Playwright crawler producing storable, replayable evidence for one storefront; the evidence schema that every later finding must reference. End of week 3.
3. **M2 — First rule set, one jurisdiction.** Deterministic rules covering the risk categories the respondents named, scoped to a single jurisdiction, with plain-language explanations. End of week 6.
4. **M3 — Report and remediation.** Ranked findings, self-fix versus lawyer split, remediation state, per-finding pages worth forwarding. End of week 8.
5. **M4 — Model layer for the unruled categories.** Inferred findings clearly labelled, with a measured false-positive rate before they are shown to any owner. End of week 10.
6. **M5 — Respondent validation.** Working MVP presented to the interviewed owners; coverage measured against their named concerns. End of week 12.
7. **M6 — Scheduled re-scan and second jurisdiction.** Recurring scans with change alerts, plus one more country's rule scope. End of week 15.

## Risks

- **Building without the research.** The document that costs $99 contains the audience profile, the exact product wanted, the preferred monetization model, the competitor analysis, the go-to-market plan and the landing-page structure. Scoping around it is paying in weeks to avoid paying in dollars, and the parts most likely to be wrong are the ones the document already answers.
- **Legal findings without legal review.** The product tells a business owner they may be exposed to a fine. Wrong in the alarming direction, it causes needless spend; wrong in the reassuring direction, it becomes the reason they did not act. Framing every finding as informational is necessary but does not make the second failure harmless.
- **Jurisdiction sprawl.** Respondents span different niches and countries, and legal risk is not portable. Each new country multiplies the rule library rather than extending it, so coverage breadth and coverage depth compete directly for the same effort.
- **False positives destroy the core promise.** The owner's problem is an unbounded worry. A scanner that returns forty findings, most irrelevant, hands the worry back with a number attached — worse than the incumbents, who at least return a document.
- **The coverage claim may not survive measurement.** The 20-30% figure came from the team's assessment of Termly, iubenda and CookieYes against one owner's concerns. If a fair mapping puts incumbent coverage materially higher, the product's reason to exist shrinks to a feature.
- **The validation cohort is a favour, not a channel.** Twenty-eight owners willing to try something is a first cohort and no more. The offer applies to the first three MVPs, so the access may already be spoken for, and it says nothing about how the twenty-ninth customer is found.
- **The seller of the research is the party asserting the problem.** The guarantee offered for a failed thesis is free access to another validated problem, not a refund of the year spent building. That asymmetry belongs in the decision, not in a footnote.
