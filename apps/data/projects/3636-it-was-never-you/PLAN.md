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

## Tech Stack

- **Swift 5.10** with **SwiftUI** for the app's UI, because the source describes the author's first iOS app and SwiftUI is the modern first-iOS-app path.
- **CoreImage** and the **Vision framework** for on-device face detection and feature-point extraction, so the swap runs locally and the user's photos never leave the device.
- **Photos framework** and **PhotoKit** for the photo-library integration, including the system permission flow and the immutable-write-back path.
- **A small on-device ML model** (Apple-provided or a CoreML-compiled small model) for the actual face-swap operation; the choice between Apple-supplied and a small CoreML model is left to the implementation because the source does not name a vendor.
- **Sign in with Apple** only if a user-driven auth surface is added later; the MVP ships without any account, and the plan does not invent one.
- **A small amount of UIKit** for the parts of the photo-library permission flow that SwiftUI does not yet cover cleanly.

## Architecture

The app is a single iOS target. On first launch it shows an onboarding screen that explains what the app does, what it does not do, and what the author thinks about it — in the author's own framing from the post. After onboarding the user grants photo-library access through the system permission flow, which the app does not bypass.

The main flow has three steps. The user picks the source photo or set of photos and selects the face to replace, using the system face-detection UI to confirm the selection. The user then picks the target face — either another detected face from their library or a small on-device gallery — and confirms. The app runs the swap on-device, generates a preview, and writes the result back to the user's library as a new photo. The original photo is never modified.

The on-device ML path is the only place where compute happens. The face-detection step uses the Vision framework; the alignment and the swap use a small on-device model whose details the plan does not invent; the result is composited with CoreImage. The pipeline runs entirely on the user's device, with no network call at any point and no telemetry that transmits the user's photos or any face data.

The App Store metadata and the in-app copy both carry the author's stated ambivalence in their own words, because the source treats that ambivalence as part of the product. The metadata does not market the app as a utility the user must have, and the onboarding screen tells the user the author built it as a lark and would not use it themselves.

## Milestones

1. **M1 — App skeleton and onboarding** — SwiftUI app target, the onboarding screen with the author's framing, and the photo-library permission flow.
2. **M2 — Face detection and selection** — Vision-based face detection in the source photo, with a confirmation UI that shows the selected face.
3. **M3 — Target selection** — pick the target face from the user's library or from a small on-device gallery.
4. **M4 — On-device swap** — the swap operation with the on-device ML model, a CoreImage composite, and a preview the user can inspect before commit.
5. **M5 — Library write-back** — write the new photo to the user's library as a separate asset, leaving the original untouched.
6. **M6 — Copy and metadata** — App Store description, screenshots and in-app strings that carry the author's ambivalence rather than a marketing rewrite.
7. **M7 — Network audit** — automated check that the running app makes no network calls during a typical swap operation.
8. **M8 — App Store submission** — the iOS review submission, with the realistic expectation that the review may push back on apps in this shape and the plan does not invent a strategy for that.

## Risks

- **App Store review rejection** — apps that produce AI-generated imagery of identifiable people are a real review risk, and the plan does not promise the review will pass.
- **Author-tone drift** — marketing copy that contradicts the author's stated ambivalence misrepresents the source and should be caught before submission.
- **Network-call regression** — a single telemetry call would break the privacy shape the plan commits to; the audit has to be strict.
- **Original-photo mutation** — silent modification of the user's library is the kind of harm the user has not consented to, and the test must catch any path that writes to the original asset.
- **Compute budget on older devices** — modern face-swap compute is expensive, and older iPhones may not deliver a usable preview within a reasonable time.
- **Consent of the target face** — the post does not address consent of the person being inserted into the photo, and the plan does not invent a strategy for that.
- **Post-conditions of iOS permission flow** — photo-library permissions have tightened across recent iOS versions, and any tightening that lands after submission can break the app's core flow.
