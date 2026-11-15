import { act, render, waitFor } from '@/test/render'
import { useRef } from 'react'
import { afterEach, beforeEach, describe, expect, it, vi } from 'vitest'
import { FakeResizeObserver, setReducedMotion } from '@/test/browser-mocks'
import { AnimatedBeam, type AnimatedBeamProps } from '../animated-beam'

type Rect = { left: number; top: number; width: number; height: number }

const CONTAINER: Rect = { left: 100, top: 50, width: 400, height: 300 }
const FROM: Rect = { left: 120, top: 70, width: 20, height: 20 }
const TO: Rect = { left: 380, top: 290, width: 20, height: 20 }

const rects = new Map<Element, Rect>()

beforeEach(() => {
  rects.clear()
  vi.spyOn(Element.prototype, 'getBoundingClientRect').mockImplementation(function (this: Element) {
    const { left, top, width, height } = rects.get(this) ?? { left: 0, top: 0, width: 0, height: 0 }
    return { left, top, width, height, right: left + width, bottom: top + height, x: left, y: top, toJSON: () => ({}) }
  })
})

afterEach(() => vi.restoreAllMocks())

type Missing = 'container' | 'from' | 'to'

/** Leaves one ref unattached to mimic an element that has not mounted yet. */
function Harness({ missing, ...props }: Partial<AnimatedBeamProps> & { missing?: Missing }) {
  const container = useRef<HTMLDivElement>(null)
  const from = useRef<HTMLDivElement>(null)
  const to = useRef<HTMLDivElement>(null)
  return (
    <div
      ref={(el) => {
        if (missing !== 'container') container.current = el
        if (el) rects.set(el, CONTAINER)
      }}
    >
      <div ref={(el) => { if (missing !== 'from') from.current = el; if (el) rects.set(el, FROM) }} />
      <div ref={(el) => { if (missing !== 'to') to.current = el; if (el) rects.set(el, TO) }} />
      <AnimatedBeam containerRef={container} fromRef={from} toRef={to} {...props} />
    </div>
  )
}

const svgOf = (container: HTMLElement) => container.querySelector('svg')!
const pathsOf = (container: HTMLElement) => [...container.querySelectorAll('svg > path')]

describe('AnimatedBeam geometry', () => {
  it('draws a straight-control curve between the centres of the two elements, relative to the container', () => {
    const { container } = render(<Harness />)
    expect(pathsOf(container)[0].getAttribute('d')).toBe('M 30,30 Q 160,30 290,250')
  })

  it('lifts the control point by the curvature', () => {
    const { container } = render(<Harness curvature={40} />)
    expect(pathsOf(container)[0].getAttribute('d')).toBe('M 30,30 Q 160,-10 290,250')
  })

  it('applies start and end offsets to the matching axis of the matching end', () => {
    const { container } = render(<Harness startXOffset={5} startYOffset={7} endXOffset={11} endYOffset={13} />)
    expect(pathsOf(container)[0].getAttribute('d')).toBe('M 35,37 Q 168,37 301,263')
  })

  it('sizes the svg to the container', () => {
    const { container } = render(<Harness />)
    const svg = svgOf(container)
    expect(svg.getAttribute('width')).toBe('400')
    expect(svg.getAttribute('height')).toBe('300')
    expect(svg.getAttribute('viewBox')).toBe('0 0 400 300')
  })

  it('recomputes the path when the container is resized', () => {
    const { container } = render(<Harness />)
    rects.forEach((_rect, el) => {
      if (el === container.firstElementChild) rects.set(el, { ...CONTAINER, left: 0, top: 0, width: 800, height: 600 })
    })
    act(() => FakeResizeObserver.instances.forEach((observer) => observer.fire()))
    expect(svgOf(container).getAttribute('width')).toBe('800')
    expect(svgOf(container).getAttribute('viewBox')).toBe('0 0 800 600')
  })

  it.each(['container', 'from', 'to'] as const)('draws nothing until the %s element is mounted', (missing) => {
    const { container } = render(<Harness missing={missing} />)
    expect(pathsOf(container)[0].getAttribute('d')).toBe('')
    expect(svgOf(container).getAttribute('width')).toBe('0')
  })

  it('does not observe a container that is not mounted', () => {
    render(<Harness missing="container" />)
    expect(FakeResizeObserver.instances[0].observed).toEqual([])
  })

  it('recomputes the path when its geometry props change', () => {
    const { container, rerender } = render(<Harness curvature={0} />)
    expect(pathsOf(container)[0].getAttribute('d')).toBe('M 30,30 Q 160,30 290,250')
    rerender(<Harness curvature={40} />)
    expect(pathsOf(container)[0].getAttribute('d')).toBe('M 30,30 Q 160,-10 290,250')
    rerender(<Harness curvature={40} endYOffset={10} />)
    expect(pathsOf(container)[0].getAttribute('d')).toBe('M 30,30 Q 160,-10 290,260')
  })

  it('observes the container and disconnects on unmount', () => {
    const { container, unmount } = render(<Harness />)
    const observer = FakeResizeObserver.instances[0]
    expect(observer.observed).toEqual([container.firstElementChild])
    expect(observer.disconnected).toBe(false)
    unmount()
    expect(observer.disconnected).toBe(true)
  })
})

