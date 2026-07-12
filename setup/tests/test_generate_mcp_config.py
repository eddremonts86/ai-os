import contextlib
import importlib.util
import io
import json
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path
from unittest.mock import patch


REPO_ROOT = Path(__file__).resolve().parents[2]
GENERATOR_PATH = REPO_ROOT / "setup" / "generate-mcp-config.py"


class JsonYaml:
    """Small test double for PyYAML using JSON, which is valid YAML."""

    @staticmethod
    def safe_load(stream):
        return json.load(stream)

    @staticmethod
    def safe_dump(data, default_flow_style=False, sort_keys=False):
        return json.dumps(data, indent=2) + "\n"


def load_generator():
    spec = importlib.util.spec_from_file_location("generate_mcp_config", GENERATOR_PATH)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


class GenerateMcpConfigTests(unittest.TestCase):
    def setUp(self):
        self.generator = load_generator()
        self.temp_dir = tempfile.TemporaryDirectory()
        self.root = Path(self.temp_dir.name)
        self.mcp_dir = self.root / "mcp"
        self.mcp_dir.mkdir()
        self.config_path = self.root / "hermes" / "config.yaml"

    def tearDown(self):
        self.temp_dir.cleanup()

    def write_definition(self, filename, definition):
        (self.mcp_dir / filename).write_text(json.dumps(definition), encoding="utf-8")

    def run_generator(self, external_skills_dir=None):
        argv = [str(GENERATOR_PATH), str(self.mcp_dir), str(self.config_path)]
        if external_skills_dir is not None:
            argv.append(external_skills_dir)
        output = io.StringIO()
        with patch.object(self.generator, "yaml", JsonYaml), patch.object(
            sys, "argv", argv
        ), contextlib.redirect_stdout(output):
            exit_code = self.generator.main()
        return exit_code, output.getvalue()

    def test_requires_pyyaml_without_writing_output(self):
        result = subprocess.run(
            [sys.executable, "-S", str(GENERATOR_PATH), str(self.mcp_dir), str(self.config_path)],
            capture_output=True,
            text=True,
            check=False,
        )

        self.assertNotEqual(result.returncode, 0)
        self.assertIn("PyYAML is required", result.stderr)
        self.assertFalse(self.config_path.exists())

    def test_preserves_user_config_and_replaces_managed_servers(self):
        self.write_definition(
            "managed.yaml",
            {
                "name": "managed",
                "transport": "stdio",
                "command": "managed-command",
                "args": ["--serve"],
                "enabled": True,
            },
        )
        self.config_path.parent.mkdir()
        self.config_path.write_text(
            json.dumps(
                {
                    "theme": "dark",
                    "mcp_servers": {
                        "managed": {"command": "old-command", "args": []},
                        "personal": {"command": "personal-command", "args": ["--local"]},
                    },
                }
            ),
            encoding="utf-8",
        )

        exit_code, _ = self.run_generator()

        self.assertEqual(exit_code, 0)
        config = json.loads(self.config_path.read_text(encoding="utf-8"))
        self.assertEqual(config["theme"], "dark")
        self.assertEqual(config["mcp_servers"]["personal"]["command"], "personal-command")
        self.assertEqual(config["mcp_servers"]["managed"]["command"], "managed-command")
        self.assertTrue(self.config_path.with_suffix(".yaml.pre-aios.bak").exists())

    def test_removes_disabled_managed_server_without_removing_personal_server(self):
        self.write_definition("managed.yaml", {"name": "managed", "enabled": False})
        self.config_path.parent.mkdir()
        self.config_path.write_text(
            json.dumps(
                {
                    "mcp_servers": {
                        "managed": {"command": "old-command", "args": []},
                        "personal": {"command": "personal-command", "args": []},
                    }
                }
            ),
            encoding="utf-8",
        )

        exit_code, _ = self.run_generator()

        self.assertEqual(exit_code, 0)
        config = json.loads(self.config_path.read_text(encoding="utf-8"))
        self.assertNotIn("managed", config["mcp_servers"])
        self.assertIn("personal", config["mcp_servers"])

    def test_adds_external_skills_dir_to_fresh_config(self):
        self.config_path.parent.mkdir()

        exit_code, _ = self.run_generator(external_skills_dir="/home/user/.agents/skills")

        self.assertEqual(exit_code, 0)
        config = json.loads(self.config_path.read_text(encoding="utf-8"))
        self.assertEqual(config["skills"]["external_dirs"], ["/home/user/.agents/skills"])

    def test_preserves_existing_external_dirs_and_does_not_duplicate(self):
        self.config_path.parent.mkdir()
        self.config_path.write_text(
            json.dumps({"skills": {"external_dirs": ["/home/shared/team-skills"]}}),
            encoding="utf-8",
        )

        exit_code, _ = self.run_generator(external_skills_dir="/home/user/.agents/skills")
        self.assertEqual(exit_code, 0)
        config = json.loads(self.config_path.read_text(encoding="utf-8"))
        self.assertEqual(
            config["skills"]["external_dirs"],
            ["/home/shared/team-skills", "/home/user/.agents/skills"],
        )

        # Idempotent: running it again does not duplicate the entry.
        exit_code, _ = self.run_generator(external_skills_dir="/home/user/.agents/skills")
        self.assertEqual(exit_code, 0)
        config = json.loads(self.config_path.read_text(encoding="utf-8"))
        self.assertEqual(
            config["skills"]["external_dirs"],
            ["/home/shared/team-skills", "/home/user/.agents/skills"],
        )


if __name__ == "__main__":
    unittest.main()
