#!/usr/bin/env bash
set -euo pipefail

MODE="${1:-remote}"
MCP_CONFIG=".vscode/mcp.json"

if ! command -v code >/dev/null 2>&1; then
  echo "WARN: VS Code CLI ('code') not found in PATH; skipping window reload check." >&2
fi

if [ ! -f "$MCP_CONFIG" ]; then
  echo "ERROR: $MCP_CONFIG not found. It should ship with this repo." >&2
  exit 1
fi

case "$MODE" in
  remote)
    if ! grep -q '"drawio"' "$MCP_CONFIG"; then
      echo "ERROR: 'drawio' server entry missing from $MCP_CONFIG." >&2
      exit 1
    fi
    echo "Remote server 'drawio' is configured in $MCP_CONFIG."
    ;;
  local)
    if ! command -v node >/dev/null 2>&1 || ! command -v npx >/dev/null 2>&1; then
      echo "ERROR: local mode requires Node.js and npx." >&2
      exit 1
    fi
    NODE_MAJOR="$(node -p 'process.versions.node.split(".")[0]')"
    if [ "$NODE_MAJOR" -lt 20 ]; then
      echo "ERROR: Node.js 20+ is required; found $(node --version)." >&2
      exit 1
    fi
    if ! grep -q '"drawio-local"' "$MCP_CONFIG"; then
      echo "ERROR: 'drawio-local' server entry missing from $MCP_CONFIG." >&2
      exit 1
    fi
    echo "Local server 'drawio-local' is configured in $MCP_CONFIG."
    ;;
  *)
    echo "Usage: $0 [remote|local]" >&2
    exit 2
    ;;
esac

echo "Reload the VS Code window and run 'MCP: List Servers' from the Command Palette to confirm connectivity."
