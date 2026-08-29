---
id: "3636"
slug: it-was-never-you
title: It Was Never You
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49481007"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Swift 5.10, SwiftUI, CoreImage, Vision framework, Photos framework, PhotoKit, Sign in with Apple (only if user-driven auth is added)]
---
# It Was Never You

## Problem

The capture for this plan is a Show HN post in which the author describes the iOS app they built and, equally importantly, how they feel about it. Their words, quoted from the post: "Hi HN! I made my first iOS app - users can swap out an ex or friend for someone else in their photo library. I did this as a bit of a lark. I hope you find it entertaining, at least. At its most serious, it's a Black Mirror-esque note on the future we're enabling in the AI age. It's not an app I'd ever use or recommend people use." The author then frames the post as a question rather than a launch: how are other builders dealing with the feeling that the software they build is or is not making the world a better place.

That framing is the part of the record a marketing-style plan would sand off, and this plan does not. The product is real and shipped — it operates on the user's photo library and replaces one person with another — but the author's stated relationship to it is ambivalent, and the plan treats that ambivalence as a constraint rather than a sales-resistance problem. A spec that pretends the author is enthusiastic would misrepresent what they wrote.

The technical shape stated by the post is thin but real. It is an iOS app, the author's first iOS app, that operates on the photo library and replaces one identified person with another. The capture does not name a model, a vendor, a storage destination, an account system or a price; all of those are unstated and the plan does not invent them. The post does not promise that the swap is undetectable, that the result is high-fidelity, or that the app will be maintained; the plan honours each of those as open rather than asserting any of them.

The product's framing as "Black Mirror-esque" is the author's own, and the plan carries it forward in the same register rather than softening it. The "weird time to be alive" framing in the post is part of the same authorial stance: an app whose existence is a question rather than a manifesto. The plan scopes to what the post says and what the iOS photo-library surface allows, and flags everything else as an open question.

## Objective

Ship an iOS app — the author's first — that lets a user select a person in their photo library and replace that person with another, chosen person, across the photos the user selects. The app operates on the user's own photo library on the user's own device; it does not require an account, a network upload or a server-side processing pipeline for the user's photos. The author's stated relationship to the product — "a bit of a lark", "not an app I'd ever use or recommend people use" — is preserved throughout the documentation rather than sanded into a marketing pitch, because the source treats that ambivalence as part of the record.

## Target Users

- The author themselves, who built the app "as a bit of a lark" rather than for a defined audience.
- Curious iOS users who saw the Show HN post and want to try the operation the post describes on their own library.
- Photo-library hobbyists who already experiment with face-aware editing tools and want a dedicated app for the person-swap operation.
- People who hold an "AI-age" curiosity about how seamless face substitution now is on-device, treating the app as a demonstration rather than a utility.
- Builders reading the Show HN thread who want to engage with the author's question about software that may or may not make the world better.
- Reviewers who treat the app as an artefact of the 2026 moment, similar to how earlier "this is what we can do now" demos are remembered.
- Users who specifically want an on-device, no-account operation, which the photo-library surface allows without inventing a backend.
- People who read the author's ambivalence and decide that the operation is not for them, which the source itself invites.

## MVP Scope

- An iOS application (iPhone-first) that authenticates the user to their own photo library via the system permission flow.
- A face-selection step where the user picks one or more faces in one or more photos as the source of the replacement.
- A replacement-target step where the user picks another face — from the same library or from a small on-device gallery — as the destination.
- An on-device swap operation that writes the result back to the user's library as a new photo, leaving the original untouched.
- A small confirmation step where the user sees a preview of the swapped result before committing it to the library.
- A copy that preserves the author's stated ambivalence, so the app's own surface tells the user what the post already says about it.
- No account system, no cloud upload of user photos, and no telemetry that transmits the user's library or any face data.
- A first-launch onboarding screen that explains what the app does, what it does not do, and what the author thinks about it — in the author's own framing.
- App Store metadata that mirrors the post's tone rather than selling the app as a utility the user must have.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The author's stated relationship to the product — "a bit of a lark", "not an app I'd ever use or recommend people use" — is part of the captured record, and any app copy that contradicts that framing misrepresents the source.
- The capture does not name an account system, a price, a subscription, a model vendor, a network endpoint or a cloud storage destination; the plan does not invent any of these.
- The capture does not promise undetectable or high-fidelity swap; the plan does not promise them either, and the in-app copy must not promise them.
- The app operates on the user's own photo library on the user's own device, and any feature that would require uploading user photos to a remote server is out of scope of the stated shape.
- The author's framing of the app as "a Black Mirror-esque note on the future we're enabling in the AI age" is part of the product's stated register, and the App Store metadata and onboarding copy must carry that register rather than rewrite it.
- The post raises a meta-question — how does the author (and the reader) feel about software that may or may not make the world better — and the plan treats that question as part of the deliverable rather than an afterthought.
- iOS App Store review imposes constraints on apps that operate on user photos, on apps that produce AI-generated imagery of identifiable people, and on apps that could be used to deceive; the plan flags those review constraints without inventing a strategy for navigating them.
- The author's first iOS app framing implies a small project; the plan does not promise enterprise-grade reliability, on-call support or a feature roadmap beyond what the post describes.
