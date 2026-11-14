import { afterEach, describe, expect, it, vi } from 'vitest'

afterEach(() => {
  document.body.innerHTML = ''
  vi.resetModules()
})

describe('entry point', () => {
  it('mounts the landing page into #root', async () => {
    document.body.innerHTML = '<div id="root"></div>'
    await import('../main')
    const root = document.getElementById('root')!
    await vi.waitFor(() => expect(root.querySelector('h1')).toBeTruthy())
    expect(root.querySelector('h1')!.textContent).toContain('operating system')
  })
})
