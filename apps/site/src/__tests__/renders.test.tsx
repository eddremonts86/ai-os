// Render-count regression checks, from the rerender-hunter audit (2026-11-14): the page must not re-render
// while idle, and the terminal's typing must stop committing once it is done.
import { act, render } from '@/test/render'
import { Profiler, type ProfilerOnRenderCallback } from 'react'
import { afterEach, describe, expect, it, vi } from 'vitest'
import App from '../App'
import { showAllInView } from '@/test/browser-mocks'

afterEach(() => vi.useRealTimers())

function profiled() {
  const commits: { id: string; phase: string }[] = []
  const onRender: ProfilerOnRenderCallback = (id, phase) => commits.push({ id, phase })
  render(
    <Profiler id="app" onRender={onRender}>
      <App />
    </Profiler>,
  )
  act(() => showAllInView()) // jsdom has no layout: put everything in view so the terminal and tickers start
  return commits
}

const advance = async (ms: number) => {
  // Step in small slices so chained timers (each typed character schedules the next) all run.
  for (let t = 0; t < ms; t += 50) await act(async () => { vi.advanceTimersByTime(50) })
}

describe('render counts', () => {
  it('stops committing once the hero terminal has finished, and stays idle', async () => {
    vi.useFakeTimers()
    const commits = profiled()
    await advance(15_000) // the whole typing sequence takes about 3 s
    const settled = commits.length
    await advance(10_000)
    expect(commits.length - settled).toBe(0)
  })

  it('types the hero terminal in a bounded number of commits', async () => {
    vi.useFakeTimers()
    const commits = profiled()
    await advance(15_000)
    // about one commit per typed character plus one per line today (~50); a loop or a per-frame update would
    // blow far past this
    expect(commits.length).toBeGreaterThan(10) // the typing really ran
    expect(commits.length).toBeLessThan(150)
  })
})
