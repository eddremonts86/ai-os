"""AI-OS build-time patches (2026-07-13) for graphiti-core, to make MiniMax's
OpenAI-compatible endpoint work reliably as a Graphiti LLM provider.

graphiti-core is pulled from PyPI by mcp_server's own pyproject.toml (pinned
to 0.29.2 — 0.29.1 predates `_strip_code_fences` entirely and cannot be
patched by this script). It is NOT part of this monorepo checkout, so these
patches run against the installed .venv copy at Docker build time (see
Dockerfile.standalone.minimal). Each patch is idempotent: it raises loudly if
its expected source snippet is missing (e.g. after a graphiti-core version
bump) instead of silently no-op'ing.

Three independent issues, three patches, both in
graphiti_core/llm_client/{openai_generic_client,client}.py:

1. THINK-TAG STRIPPING (openai_generic_client.py::_strip_code_fences)
   Reasoning models served through MiniMax (MiniMax-M2, MiniMax-M3) always
   prepend a `<think>...</think>` block to `message.content`, even when a
   JSON response_format is requested (confirmed via raw curl:
   `usage.reasoning_tokens` is present and the block appears regardless of
   response_format type). The stock method only strips ```json fences, so
   `json.loads()` failed with `Expecting value: line 1 column 1 (char 0)`
   because the payload starts with `<think>` rather than `{`.

2. RAW_DECODE FOR TRAILING DATA (openai_generic_client.py::_generate_response)
   With `structured_output_mode='json_object'` (forced for non-OpenAI
   providers by mcp_server's factories.py — see config.yaml's STATUS note),
   MiniMax is not always disciplined about emitting *only* the JSON object.
   It reliably reproduced `json.JSONDecodeError: Extra data` at a
   near-identical byte offset across repeated calls — i.e. a complete, valid
   JSON object followed by trailing content the schema-in-prompt approach
   doesn't fully suppress. Switched parsing to
   `json.JSONDecoder().raw_decode`, which parses only the first complete
   JSON value and ignores anything after it (a no-op when there is no
   trailing data — safe for OpenAI/Ollama/other providers too).

3. RETRY ON VALIDATION ERROR (client.py::is_server_or_retry_error)
   Separately from malformed JSON, MiniMax sometimes returns *valid* JSON
   that is actually the injected schema echoed back verbatim (e.g.
   `{"$defs": {...}, "type": "object"}`) instead of an actual data instance
   — this raises a pydantic `ValidationError`, not a `JSONDecodeError`, so the
   stock retry predicate (which only covers RateLimitError/EmptyResponseError
   /JSONDecodeError) does not retry it and the episode fails outright.
   Empirically, a plain retry almost always succeeds on the next attempt, so
   ValidationError is added to the same transient-error retry bucket.
"""

import pathlib
import re
import sys

OPENAI_GENERIC_CLIENT = pathlib.Path(
    '.venv/lib/python3.11/site-packages/graphiti_core/llm_client/openai_generic_client.py'
)
CLIENT = pathlib.Path('.venv/lib/python3.11/site-packages/graphiti_core/llm_client/client.py')

THINK_OLD = """        stripped = text.strip()
        if stripped.startswith('```'):"""

THINK_NEW = """        stripped = text.strip()
        # AI-OS patch: strip a leading <think>...</think> reasoning block (MiniMax-M2/M3
        # and other reasoning models emit this even when JSON output is requested).
        stripped = re.sub(r'<think>.*?</think>', '', stripped, flags=re.DOTALL).strip()
        if stripped.startswith('```'):"""

EXTRA_DATA_OLD = """            # Many OpenAI-compatible/local models wrap JSON in a ```json fence even under a
            # structured response_format; strip it before parsing.
            return json.loads(self._strip_code_fences(result))"""

EXTRA_DATA_NEW = """            # Many OpenAI-compatible/local models wrap JSON in a ```json fence even under a
            # structured response_format; strip it before parsing.
            # AI-OS patch: use raw_decode instead of loads — MiniMax in json_object mode
            # reliably appends trailing content after an otherwise-complete JSON object,
            # which loads() rejects as "Extra data". raw_decode parses only the first
            # complete value and ignores the rest (a no-op when there is no trailing data).
            cleaned = self._strip_code_fences(result)
            return json.JSONDecoder().raw_decode(cleaned)[0]"""

RETRY_IMPORT_OLD = """import httpx
from pydantic import BaseModel
from tenacity import retry, retry_if_exception, stop_after_attempt, wait_random_exponential"""

RETRY_IMPORT_NEW = """import httpx
from pydantic import BaseModel, ValidationError
from tenacity import retry, retry_if_exception, stop_after_attempt, wait_random_exponential"""

RETRY_CHECK_OLD = """    if isinstance(exception, RateLimitError | EmptyResponseError | json.decoder.JSONDecodeError):
        return True"""

RETRY_CHECK_NEW = """    # AI-OS patch: also retry on pydantic ValidationError. MiniMax's forced json_object
    # mode (see openai_generic_client.py's raw_decode patch) sometimes echoes the injected
    # JSON *schema* back instead of an actual data instance — valid JSON, wrong shape, so it
    # raises ValidationError rather than JSONDecodeError. A retry almost always succeeds
    # (confirmed empirically), so it gets the same transient-error treatment.
    if isinstance(
        exception, RateLimitError | EmptyResponseError | json.decoder.JSONDecodeError | ValidationError
    ):
        return True"""


def _apply(path: pathlib.Path, src: str, old: str, new: str, label: str) -> str:
    if old not in src:
        print(
            f'AI-OS patch FAILED ({label}): expected snippet not found in {path} '
            '(graphiti-core version likely changed — update this patch)\n'
            f'--- first 2000 chars of file ---\n{src[:2000]!r}',
            file=sys.stderr,
        )
        raise SystemExit(1)
    return src.replace(old, new, 1)


def main() -> int:
    src = OPENAI_GENERIC_CLIENT.read_text()
    src = _apply(OPENAI_GENERIC_CLIENT, src, THINK_OLD, THINK_NEW, 'think-tag stripping')
    src = _apply(OPENAI_GENERIC_CLIENT, src, EXTRA_DATA_OLD, EXTRA_DATA_NEW, 'raw_decode for trailing data')
    OPENAI_GENERIC_CLIENT.write_text(src)
    print(f'AI-OS patch applied: think-tag stripping + raw_decode parsing in {OPENAI_GENERIC_CLIENT}')

    src = CLIENT.read_text()
    src = _apply(CLIENT, src, RETRY_IMPORT_OLD, RETRY_IMPORT_NEW, 'ValidationError import')
    src = _apply(CLIENT, src, RETRY_CHECK_OLD, RETRY_CHECK_NEW, 'retry on ValidationError')
    CLIENT.write_text(src)
    print(f'AI-OS patch applied: retry on ValidationError in {CLIENT}')
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
