// jsdom has no layout, observers or media queries; these doubles give tests control over them.

type Listener = () => void

class FakeMediaQueryList {
  matches = false
  private listeners = new Set<Listener>()
  addEventListener(_type: string, listener: Listener) {
    this.listeners.add(listener)
  }
  removeEventListener(_type: string, listener: Listener) {
    this.listeners.delete(listener)
  }
  set(matches: boolean) {
    this.matches = matches
    this.listeners.forEach((listener) => listener())
  }
}

const reducedMotionQuery = new FakeMediaQueryList()

export function setReducedMotion(reduce: boolean) {
  reducedMotionQuery.set(reduce)
}

export class FakeIntersectionObserver {
  static instances: FakeIntersectionObserver[] = []
  private targets = new Set<Element>()
  private callback: (entries: Partial<IntersectionObserverEntry>[], observer: unknown) => void
  constructor(callback: (entries: Partial<IntersectionObserverEntry>[], observer: unknown) => void) {
    this.callback = callback
    FakeIntersectionObserver.instances.push(this)
  }
  observe(target: Element) {
    this.targets.add(target)
  }
  unobserve(target: Element) {
    this.targets.delete(target)
  }
  disconnect() {
    this.targets.clear()
  }
  trigger(isIntersecting: boolean) {
    // A real observer never reports an empty batch (a disconnected one is silent)
    if (!this.targets.size) return
    this.callback([...this.targets].map((target) => ({ target, isIntersecting })), this)
  }
}

/** Reports every observed element as visible, the way a real viewport would after scrolling to it. */
export function showAllInView() {
  FakeIntersectionObserver.instances.forEach((observer) => observer.trigger(true))
}

export class FakeResizeObserver {
  static instances: FakeResizeObserver[] = []
  observed: Element[] = []
  disconnected = false
  private callback: () => void
  constructor(callback: () => void) {
    this.callback = callback
    FakeResizeObserver.instances.push(this)
  }
  observe(target: Element) {
    this.observed.push(target)
  }
  unobserve() {}
  disconnect() {
    this.disconnected = true
  }
  fire() {
    this.callback()
  }
}

export function installBrowserMocks() {
  Object.defineProperty(window, 'matchMedia', {
    configurable: true,
    value: (query: string) => (query.includes('prefers-reduced-motion') ? reducedMotionQuery : new FakeMediaQueryList()),
  })
  Object.defineProperty(globalThis, 'IntersectionObserver', { configurable: true, value: FakeIntersectionObserver })
  Object.defineProperty(globalThis, 'ResizeObserver', { configurable: true, value: FakeResizeObserver })
}

export function resetBrowserMocks() {
  setReducedMotion(false)
  FakeIntersectionObserver.instances = []
  FakeResizeObserver.instances = []
}
