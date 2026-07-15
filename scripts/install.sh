#!/usr/bin/env bash
set -euo pipefail

MODE="${1:-remote}"

if ! command -v codex >/dev/null 2>&1; then
  echo "ERROR: Codex CLI was not found in PATH." >&2
  echo "Install or expose the Codex CLI, then rerun this script." >&2
  exit 1
fi

case "$MODE" in
  remote)
    codex mcp add drawio --url https://mcp.draw.io/mcp
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
    codex mcp add drawio-local -- npx -y @drawio/mcp
    ;;
  *)
    echo "Usage: $0 [remote|local]" >&2
    exit 2
    ;;
esac

codex mcp list
