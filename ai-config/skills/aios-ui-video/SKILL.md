---
name: aios-ui-video
description: Make a video in code (launch or product video, motion sequence, site hero loop) with Remotion or rendered frames and ffmpeg, matched to reference videos analysed frame by frame. Storyboard, contact sheets, scored critics, approval before the final render, checked file, web delivery. Explicit invocation, /aios-ui-video <what to make> [references].
disable-model-invocation: true
---

# aios-ui-video

Motion that holds up next to its references, rendered from code and checked as a file. The reference loop is
adapted from cook by Leon Lin (MIT, see NOTICE-cook.md).

Needs `ffmpeg` and `ffprobe` (`brew install ffmpeg`, or `EXTRAS=1` in `setup/install-mac.sh`). Check first; say so
and stop if they are missing.

1. **Stack.** React project or React-friendly team: Remotion (frames from React, deterministic by frame number).
   Otherwise render frames from a page or canvas with Playwright and encode with ffmpeg. Ask ui-indexador for
   pieces first (`search_items` with `dep=remotion`, or "kinetic typography", "logo reveal"); read each with
   `npx shadcn@latest view` before installing.
2. **References, frame by frame.** "The text moves like this" is about 1% of what a reference holds.
   - Frames: `ffmpeg -i run/refs/V01.mp4 -vf fps=10 run/refs/V01/f_%04d.png`; around cuts and transitions, every
     frame (`-ss`/`-to`, no fps filter).
   - Rhythm: `ffmpeg -i run/refs/V01.mp4 -vf "fps=2,scale=480:-1,tile=6x5" run/refs/V01_sheet_%02d.png`
   - `run/MOTION.md`, one line per effect: reference, timecode, what moves, easing, duration, direction, why it
     works. Choose a core of about 20 strong effects plus small ones, from many references. Never copy one element
     1:1, never name the source clips in public files.
3. **Storyboard** (`run/SHOTS.md`): scenes with durations and transitions. The first frame is the thumbnail: it must
   work as a still on its own. Best scene first. For social video, a new scene every 6 to 7 seconds, 30 to 60
   seconds, no text on screen unless the brief needs it.
4. **Assets and sound.** Product and launch videos: real product screens, real logos and photos beat drawn SVG
   stand-ins. Sound: code-made only if it truly holds up, otherwise licensed music and effects, credited. If you
   cannot listen, write "sound not reviewed" and check what can be measured: sync with cuts, levels, no clipping.
5. **Rounds.** Render from the frame number, never the clock. Each round: contact sheets
   (`ffmpeg -i out.mp4 -vf "fps=2,scale=480:-1,tile=6x5" sheet_%02d.png`) and short clips of what changed, then
   `aios-ui-review` scored mode with the video prompt (first frame, composition, light, color, motion and
   transitions, pacing, sound), calibrated by the user's estimate. Long or unattended work: `aios-loop` long-run
   mode. Send the sheets every round without waiting.
6. **Final render, only after the user approves the stills or sheets.** Test 3 to 5 seconds at final settings
   first, measure seconds per frame and estimate the full render. Write frames to disk and skip existing ones on
   restart. Encode and mux at the end, for example:
   `ffmpeg -framerate 30 -i frames/%05d.png -i music.wav -c:v libx264 -pix_fmt yuv420p -crf 16 -c:a aac -b:a 320k -shortest -movflags +faststart final.mp4`
7. **Check the file, do not assume:**
   `ffprobe -v error -show_entries stream=codec_type,codec_name,width,height,r_frame_rate:format=duration -of compact final.mp4`
   (resolution, fps, duration, audio stream), export the first frame and look at it, send a contact sheet.
8. **On a web page** (a hero loop on a profile site): H.264 MP4 (plus WebM or AV1 if it is much smaller),
   `muted autoplay loop playsinline` with a `poster`, `preload="none"` below the fold, a size budget (a hero loop
   under about 3 MB), the poster only under `prefers-reduced-motion`, never autoplay with sound, captions for
   speech. Then `/aios-ui-verify` and Lighthouse on the page.
9. **Publishing** is the user's call and needs the brief's permission. Before anything goes public: privacy scan
   (keys, tokens, `.env`, personal paths, emails), credits for music and assets, honest numbers (measured or marked
   as estimates).

## Never

- Start the final render before the user approves.
- Copy a reference element 1:1 or publish third-party clips.
- Report a duration, size or score that no command produced.
