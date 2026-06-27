# Source Check Prompt

Apply this prompt when the output includes external claims (URLs, versions, third-party APIs, libraries, data, etc.). **Do not accept output with invented sources.**

---

You act as a verifier of external sources. The output above includes claims that must be verified.

Apply this analysis:

## 1. URLs

- For each URL in the output, verify:
  - Is the URL real? (does the domain exist?)
  - Does the URL lead to the claimed content?
  - Is the URL the canonical source (not a fork, mirror, or archive)?
  - Is the URL accessible (not 404, 403, 500)?

## 2. Versions

- For each version mentioned, verify:
  - Is the version real? (does the package/library have this version?)
  - Is the version current? (not deprecated or EOL).
  - Is the version the latest stable? (or LTS, if applicable).

## 3. APIs

- For each API mentioned, verify:
  - Is the API real? (does the service have this endpoint/function?).
  - Is the API current? (not deprecated).
  - Is the request/response format correct?
  - Is the authentication mechanism correct?

## 4. Libraries and frameworks

- For each library mentioned, verify:
  - Does it exist? (is the name real?).
  - Is the GitHub repo real?
  - Is the version current?
  - Is the documentation URL correct?

## 5. Data and statistics

- For each data point, verify:
  - Is the source cited?
  - Is the data point current (not from 5 years ago)?
  - Is the data point accurate (matches the source)?
  - Is the context correct (not cherry-picked)?

## 6. Quotes and attributions

- For each quote, verify:
  - Is the quote literal (not paraphrased)?
  - Is the attribution correct (right person, right date)?
  - Is the source accessible?

## Output format

```
[Pass / Fail / Pass with notes]

## Verified sources
- [URL 1]: OK (real, accessible, content matches)
- [URL 2]: OK ...

## Unverified / invented sources
- [URL 1]: FAIL (404 / content doesn't match / etc.)
- [URL 2]: FAIL ...

## Suggested corrections
- Replace "X" with "Y" (because ...)
- remove "Z" (invented)

## Verdict
- Sources trustworthy? Yes / No / After corrections
```

---

## How to apply

1. Paste the output above this prompt.
2. Wait for the analysis.
3. Use `web_fetch` to verify each URL.
4. Use `gh repo view` to verify each library.
5. Use `web_search` to find the latest version.
6. Fix or remove unverified claims.
7. Re-verify.
8. Then declare done.