describe('AnimatedBeam styling', () => {
  it('uses the path color, width and opacity props on the base path', () => {
    const { container } = render(<Harness pathColor="red" pathWidth={4} pathOpacity={0.5} />)
    const base = pathsOf(container)[0]
    expect(base.getAttribute('stroke')).toBe('red')
    expect(base.getAttribute('stroke-width')).toBe('4')
    expect(base.getAttribute('stroke-opacity')).toBe('0.5')
  })

  it('merges a custom class into the svg and stays non-interactive', () => {
    const { container } = render(<Harness className="custom" />)
    expect(svgOf(container).getAttribute('class')).toContain('custom')
    expect(svgOf(container).getAttribute('class')).toContain('pointer-events-none')
  })

  it('without packets draws a gradient-stroked path wired to its own gradient', () => {
    const { container } = render(<Harness />)
    const [, gradientPath] = pathsOf(container)
    const gradient = container.querySelector('linearGradient')!
    expect(gradient.id).not.toBe('')
    expect(gradientPath.getAttribute('stroke')).toBe(`url(#${gradient.id})`)
  })

  it('applies the gradient colours to the gradient stops', () => {
    const { container } = render(<Harness gradientStartColor="#111111" gradientStopColor="#222222" />)
    const colors = [...container.querySelectorAll('stop')].map((stop) => stop.getAttribute('stop-color'))
    expect(colors).toEqual(['#111111', '#111111', '#222222', '#222222'])
  })
})

describe('AnimatedBeam gradient sweep', () => {
  const sweepStart = async (container: HTMLElement) => {
    const gradient = container.querySelector('linearGradient')!
    await waitFor(() => expect(gradient.getAttribute('x1')).not.toBe('0%'))
    return parseFloat(gradient.getAttribute('x1')!)
  }

  it('sweeps left to right by default', async () => {
    const { container } = render(<Harness />)
    expect(await sweepStart(container)).toBeLessThan(50)
  })

  it('sweeps right to left when reversed', async () => {
    const { container } = render(<Harness reverse />)
    expect(await sweepStart(container)).toBeGreaterThan(50)
  })
})

describe('AnimatedBeam packets', () => {
  const packets = [
    { color: '#b3ee55', delay: 0, duration: 2 },
    { color: '#3bdfef', reverse: true },
  ]

  it('draws one travelling dash per packet instead of the gradient path', () => {
    const { container } = render(<Harness packets={packets} />)
    const paths = pathsOf(container)
    expect(paths).toHaveLength(3)
    expect(paths.slice(1).map((path) => path.getAttribute('stroke'))).toEqual(['#b3ee55', '#3bdfef'])
    expect(paths.some((path) => path.getAttribute('stroke')?.startsWith('url('))).toBe(false)
  })

  it('draws each packet one pixel thicker than the base path', () => {
    const { container } = render(<Harness packets={packets} pathWidth={3} />)
    expect(pathsOf(container)[1].getAttribute('stroke-width')).toBe('4')
  })

  it('starts a forward packet at the head of the path and a reverse one at the tail', () => {
    const { container } = render(<Harness packets={[{ color: 'red' }, { color: 'blue', reverse: true }]} />)
    const [, forward, reverse] = pathsOf(container)
    expect(forward.getAttribute('stroke-dashoffset')).toBe('0.1')
    expect(reverse.getAttribute('stroke-dashoffset')).toBe('-1')
    expect(forward.getAttribute('stroke-dasharray')).toBe('0.1 1')
  })

  it('gives every packet a glow in its own colour', () => {
    const { container } = render(<Harness packets={[{ color: 'rgb(255, 0, 0)' }]} />)
    expect(pathsOf(container)[1].getAttribute('style')).toContain('drop-shadow(rgb(255, 0, 0) 0px 0px 4px)')
  })

  it('omits the travelling dashes when the user prefers reduced motion', () => {
    setReducedMotion(true)
    const { container } = render(<Harness packets={packets} />)
    expect(pathsOf(container)).toHaveLength(1)
  })
})
