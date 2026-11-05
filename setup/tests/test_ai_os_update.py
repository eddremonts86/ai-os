"""setup/ai-os-update.py: every pin pattern still finds exactly one version, and pins agree."""

import importlib.util
import re
import unittest
from pathlib import Path

SCRIPT = Path(__file__).resolve().parents[1] / "ai-os-update.py"
spec = importlib.util.spec_from_file_location("ai_os_update", SCRIPT)
update = importlib.util.module_from_spec(spec)
spec.loader.exec_module(update)


class UpdateTests(unittest.TestCase):
    def test_every_pin_matches_once(self):
        for comp in update.COMPONENTS:
            for rel, pattern in comp["pins"]:
                text = (update.ROOT / rel).read_text(encoding="utf-8")
                self.assertEqual(len(re.findall(pattern, text)), 1, f"{comp['id']}: {rel} /{pattern}/")

    def test_pins_of_a_component_agree(self):
        for comp in update.COMPONENTS:
            if comp["pins"]:
                self.assertFalse(str(update.current(comp)).startswith("DRIFT"), comp["id"])

    def test_component_ids_are_unique(self):
        ids = [c["id"] for c in update.COMPONENTS]
        self.assertEqual(len(ids), len(set(ids)))

    def test_setup_scripts_import_without_posix_only_os_functions(self):
        # CI imports these on Windows, where os.getuid/geteuid do not exist.
        import os
        from unittest import mock
        saved = {n: getattr(os, n) for n in ("getuid", "geteuid") if hasattr(os, n)}
        try:
            for n in saved:
                delattr(os, n)
            for name in ("ai-os-update", "ai-os-health", "ai-os-stats", "ai-os-backup"):
                path = Path(__file__).resolve().parents[1] / f"{name}.py"
                s = importlib.util.spec_from_file_location(name.replace("-", "_") + "_winsim", path)
                s.loader.exec_module(importlib.util.module_from_spec(s))
        finally:
            for n, f in saved.items():
                setattr(os, n, f)

    def test_version_ordering(self):
        self.assertGreater(update.vtuple("0.12.1"), update.vtuple("0.8.1"))
        self.assertGreater(update.vtuple("2026.9.22"), update.vtuple("2.3.0"))


if __name__ == "__main__":
    unittest.main()
