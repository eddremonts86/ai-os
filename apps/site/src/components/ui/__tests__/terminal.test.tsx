import { act, render, screen, waitFor } from '@testing-library/react'
import { afterEach, describe, expect, it, vi } from 'vitest'
import { setReducedMotion, showAllInView } from '@/test/browser-mocks'
import { AnimatedSpan, Terminal, TypingAnimation } from '../terminal'

afterEach(() => {
  vi.restoreAllMocks()
  vi.useRealTimers()
})

const FAKE_TIMERS: { toFake: ('setTimeout' | 'clearTimeout' | 'setInterval' | 'clearInterval')[] } = {
  toFake: ['setTimeout', 'clearTimeout', 'setInterval', 'clearInterval'],
}
const tick = (ms: number) => act(async () => { vi.advanceTimersByTime(ms) })

describe('TypingAnimation', () => {
  it('rejects non-string children', () => {
    vi.spyOn(console, 'error').mockImplementation(() => {})
    expect(() => render(<TypingAnimation>{42 as unknown as string}</TypingAnimation>)).toThrow(/children must be a string/)
  })

  it('types nothing until it scrolls into view', async () => {
    const { container } = render(<TypingAnimation duration={1}>hello</TypingAnimation>)
    await new Promise((resolve) => setTimeout(resolve, 40))
    expect(container.textContent).toBe('')
  })

  it('types the text one character at a time once in view', async () => {
    const { container } = render(<TypingAnimation duration={20}>hello</TypingAnimation>)
    act(() => showAllInView())
    await waitFor(() => expect(container.textContent!.length).toBeGreaterThan(0))
    expect('hello'.startsWith(container.textContent!)).toBe(true)
    await waitFor(() => expect(container.textContent).toBe('hello'))
  })

  it('starts without a viewport trigger when startOnView is false', async () => {
    const { container } = render(<TypingAnimation duration={1} startOnView={false}>go</TypingAnimation>)
    await waitFor(() => expect(container.textContent).toBe('go'))
  })

  it('waits for the delay before typing', async () => {
    const { container } = render(<TypingAnimation duration={1} delay={120} startOnView={false}>go</TypingAnimation>)
    await new Promise((resolve) => setTimeout(resolve, 40))
    expect(container.textContent).toBe('')
    await waitFor(() => expect(container.textContent).toBe('go'))
  })

  it('shows the whole line at once for users who prefer reduced motion', async () => {
    setReducedMotion(true)
    const { container } = render(<TypingAnimation duration={5} startOnView={false}>whole line</TypingAnimation>)
    await waitFor(() => expect(container.textContent).toBe('whole line'), { timeout: 200 })
  })

  it('adds one character per interval, then stops its timer', async () => {
    vi.useFakeTimers(FAKE_TIMERS)
    const { container } = render(<TypingAnimation duration={100} startOnView={false}>abc</TypingAnimation>)
    await tick(0)
    expect(container.textContent).toBe('')
    await tick(100)
    expect(container.textContent).toBe('a')
    await tick(100)
    expect(container.textContent).toBe('ab')
    await tick(100)
    expect(container.textContent).toBe('abc')
    await tick(100)
    expect(container.textContent).toBe('abc')
    expect(vi.getTimerCount()).toBe(0)
  })

  it('clears its own timer when it unmounts before it starts or while it types', async () => {
    vi.useFakeTimers(FAKE_TIMERS)
    const waiting = render(<TypingAnimation duration={100} delay={500} startOnView={false}>abc</TypingAnimation>)
    expect(vi.getTimerCount()).toBeGreaterThan(0)
    waiting.unmount()
    expect(vi.getTimerCount()).toBe(0)

    const typing = render(<TypingAnimation duration={100} startOnView={false}>abc</TypingAnimation>)
    await tick(150)
    expect(vi.getTimerCount()).toBeGreaterThan(0)
    typing.unmount()
    expect(vi.getTimerCount()).toBe(0)
  })

  it('renders as the requested element and merges classes', () => {
    const { container } = render(<TypingAnimation as="h2" className="extra">title</TypingAnimation>)
    const heading = container.querySelector('h2')!
    expect(heading.className).toContain('extra')
    expect(heading.className).toContain('tracking-tight')
  })
})

