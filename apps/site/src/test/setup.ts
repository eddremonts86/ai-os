import { cleanup } from '@testing-library/react'
import { afterEach } from 'vitest'
import { installBrowserMocks, resetBrowserMocks } from './browser-mocks'

installBrowserMocks()

afterEach(() => {
  cleanup()
  resetBrowserMocks()
})
