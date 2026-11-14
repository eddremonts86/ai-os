import { act, render, waitFor } from '@testing-library/react'
import { afterEach, describe, expect, it, vi } from 'vitest'
import { setReducedMotion, showAllInView } from '@/test/browser-mocks'
import { NumberTicker } from '../number-ticker'

function parts(container: HTMLElement) {
  const spans = container.querySelectorAll('span')
  return { screenReader: spans[0], visible: spans[1] }
}

function shown(container: HTMLElement) {
  return Number(parts(container).visible.textContent!.replace(/,/g, ''))
}

afterEach(() => vi.useRealTimers())

describe('NumberTicker markup', () => {
  it('puts the formatted final value in both the screen-reader and the visible span', () => {
    const { container } = render(<NumberTicker value={1250} />)
    const { screenReader, visible } = parts(container)
    expect(screenReader.className).toBe('sr-only')
    expect(screenReader.textContent).toBe('1,250')
    expect(visible.textContent).toBe('1,250')
  })

  it('hides the animated span from assistive technology', () => {
    const { container } = render(<NumberTicker value={7} />)
    expect(parts(container).visible.getAttribute('aria-hidden')).toBe('true')
    expect(parts(container).screenReader.hasAttribute('aria-hidden')).toBe(false)
  })

  it.each([
    [12.5, 2, '12.50'],
    [1234567.891, 1, '1,234,567.9'],
    [3, 0, '3'],
    [0, 0, '0'],
  ])('formats %s with %s decimal places as %s', (value, decimalPlaces, expected) => {
    const { container } = render(<NumberTicker value={value} decimalPlaces={decimalPlaces} />)
    expect(parts(container).screenReader.textContent).toBe(expected)
    expect(parts(container).visible.textContent).toBe(expected)
  })

  it('keeps the base classes, merges a custom class and forwards other props', () => {
    const { container } = render(<NumberTicker value={1} className="text-red-500" data-testid="ticker" title="count" />)
    const { visible } = parts(container)
    expect(visible.className).toContain('inline-block')
    expect(visible.className).toContain('tabular-nums')
    expect(visible.className).toContain('text-red-500')
    expect(visible.getAttribute('data-testid')).toBe('ticker')
    expect(visible.getAttribute('title')).toBe('count')
  })
})

describe('NumberTicker count-up', () => {
  it('leaves the final value in place until the number scrolls into view', () => {
    const { container } = render(<NumberTicker value={100} />)
    expect(parts(container).visible.textContent).toBe('100')
  })

  it('starts at the default startValue of 0 and moves up once in view', async () => {
    const { container } = render(<NumberTicker value={100} />)
    act(() => showAllInView())
    expect(parts(container).visible.textContent).toBe('0')
    await waitFor(() => expect(shown(container)).toBeGreaterThan(0))
  })

  it('starts at a custom startValue and moves toward value', async () => {
    const { container } = render(<NumberTicker value={100} startValue={40} />)
    act(() => showAllInView())
    expect(parts(container).visible.textContent).toBe('40')
    await waitFor(() => expect(shown(container)).toBeGreaterThan(40))
    expect(shown(container)).toBeLessThanOrEqual(100)
  })

  it('starts at value and moves toward startValue when direction is down', async () => {
    const { container } = render(<NumberTicker value={50} startValue={10} direction="down" />)
    act(() => showAllInView())
    expect(parts(container).visible.textContent).toBe('50')
    await waitFor(() => expect(shown(container)).toBeLessThan(50))
    expect(shown(container)).toBeGreaterThanOrEqual(10)
    expect(parts(container).screenReader.textContent).toBe('50')
  })

  it('settles on the final value with the decimals in force when it started, padded to that length', async () => {
    const { container, rerender } = render(<NumberTicker value={2.5} decimalPlaces={0} />)
    rerender(<NumberTicker value={2.5} decimalPlaces={2} />)
    act(() => showAllInView())
    expect(shown(container)).toBe(0)
    await waitFor(() => expect(parts(container).visible.textContent).toBe('2.50'), { timeout: 5000 })
  })

  it('waits for the delay (in seconds) before it starts moving', async () => {
    const { container } = render(<NumberTicker value={100000} delay={0.4} />)
    act(() => showAllInView())
    await new Promise((resolve) => setTimeout(resolve, 150))
    expect(shown(container)).toBe(0)
    await waitFor(() => expect(shown(container)).toBeGreaterThan(0), { timeout: 3000 })
  })

  it('shows the final value immediately when the user prefers reduced motion', async () => {
    setReducedMotion(true)
    const { container } = render(<NumberTicker value={1250} />)
    act(() => showAllInView())
    await new Promise((resolve) => setTimeout(resolve, 50))
    expect(parts(container).visible.textContent).toBe('1,250')
  })

  it('leaves no timer behind when it unmounts while a delayed count-up is pending', () => {
    vi.useFakeTimers({ toFake: ['setTimeout', 'clearTimeout'] })
    const { unmount } = render(<NumberTicker value={100} delay={5} />)
    act(() => showAllInView())
    expect(vi.getTimerCount()).toBe(1)
    unmount()
    expect(vi.getTimerCount()).toBe(0)
  })
})
