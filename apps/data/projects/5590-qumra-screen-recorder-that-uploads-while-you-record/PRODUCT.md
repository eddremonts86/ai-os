# PRODUCT.md — Qumra – Screen recorder that uploads while you record

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I built Qumra 3 years ago for myself. It&#x27;s a Loom like desktop screen and camera recorder for Mac and Windows.<p>I used Loom at the time and had a problem with the pricing, and the editor never did what I needed. As a software developer I record a lot of short videos for clients: showing a bug, a fix, an example. After recording I usually needed edits. Cut a part where something showed up on screen that shouldn&#x27;t be there. Silence the filler words instead of cutting them. Remove parts of the video by deleting them from the transcript. So the editor is built around those three things. Later, with AI getting better, I picked the project back up and wanted to make it usable by other people.<p>The other idea is that I neeeded the video to be uploaded while recording. The recorder produces WebM&#x2F;VP9 chunks from MediaRecorder. A worker batches them into 2 MB pieces and sends them in order to a Mux resumable upload URL. Mux used to reject out-of-order chunks, so concurrency is 1, with retries. It runs in a worker because slicing blobs on the main thread caused frame drops. When you stop, only the last piece is left to send. Mux then transcodes for a few seconds before playback starts, so the link exists the moment you stop but the video plays a few seconds later.<p>I needed system audio to work out of the box, without a virtual driver. The Electron main process spawns a small Rust helper. On macOS it uses ScreenCaptureKit. On Windows it uses WASAPI process loopback, which taps the audio engine rather than the default output device, so audio enhancement software and virtual drivers don&#x27;t break it. It streams raw PCM over stdout into an AudioWorklet that mixes it with the mic.<p>Viewers open the link in a browser, no account, and can leave comments pinned to a timestamp. The AI edits work by sending the transcript words to OpenAI and getting back mute and cut commands for the timeline. Filler words get muted, long pauses get cut.<p>Things it doesn&#x27;t do:<p>- You need an account to record. Recordings need an owner. Viewers don&#x27;t need one.<p>- The Windows build isn&#x27;t code signed, so SmartScreen will warn you. The Mac build is signed and notarized because that&#x27;s what I use.<p>- No Linux build.<p>- Not open source.<p>- Anyone with the link can watch the video.<p>Free plan is 30 recordings of up to 5 minutes each. Premium is $14.99&#x2F;month and unlocks AI transcription, the editor, and removes the caps.<p>Stack: Electron and React for the app, Convex for the backend, Mux for video, Remotion on Lambda for rendering edits.<p>Download: <a href="https:&#x2F;&#x2F;qumra.io&#x2F;download" rel="nofollow">https:&#x2F;&#x2F;qumra.io&#x2F;download</a><p>Two things I&#x27;d like to know. If you record short videos to show someone, what do you use today and what&#x27;s missing from it? And for people using Loom at work: do the Jira and Confluence integrations matter day to day, or is it mostly the recorder?

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

| Stakeholder | Why they care |
|---|---|
| Early adopters | _[What pain they feel, and how this solves it]_ |
| Founders | _[What pain they feel, and how this solves it]_ |
| SMEs | _[What pain they feel, and how this solves it]_ |

## Jobs To Be Done

1. **Functional job** — _[What the user is trying to accomplish]_
2. **Emotional job** — _[How they want to feel]_
3. **Social job** — _[How others perceive them using this]_

## Success Metrics (North Star)

- **Activation:** _[% of signups who complete X within Y days]_
- **Retention:** _[DAU/MAU, week-1 retention, cohort curves]_
- **Revenue:** _[MRR target, ARPU, LTV/CAC]_

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_TODO:_ list 2-3 alternatives + differentiation.

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49599379) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
