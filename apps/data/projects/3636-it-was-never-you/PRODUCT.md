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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

An iOS app that lets a user replace one person in their photo library with another person, on-device, using the user's own photos and no account. The author's own framing — "a bit of a lark", "a Black Mirror-esque note on the future we're enabling in the AI age", "not an app I'd ever use or recommend people use" — is preserved in the in-app copy rather than sanded into a marketing pitch, because the source treats that ambivalence as part of what the product is.

The app does the operation the post describes and nothing more. It does not promise undetectable or high-fidelity swaps, it does not upload the user's library, and it does not ask the user for an account. The author has called it their first iOS app, and the plan treats the project as a small, deliberately-scoped artefact rather than a platform.

**One-liner:** It Was Never You is a first-iOS-app demo that swaps one person in your photo library for another, on-device, with the author's ambivalence about what that means carried in the copy itself.

## Target Users

| Stakeholder | Why they care |
|---|---|
| The author | They built it as a lark and are explicitly ambivalent about the result. |
| Show HN readers | A working demonstration of on-device person-swap, framed as a question rather than a launch. |
| Photo-library hobbyists | A dedicated surface for the person-swap operation on their own device. |
| AI-age curious | A small artefact that demonstrates what on-device face substitution is in 2026. |
| Builder community | The author's question about software that may or may not help is part of what is on offer. |
| Reviewers treating it as a 2026 moment | The app is a record of what the technology now allows at app-store scale. |
| Users who want no account and no upload | The iOS-photo-library surface allows this without a backend. |
| Users who read the ambivalence and decline | The author's own stance invites that decision, and the plan respects it. |

## Jobs To Be Done

1. **Functional job** — Pick a person in the photo library, pick another person as the target, and write the swapped photo back to the library.
2. **Functional job** — Do all of the above without uploading the user's photos to a remote server.
3. **Functional job** — Preview the result before committing, so the user sees what the operation does.
4. **Emotional job** — Engage with the AI-age question the author is asking, even when the engagement is "this is not for me".
5. **Emotional job** — Have an app that does not pretend its author is enthusiastic when the source says otherwise.
6. **Social job** — Talk about what on-device face swap means in 2026, with an artefact to point at.
7. **Emotional job** — Decide, on the author's own framing, whether the operation is something the user wants to perform at all.

## Success Metrics

- **On-device completion rate** — share of started swaps that finish without a network call, because the privacy shape is part of the stated surface.
- **Network egress per session** — bytes leaving the device during a typical swap operation, expected to be near zero.
- **Library integrity** — share of swaps that leave the original photo untouched in the user's library.
- **Preview engagement** — share of started swaps where the user inspects the preview before committing, because the confirmation step is part of the spec.
- **App Store review status** — the iOS App Store review is a real gate for any app in this shape, and the metric is whether the review passes at all.
- **Author-tone preservation** — share of in-app strings that carry the author's stated ambivalence rather than a marketing rewrite.
- **User decline rate** — share of users who, after reading the in-app copy, decide not to perform a swap, which the author's framing invites and the plan respects.

## Pricing & Monetization

The post names no price, no tier and no monetisation model; the app is the author's first iOS app and is positioned in the post as a question rather than a launch. What the architecture does fix is the cost shape: an on-device operation on the user's own library, with no backend and no model API, so the marginal cost of a swap is compute on the user's phone. Any future monetisation would have to be added in a way the author is comfortable with, and the plan does not invent one.

## Competitive Landscape

- **General face-swap apps on the App Store** — the broader category the source positions the app within, often framed as entertainment; the author's framing differentiates by not selling itself as entertainment the user must have.
- **Photo-editing suites with face-aware tools** — apps that include face swap as one feature among many; the source positions this app as a single-purpose demonstration rather than a suite.
- **AI-portrait apps** — the category of apps that produce AI-generated imagery of people; the on-device, no-account shape is the explicit differentiator.
- **The post's own "Black Mirror-esque" framing** — the cultural reference the author invokes; the app's relationship to it is by the author's own admission ironic, and the plan treats that irony as part of the product's positioning rather than a marketing problem.

The post names no direct competitor, and no further comparison is claimed here.

## Risks & Open Questions

- [ ] Confirm the iOS App Store review strategy for an app that produces AI-generated imagery of identifiable people, since the review constraints are real and the source does not promise they are navigable.
- [ ] Decide how the in-app copy carries the author's stated ambivalence without becoming a marketing liability or a review risk in itself.
- [ ] Establish the on-device compute budget for the swap operation, since modern iPhones vary widely in face-aware workload capacity.
- [ ] Audit the network egress of the operation end to end, because a single telemetry call would break the privacy shape the plan commits to.
- [ ] Confirm the original-photo preservation guarantee with a test, since silent mutation of the user's library is a category of harm the user has not consented to.
- [ ] Decide what happens if the post-conditions of the iOS permission flow change, since photo-library permissions have tightened across recent iOS versions.
- [ ] Decide how the app handles a user who picks a target face that is itself a face of a person who did not consent to the swap, which is a question the source raises and does not answer.
