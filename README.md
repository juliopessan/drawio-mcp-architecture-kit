# Draw.io MCP Architecture Kit

Production-ready starter kit for generating editable architecture diagrams with the official draw.io MCP server, using GitHub Copilot Chat (agent mode) in VS Code.

## What this project provides

- VS Code (`.vscode/mcp.json`) MCP configuration for remote and local draw.io servers
- Reusable architecture prompt standard
- Mermaid source-of-truth examples
- Validation scripts for prerequisites and MCP registration
- Security guidance for hosted versus local execution
- GitHub Actions validation

## Recommended mode

The workspace already ships a [`.vscode/mcp.json`](.vscode/mcp.json) with both servers defined:

- `drawio` — hosted MCP App endpoint (`https://mcp.draw.io/mcp`), fastest setup.
- `drawio-local` — local MCP Tool Server (`npx -y @drawio/mcp`), for sensitive diagrams or environments that require local processing.

## Quick start

```bash
./scripts/install.sh remote
./scripts/validate.sh
```

For local mode:

```bash
./scripts/install.sh local
./scripts/validate.sh
```

Then, in VS Code:

1. Reload the window (`Developer: Reload Window`) so Copilot picks up `.vscode/mcp.json`.
2. Open Copilot Chat and switch to **Agent** mode.
3. Run `MCP: List Servers` from the Command Palette to confirm `drawio` or `drawio-local` is connected.

## Generate a diagram

Use the prompt in [`templates/architecture-prompt.md`](templates/architecture-prompt.md), replacing the Mermaid block with your own architecture.

## Project structure

```text
.
├── config/                  MCP client configuration examples
├── docs/                    implementation and security guidance
├── examples/                Mermaid and prompt examples
├── templates/               reusable architecture prompt standard
├── scripts/                 installer and validation utilities
└── .github/workflows/       repository validation
```

## Security decision

- **Remote mode** sends MCP request content to the hosted draw.io MCP server.
- **Local tool-server mode** keeps diagram content local; the diagram is encoded in the browser URL fragment when opened.
- The LLM provider remains a separate data-processing boundary.

See [`docs/security.md`](docs/security.md).
