---
id: "3045"
slug: samuel-a-silly-speech-model
title: "Samuel, a Silly Speech Model"
status: draft
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49343584"
category: show-hn
date: "2026-08-18"
tags: [Show HN, Product, Problem]
---
# Samuel, a Silly Speech Model

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ My original idea was to make a modern supercharged version of SAM, the old-school text-to-speech. Then I remembered Pink Trombone, one of my favorite creative coding projects. In the end, I decided to just make it a model that mimics speech - it would be easy to make a text-to-speech by chaining an existing TTS with a Samuel filter.The phonetics work quite well for vowels - you can try making a sound and then seeing if the predicted tongue prediction matches where your tongue was. It's less accurate for consonants; it doesn't do plosives or nasals (I tried).How the machine learning works:It's a speech autoencoder in which the decoder is Pink Trombone. A couple of issues: PT is not differentiable, so I use Gumbel softmax to get a differentiable approximation. PT also generates audio sample-by-sample (apparently it's called a "Kelly-Lochbaum vocal tract model"), which would make training extremely slow. To do that, I approximate it using FIR filters that change each 10ms.
The fundamental frequency is not computed by the model, but by a method called pyin.
Now that the gradient can flow through the model, the question is what loss to use. Matching the spectrum/MFCC coefficients gets you to something that sounds like speech, but isn't intelligible. What does work is trying to match the original and generated audio in the space of a self-supervised audio representation model - I used wav2vec2.
There are a couple of tricks on top of that like encouraging the model not to move the parameters too quickly, and balancing the Gumbel softmax between exploration and exploitation.

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

_Source:_ [ProblemHunt](https://news.ycombinator.com/item?id=49343584) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
