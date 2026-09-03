# PRODUCT.md — Serverless reverse geocoding for WebMCP, ESP32, and RP2040

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I built Galuchat, a compact reverse-geocoding system that works without an external geocoding server or API.<p>The same basic approach can be used in:<p>Browsers
WebMCP
ESP32
RP2040 &#x2F; RP2350
JavaScript &#x2F; C++ &#x2F; Java &#x2F; Python<p>The basic idea is to store the administrative-boundary data locally and perform the lookup directly on the device, instead of sending every coordinate to an external API.<p>Rather than storing the original polygon data as-is, Galuchat converts administrative regions into a very large raster segmentation image.<p>The raster uses resolutions ranging from roughly 10 m to 1 km per pixel. It is then compressed into a binary representation small enough to be embedded in MCU flash or downloaded as a single dataset by a browser.<p>Some actual dataset sizes are:<p>Japan-wide administrative boundaries
~1.1 km resolution: ~52 KiB
~111 m resolution: ~479 KiB
~11 m resolution: ~4.47 MiB
Place-name dictionary: ~31 KiB
Worldwide administrative boundaries
~1.1 km resolution: ~2.81 MiB
~111 m resolution: ~20.45 MiB
Place-name dictionary: ~561 KiB
Japan-wide administrative + town-block &#x2F; small-area data
~11 m resolution: ~24.07 MiB
Place-name dictionary: ~1.66 MiB
Total: about 26 MiB<p>This makes several kinds of use possible:<p>Embedding a Japan-wide administrative-area dataset of only tens or hundreds of KiB directly into a small MCU
Running more detailed offline reverse geocoding on ESP32-class devices with larger flash
Downloading a worldwide dataset once in a browser and then processing large numbers of coordinates locally without external API calls
Using the detailed Japan dataset to resolve locations below the municipality level entirely inside the browser<p>For example, a GPS-enabled embedded device can determine the administrative area for its current latitude and longitude without Wi-Fi or cellular connectivity.<p>The same applies in a browser. Once the GIS dataset has been loaded, individual coordinates do not need to be sent to an external service. Large GPS logs can therefore be processed locally without per-request API calls or service rate limits.<p>This means that even worldwide administrative-boundary data can be embedded in MCU flash or downloaded into a browser and queried locally.<p>WebMCP can use the same local dataset as well, so an AI agent can call the reverse geocoder directly inside the browser without relying on an external geocoding service.<p>Demo and documentation:
<a href="https:&#x2F;&#x2F;nyatla.github.io&#x2F;galuchat&#x2F;" rel="nofollow">https:&#x2F;&#x2F;nyatla.github.io&#x2F;galuchat&#x2F;</a><p>Source:
<a href="https:&#x2F;&#x2F;github.com&#x2F;nyatla&#x2F;galuchat-gis-sdk" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;nyatla&#x2F;galuchat-gis-sdk</a><p>I originally started this project as an experiment to see how small a practical geographic lookup dataset could be made.<p>It eventually became small enough to run on microcontrollers, so I extended the same approach to browsers and WebMCP as well.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49535465) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
