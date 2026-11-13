# Scored critics

The default review reports blockers and majors. Use this mode when there is a bar to reach: references to match
(`/aios-ui-design` "Match references"), a 3D scene (`/aios-ui-3d`) or a video (`/aios-ui-video`), or a user who
says "keep going until it is a 9". Adapted from cook by Leon Lin (MIT, see NOTICE-cook.md).

## The rubric: one number per dimension

One overall number lets the weakest dimension hide. Score every shot (one reference, one screen state, one
camera preset) on every dimension that applies. Stills and screens: 0 to 100 as closeness to the reference
(100 = a viewer could not tell which is the reference). Video and motion: 1 to 10.

| Work | Dimensions |
|---|---|
| UI screen | layout and spacing, typography, color, components, density, interaction and motion |
| 3D scene | composition, light, color, materials, detail near and far, motion |
| Video | first frame, composition, light, color, motion and transitions, pacing, sound |

Write the bar per dimension into the brief before round 1. A stretch bar (99 for stills, 9/10 when the
references sit at about 8.5) tells the agent the job is not done when it first works; it is not a promise.

## Critics

- **Fresh context:** a new subagent with no history, no code, no brief, and not your score. Do not say who built
  it, how long it took or what you think of it. If the harness has no subagent tool, say so and mark the round
  "self-scored"; never present a self-score as a review.
- **Input:** only the side-by-side images (`aios-ui-verify/scripts/compare.py`) and the rubric with the bar. For
  video: contact sheets or the clip, with timecodes.
- **At least two per round**, three for big builds; one from another model helps. Take the **median** per
  dimension. If two critics differ by more than 10 points (1.0 on a 10 scale), add one more.
- **Your own score** is logged, never decisive.

Prompt for stills and screens (fill the dimensions and the bar):

```text
You are a strict art director seeing this work for the first time.
Each image shows a reference on the left and a render on the right.
For each image, score how close the right side is to the left, 0 to 100, on: [dimensions].
100 means a viewer could not tell which one is the reference. The bar is [99].
Then list the 3 biggest gaps per image: where (region), what is wrong, what to change.
End with the single weakest area across all images.
Format:
S01: [dimension] NN, [dimension] NN, ...
S01 gaps: 1) ... 2) ... 3) ...
Weakest: ...
```

Prompt for video:

```text
You are a strict film editor seeing this video for the first time.
Rate it from 1 to 10. Strong reference films in this style rate about [8.5].
Score separately: first frame, composition, light, color, motion and transitions, pacing,
and sound (write "not reviewed" if you cannot hear it).
List the 5 weakest moments with timecodes, what is wrong and what to change.
```

## Calibration

- Models rate work too high, critics included. **The user's estimate is the truth**: if the critics say 90 and the
  user says "60 to 70%", log an offset of about -25, subtract it from every later median, and report calibrated
  numbers. A new user estimate replaces the offset.
- For video, let one critic also rate a reference blind on the same scale. If the render outscores the reference
  while the user says it is worse, the critics are inflated: raise the bar.
- **Blind pair test:** show a critic the reference and the render unlabelled and ask which one was made in code and
  why. A confident, correct answer names the next focus.

## Measured and eyeballed

Label every number. **Measured** means a command produced it this round (compare.py color deltas, frame time,
seconds per rendered frame, ffprobe of the final file, Lighthouse). **Eyeballed** means a person or a model judged
it, and every critic score is eyeballed. Never report a number nobody measured; write "not measured".
