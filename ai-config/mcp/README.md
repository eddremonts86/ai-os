# MCP Server definitions for AI-OS
# Each YAML file represents one MCP server. The setup/install-mac.sh
# script reads these and generates ~/.hermes/config.yaml.

# Common fields:
#   name: server name (used in mcp_servers: <name>)
#   transport: "stdio" or "http"
#   command: executable (stdio only)
#   args: command args (stdio)
#   url: server URL (http only)
#   env: environment variables (auto-loaded from local .env if not set)
#   enabled: true/false (default true)
#   description: optional
#   always_enabled_tools: list of tools to enable by default (optional)
#   tools: alias mapping (optional)
