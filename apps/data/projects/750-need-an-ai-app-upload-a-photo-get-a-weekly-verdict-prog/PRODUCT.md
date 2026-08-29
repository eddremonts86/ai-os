---
id: "750"
slug: need-an-ai-app-upload-a-photo-get-a-weekly-verdict-prog
title: "Need an AI app: upload a photo → get a weekly verdict «progress / no progress» and advice on when to increase load. Existing trackers either lack AI or are too complex. Willing to pay $100/year."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/fitness/xhutexah41-need-an-ai-app-upload-a-photo-get-a-week"
  captured: "2026-03-29"
category: fitness
date: "2026-03-29"
tags: [Fitness, AI, Other]
country: Greece
wtp:
  raw: "$100/year, or $150 for a PRO membership"
  currency: USD
  min: 100
  max: 150
  period: year
  mrrMid: 10
tech: [React Native with Expo, FastAPI, Postgres, pose-estimation preprocessing, vision model comparison pipeline, encrypted object storage]
---
# Need an AI app: upload a photo → get a weekly verdict «progress / no progress» and advice on when to increase load. Existing trackers either lack AI or are too complex. Willing to pay $100/year.

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

One photo a week, one answer: progress or no progress. When the answer is no, a single recommendation — increase the load or adjust nutrition — instead of a dashboard to interpret. Built for someone who already takes the photos and only wants the verdict, at $100/year against the $20/month he already turned down.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Self-coached lifter with a weekly photo habit | Takes the photos already, has no coach to read them, and does not want to become the analyst. Tolis' words: a clear yes/no, not dozens of metrics. |
| Someone in a cutting phase | Same weekly ritual, opposite direction. Needs the verdict logic to detect fat loss as reliably as it detects mass gain. |
| A lifter who tried ChatGPT for this | Already paid $20/month for photo analysis and found it inaccurate for the purpose. Their bar is not "has AI" but "is right". |
| Remote coach (later) | Reads the same weekly photos by hand for several clients; a per-client verdict feed is an obvious extension once the single-user verdict is trustworthy. |

## Jobs To Be Done

1. **Functional job** — Find out whether this week's training and eating actually moved anything, from a photo, without measuring or logging.
2. **Emotional job** — Stop the weekly uncertainty of staring at two similar photos and not knowing. He is not asking for data; he is asking to be told.
3. **Social job** — None stated, and that is worth respecting. Nothing in the source asks for sharing, leaderboards or a community. Adding them would be building a different product.

## Success Metrics

- **Weekly verdict streak:** consecutive weeks a user uploads and receives a verdict. The problem occurs weekly by his own account, so weekly return is the product working.
- **Verdict agreement:** share of verdicts the user marks as matching their own read of the photos. Accuracy is the reason ChatGPT lost this user, so it has to be measured from the user's side, not just from the model's confidence.
- **Abstention rate:** share of weeks the system declines to issue a verdict for framing, lighting or interval reasons. Too high and the product is useless; zero means it is guessing when it should not.
- **Recommendation follow-through:** share of "no progress" verdicts where the user reports acting on the load or nutrition advice. The advice is half the ask, and unactioned advice is decoration.
- **Renewal at year one:** he named an annual price, so the honest retention reading is annual, not monthly.
- **Inference cost per user-year:** must stay well inside $100 for the price he named to be a business rather than a subsidy.

## Pricing & Monetization

He states it directly: $100 per year, or $150 for a PRO membership, for an app that analyses his photos, compares them week to week, honestly tells him whether there is progress, and advises when to push harder. The ceiling is equally explicit — ChatGPT at $20/month was rejected as too expensive. An annual-first price around $100 with a $150 PRO tier matches the source exactly; the PRO tier's contents are not specified and should be defined from what he asked for rather than invented.

## Competitive Landscape

The source names what he tried and why each failed, which is the whole landscape as far as this user is concerned:

- **ChatGPT** — $20/month, and photo analysis not accurate for this purpose. Both the price ceiling and the accuracy bar come from here.
- **Photo-storage progress apps** — save the weekly photos, no AI analysis. They leave the comparison to the user, which is the work he wants done.
- **3D body-scan apps** — overloaded for the question. Precise measurement he did not ask for, at complexity that made them unusable for him.
- **Manual-entry trackers** — require logging data before producing anything, which inverts his requirement: he wants to submit a photo, not a dataset.
- **A coach** — would give exactly this verdict and this advice, at a price he never mentions considering.

## Risks & Open Questions

- [ ] Establish whether a photo-only comparison can reach a defensible verdict at weekly intervals, where real change is small and lighting, posture, pump and hydration all move the image more than a week of training does.
- [ ] Define the abstention rule before the verdict rule. A product built to always answer will answer wrongly, and this user has already left one product for that reason.
- [ ] Body photographs from an EU user: settle GDPR consent, storage encryption, deletion and the no-training-without-opt-in position before the first upload.
- [ ] Cost out the per-comparison inference to confirm 52 verdicts a year fit inside $100 with margin.
- [ ] Specify what the $150 PRO tier contains, using only capabilities he asked for. He named the price without naming the contents.
- [ ] The author wants 1% equity in the startup that builds this and offers feedback in exchange. Settle that before treating him as a design partner.
- [ ] Decide how "adjust nutrition" advice stays useful without collecting the food logging he explicitly does not want to do.

---

_Source:_ [ProblemHunt](https://problemhunt.pro/en/fitness/xhutexah41-need-an-ai-app-upload-a-photo-get-a-week) · **Category:** fitness · **Tags:** Fitness,AI,Other