describe('Terminal', () => {
  it('renders the window chrome and its children inside a code block', () => {
    const { container } = render(
      <Terminal sequence={false}>
        <AnimatedSpan>one</AnimatedSpan>
      </Terminal>,
    )
    expect(container.querySelectorAll('.rounded-full')).toHaveLength(3)
    expect(container.querySelector('pre > code')!.textContent).toBe('one')
  })

  it('merges a custom class into the window', () => {
    const { container } = render(<Terminal className="my-terminal" sequence={false}>x</Terminal>)
    expect((container.firstElementChild as HTMLElement).className).toContain('my-terminal')
  })

  it('shows lines in order: each waits for the previous one to finish', async () => {
    render(
      <Terminal>
        <TypingAnimation duration={5}>$ run</TypingAnimation>
        <AnimatedSpan>first</AnimatedSpan>
        <AnimatedSpan>second</AnimatedSpan>
      </Terminal>,
    )
    const opacity = (text: string) => screen.getByText(text).style.opacity
    expect(opacity('first')).toBe('0')
    expect(opacity('second')).toBe('0')

    act(() => showAllInView())
    await waitFor(() => expect(opacity('first')).toBe('1'), { timeout: 4000 })
    await waitFor(() => expect(opacity('second')).toBe('1'), { timeout: 4000 })
    expect(screen.getByText('$ run')).toBeTruthy()
  })

  it('does not start the sequence until the terminal is in view', async () => {
    render(
      <Terminal>
        <AnimatedSpan>only line</AnimatedSpan>
      </Terminal>,
    )
    await new Promise((resolve) => setTimeout(resolve, 80))
    expect(screen.getByText('only line').style.opacity).toBe('0')
  })

  it('starts a typing line only after the line before it has finished', async () => {
    vi.useFakeTimers(FAKE_TIMERS)
    render(
      <Terminal>
        <TypingAnimation duration={100}>ab</TypingAnimation>
        <TypingAnimation duration={100}>cd</TypingAnimation>
      </Terminal>,
    )
    const [first, second] = Array.from(document.querySelectorAll('code > *'))
    act(() => showAllInView())
    await tick(100)
    expect([first.textContent, second.textContent]).toEqual(['a', ''])
    await tick(100)
    expect([first.textContent, second.textContent]).toEqual(['ab', ''])
    await tick(100)
    await tick(100)
    expect([first.textContent, second.textContent]).toEqual(['ab', 'c'])
    await tick(100)
    expect([first.textContent, second.textContent]).toEqual(['ab', 'cd'])
  })

  it('animates a line in only after the line before it has finished', async () => {
    render(
      <Terminal>
        <TypingAnimation duration={5}>$</TypingAnimation>
        <AnimatedSpan>first</AnimatedSpan>
        <AnimatedSpan>second</AnimatedSpan>
      </Terminal>,
    )
    act(() => showAllInView())
    const first = screen.getByText('first')
    const second = screen.getByText('second')
    await waitFor(() => expect(Number(first.style.opacity)).toBeGreaterThan(0), { timeout: 4000 })
    expect(Number(first.style.opacity)).toBeLessThan(1)
    expect(Number(second.style.opacity)).toBe(0)
  })

  it('waits for the delay (in milliseconds) when a line is used on its own', async () => {
    render(<AnimatedSpan delay={300}>late</AnimatedSpan>)
    const line = screen.getByText('late')
    await new Promise((resolve) => setTimeout(resolve, 100))
    expect(line.style.opacity).toBe('0')
    await waitFor(() => expect(line.style.opacity).toBe('1'), { timeout: 4000 })
  })

  it('shows every line straight away when not sequenced', async () => {
    render(
      <Terminal sequence={false}>
        <AnimatedSpan>a</AnimatedSpan>
        <AnimatedSpan>b</AnimatedSpan>
      </Terminal>,
    )
    await waitFor(() => expect(screen.getByText('a').style.opacity).toBe('1'), { timeout: 4000 })
    await waitFor(() => expect(screen.getByText('b').style.opacity).toBe('1'), { timeout: 4000 })
  })
})
