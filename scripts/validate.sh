#!/usr/bin/env bash
set -euo pipefail

FAIL=0
check() { local label="$1"; shift; if "$@" >/dev/null 2>&1; then printf 'PASS  %s\n' "$label"; else printf 'FAIL  %s\n' "$label"; FAIL=1; fi; }

check "README exists" test -f README.md
check "Agent instructions exist" test -f AGENTS.md
check "Remote config exists" test -f config/codex-remote.toml
check "Local config exists" test -f config/codex-local.toml
check "Prompt template exists" test -f templates/architecture-prompt.md
check "Mermaid example exists" test -f examples/email-triage.mmd

if command -v codex >/dev/null 2>&1; then check "Codex MCP command available" codex mcp list; else printf 'WARN  Codex CLI not present; runtime MCP validation skipped.\n'; fi
if command -v node >/dev/null 2>&1; then NODE_MAJOR="$(node -p 'process.versions.node.split(".")[0]')"; if [ "$NODE_MAJOR" -ge 20 ]; then printf 'PASS  Node.js version %s\n' "$(node --version)"; else printf 'FAIL  Node.js 20+ required for local mode; found %s\n' "$(node --version)"; FAIL=1; fi; else printf 'WARN  Node.js not present; local MCP mode unavailable.\n'; fi
exit "$FAIL"
