---
id: "2585"
slug: rnet-ai-token-service-provider
title: RNet – AI token service provider
status: draft
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49318304"
category: show-hn
date: "2026-08-16"
tags: [Show HN, Product, Problem]
---
# RNet – AI token service provider

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I built rNet.Why I built ? : I was using both an agentic IDE and a Hostinger deployment agent. One day, I ran out of credits on the deployment agent. To keep using it, I either had to wait for credits to reset or upgrade to a higher subscription or buy tokens. At the same time, I already had a subscription for the IDE, but I could not use those credits on Hostinger. simply despite having credits, we cannot use them.The basic idea is simple: users buy credits once on our platform and then use those credits across different AI applications. (It sound like OpenRouter, but the two platforms are solve totally different problems.)How it works:1. First developers register their product on the our platform and integrate our AI gatway to call AI models
2. Users purchase credits from our platform and connect their accounts to supported AI products. They can then use the same credits across all supported AI products.In details information "how it works" :-For developers:
rNet is simply an AI Gateway. Developers use our gateway to call AI models. It is not a payment layer for developers.Credit flow:
User → rNet holds credits → AI ProviderExample:
A user buys $10 of credits from rNet. We hold those credits in the user's account.When the user connects to a supported AI application and uses an AI model:
1. The application sends the AI request through our AI Gateway.
2. rNet deduct the required credits from the right user's balance.
3. then we pay the AI provider for that usage.It works similar to an internet data plan (that why i write "AI token service provider" like "internet service provider"):You buy 2 GB of internet data, and then you can use that data on hacker news, X or any other service. You don't need a separate data plan for each app. you use data until their data reaches zero.
Similarly, with rNet, users buy AI credits once and can use those credits across any supported AI applications until user's balance reaches zero. Then they need to recharge to continue using them.demo video : https://youtu.be/W7U3HdI37N0
basic version of product is live. https://www.rnetai.org/Result :-1. users can save money by using the same credits across multiple AI products.
2. Developers don't need to pay AI token costs upfront.
3. simple flowFuture features I'm considering (not built yet):1. Developers can fine-tune open-source models and use them in their products
2. AI model unified body
3. An enterprise version for companies
4. Users can send and receive AI credits like money
5. More features for both developers and usersWe’d especially love feedback on whether this solves a real problem or not ? and also if possible then you would describe the product in your own words.We’re currently facing a chicken-and-egg problem, so we decided to create a waitlist to help us figure out whether we should keep building this or put it in the trash and move on.If you like the concept, then join our waitlist: https://www.rnetai.org/reserve-spotThank You

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## Jobs To Be Done

_Not written yet — `ai-os plans enrich` fills this section._

## Success Metrics

_Not written yet — `ai-os plans enrich` fills this section._

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_Not written yet — `ai-os plans enrich` fills this section._

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [ProblemHunt](https://news.ycombinator.com/item?id=49318304) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
