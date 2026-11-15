import { act, fireEvent, render, screen } from '@/test/render'
import { afterEach, beforeEach, describe, expect, it, vi } from 'vitest'
import { createAiOsPackage } from '@/test/repo'
import App from '../App'
import stats from '../stats.json'

const COMMAND = `npx ${createAiOsPackage.name}`
const REPO = 'https://github.com/eddremonts86/ai-os'

afterEach(() => {
  vi.restoreAllMocks()
  vi.useRealTimers()
})

describe('App page structure', () => {
  it('renders without React warnings or errors', () => {
    const error = vi.spyOn(console, 'error').mockImplementation(() => {})
    const warn = vi.spyOn(console, 'warn').mockImplementation(() => {})
    render(<App />)
    expect(error).not.toHaveBeenCalled()
    expect(warn).not.toHaveBeenCalled()
  })

  it('has one h1, one header, one main and one footer', () => {
    render(<App />)
    expect(screen.getAllByRole('heading', { level: 1 })).toHaveLength(1)
    expect(screen.getAllByRole('banner')).toHaveLength(1)
    expect(screen.getAllByRole('main')).toHaveLength(1)
    expect(screen.getAllByRole('contentinfo')).toHaveLength(1)
    expect(screen.getByRole('heading', { level: 1 }).textContent).toBe('Your AI setup, booted like an operating system.')
  })

  it('gives every section heading a level of 2 and keeps h3s inside sections', () => {
    const { container } = render(<App />)
    expect(container.querySelectorAll('main section > h2').length).toBeGreaterThanOrEqual(7)
    container.querySelectorAll('h3').forEach((h3) => expect(h3.closest('section')).toBeTruthy())
  })

  it('points every in-page anchor at an element that exists', () => {
    const { container } = render(<App />)
    const anchors = [...container.querySelectorAll('a[href^="#"]')].map((a) => a.getAttribute('href')!)
    expect(anchors).toEqual(expect.arrayContaining(['#top', '#install']))
    anchors.forEach((href) => expect(container.querySelector(href), href).toBeTruthy())
  })

  it('gives every image alt text and a size', () => {
    const { container } = render(<App />)
    container.querySelectorAll('img').forEach((img) => {
      expect(img.getAttribute('alt')).toBeTruthy()
      expect(img.getAttribute('width')).toBeTruthy()
      expect(img.getAttribute('height')).toBeTruthy()
    })
  })

  it('opens every new-tab link with rel="noopener"', () => {
    const { container } = render(<App />)
    container.querySelectorAll('a[target="_blank"]').forEach((a) => expect(a.getAttribute('rel')).toContain('noopener'))
  })

  it('links the GitHub button in the header to the repository', () => {
    render(<App />)
    const header = screen.getByRole('banner')
    expect(header.querySelector(`a[href="${REPO}"]`)!.textContent).toBe('GitHub')
  })
})

describe('App hero', () => {
  it('quotes the published skill and MCP counts', () => {
    render(<App />)
    expect(screen.getByText(new RegExp(`${stats.skills_linked} skills and ${stats.mcp_enabled} MCP servers across six AI CLIs`))).toBeTruthy()
  })

  it('lists the install log with the same counts', () => {
    const { container } = render(<App />)
    const log = container.querySelector('pre')!.textContent!
    expect(log).toContain(`✓ ${stats.brew_core} brew packages`)
    expect(log).toContain(`✓ ${stats.skills_linked} skills`)
    expect(log).toContain(`✓ ${stats.agents} agents`)
    expect(log).toContain(`✓ ${stats.mcp_enabled} MCP servers generated`)
    expect(log).toContain('ready.')
  })

  it('shows the bootstrap command that matches the published package', () => {
    render(<App />)
    expect(screen.getByRole('button', { name: new RegExp(COMMAND) })).toBeTruthy()
  })
})

describe('Copy command button', () => {
  let writeText: ReturnType<typeof vi.fn>

  beforeEach(() => {
    writeText = vi.fn().mockResolvedValue(undefined)
    Object.defineProperty(navigator, 'clipboard', { configurable: true, value: { writeText } })
  })

  const button = () => screen.getByRole('button', { name: new RegExp(COMMAND) })

  it('copies the command, announces it, then goes back to idle', async () => {
    vi.useFakeTimers({ toFake: ['setTimeout', 'clearTimeout'] })
    render(<App />)
    await act(async () => { fireEvent.click(button()) })
    expect(writeText).toHaveBeenCalledExactlyOnceWith(COMMAND)
    expect(button().querySelector('[aria-live="polite"]')!.textContent).toBe('Copied')

    await act(async () => { vi.advanceTimersByTime(1999) })
    expect(button().querySelector('[aria-live="polite"]')!.textContent).toBe('Copied')
    await act(async () => { vi.advanceTimersByTime(1) })
    expect(button().querySelector('[aria-live="polite"]')!.textContent).toBe('')
  })

  it('stays quiet and usable when the clipboard is unavailable', async () => {
    writeText.mockRejectedValue(new Error('insecure context'))
    render(<App />)
    await act(async () => { fireEvent.click(button()) })
    expect(button().querySelector('[aria-live="polite"]')!.textContent).toBe('')
    expect(button().textContent).toContain(COMMAND)
  })

  it('does not announce anything before it is used', () => {
    render(<App />)
    expect(button().querySelector('[aria-live="polite"]')!.textContent).toBe('')
  })
})
