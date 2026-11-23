import { useLayoutEffect, useRef, useState } from 'react'
// Each part from its own module, not ./kit's index or stageshow.css: those pull every part's CSS and the brand registry
import type { Act } from './kit/act'
import { Badge } from './kit/controls/Badge'
import { Collapse } from './kit/motion/Collapse'
import { Check } from './kit/parts/Check'
import { Spinner } from './kit/parts/Spinner'
import { Stage } from './kit/stage'
import { Caret, Prompt, Text, Window } from './kit/window'
import stats from '../stats.json'
import './install.css'

// Built with the Stageshow skill (ai-config/skills/stageshow, MIT, Benji Taylor) from its
// dark-hero gold; filmed with its --gate at 1280 and 390 wide (REHEARSAL.md).
//
// AI-OS landing hero: one command boots the whole AI setup. Beats: the
// command is typed at a terminal that already holds an earlier run; the
// installer's lines arrive and scroll the screen; each CLI on the card is
// linked in turn; the card's status turns Ready on the same pill, the one
// lit color. The page plays it once and holds Ready.
//
// Real strings: the command, the installer's steps with their counts
// (stats.json), the six CLIs and Ready. Only the earlier run above the
// command is placeholder bars.

const COMMAND = 'npx @edd_remonts/create-ai-os'
const CLIS = ['Claude Code', 'Codex', 'Gemini', 'Antigravity', 'MiniMax', 'Hermes']
const SKILLS = stats.skills_linked
// The installer's steps (setup/install-mac.sh) as it reports them; counts come from stats.json
const STEPS: [string, string][] = [
  ['prerequisites', 'brew · node · git'],
  ['brew', `${stats.brew_total} packages`],
  ['python', `${stats.pip_packages} packages`],
  ['skills', `${SKILLS} → ${CLIS.length} CLIs`],
  ['agents', `${stats.agents} distributed`],
  ['mcp', `${stats.mcp_enabled} servers`],
  ['memory', 'FalkorDB · Ollama'],
  ['verify', `${stats.verify_sections} checks passed`],
]
// Steps 4 to 8 reach the CLIs: the card ticks them as those arrive
const linkedAt = (i: number) => Math.max(0, Math.round(((i - 3) * CLIS.length) / (STEPS.length - 3)))
// An earlier run fills the screen (its last line is verify, right above the new prompt); this run is short enough that its command stays in view at the end
const HISTORY = Array.from({ length: 11 })

type S = { cmd: string; out: number; next: boolean; linked: number; ready: boolean; card: boolean }
const initial: S = { cmd: '', out: 0, next: false, linked: 0, ready: false, card: true }
const POSTER: S = { cmd: COMMAND, out: STEPS.length, next: false, linked: CLIS.length, ready: true, card: true }

async function script(a: Act<S>) {
  await a.wait(300)
  a.mark('type')
  await a.type('cmd', COMMAND, { interval: 18 })
  await a.wait(300)
  // The installer's output scrolls the screen and links the CLIs one by one
  for (let i = 1; i <= STEPS.length; i++) {
    const linked = linkedAt(i)
    a.mark(`line-${i}`)
    a.put({ out: i, linked })
    await a.wait(260)
  }
  a.mark('ready')
  a.put({ ready: true })
  // Played once, it keeps the result: the landing stays idle once it settles
  // (src/__tests__/renders.test.tsx). The rehearsed loop seam is in REHEARSAL.md.
}

export default function InstallDemo() {
  return (
    <Stage<S> play="once" width={600} height={380} compact={{ below: 480, width: 358, height: 340 }} theme="dark" initial={initial} poster={POSTER} script={script} className="ai">
      {(s, _rect, layout) => (
        <>
          <Window chrome="terminal" lights="grey" title="ai-os — zsh" className="ai-term">
            <div className="ss-term ai-screen">
              {/* An earlier run, shaped like this one's output */}
              {HISTORY.map((_, i) => <Ghost key={`h${i}`} step={STEPS[(i + STEPS.length * 2 - HISTORY.length) % STEPS.length]!} />)}
              <Prompt path="~" className="ai-prompt">
                {s.cmd}
                {s.out === 0 && <Caret still={s.cmd.length > 0 && s.cmd.length < COMMAND.length} />}
              </Prompt>
              {/* Narrow, the card sits over the foot of the screen: the first three steps are left out so the rest end above it */}
              {STEPS.map(([name, detail], i) => layout === 'compact' && i < 3 ? null : (
                <Collapse key={name} open={i < s.out}>
                  <Line name={name} detail={detail} />
                </Collapse>
              ))}
              <Collapse open={s.next}>
                <Prompt path="~" className="ai-prompt"><Caret /></Prompt>
              </Collapse>
            </div>
          </Window>

          <section className="ai-card" data-on={s.card || undefined}>
            <div className="ai-head">
              <span className="ai-count">
                {SKILLS}
                <span className="ai-unit">skills</span>
              </span>
              <Badge tone={s.ready ? 'success' : 'neutral'} className="ai-badge" icon={<Mark ready={s.ready} />}>
                <Label ready={s.ready} />
              </Badge>
            </div>
            <ul className="ai-list">
              {CLIS.map((name, i) => (
                <li key={name} className="ai-row">
                  <Text className="ai-name">{name}</Text>
                  <Check on={i < s.linked} size={14} />
                </li>
              ))}
            </ul>
          </section>
        </>
      )}
    </Stage>
  )
}

function Line({ name, detail }: { name: string; detail: string }) {
  return (
    <div className="ai-line">
      <span className="ok">✓</span>
      <span className="ai-step">{name}</span>
      <span className="ai-detail">{detail}</span>
    </div>
  )
}

// The earlier run, scrolled up behind the fade: the same steps, dimmed
function Ghost({ step }: { step: [string, string] }) {
  return (
    <div className="ai-line ai-ghost">
      <span className="ok">✓</span>
      <span className="ai-step">{step[0]}</span>
      <span className="ai-detail">{step[1]}</span>
    </div>
  )
}

function Mark({ ready }: { ready: boolean }) {
  return (
    <span className="ai-mark" data-ready={ready || undefined}>
      <Spinner size={8} />
      <i className="ai-dot" />
    </span>
  )
}

// From dark-hero: the words stack in one cell whose width eases to the word
// showing; getting shorter, the old word fades before the edge reaches it
function Label({ ready }: { ready: boolean }) {
  const words = useRef<HTMLSpanElement[]>([])
  const [w, setW] = useState<number[]>([])
  useLayoutEffect(() => {
    const measure = () => setW(words.current.map((e) => e.offsetWidth))
    measure()
    // Again once the page font has loaded, or the pill keeps the fallback font's widths
    let live = true
    document.fonts?.ready.then(() => { if (live) measure() })
    return () => { live = false }
  }, [])
  const on = ready ? 1 : 0
  const shrink = w.length === 2 && w[on]! < w[1 - on]!
  return (
    <span className="ai-label" data-shrink={shrink || undefined} style={w.length ? { width: w[on] } : undefined}>
      {['Linking', 'Ready'].map((t, i) => (
        <span key={t} ref={(e) => { if (e) words.current[i] = e }} className="ai-word" data-on={i === on || undefined}>{t}</span>
      ))}
    </span>
  )
}
