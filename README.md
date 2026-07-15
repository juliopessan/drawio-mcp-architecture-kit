# Draw.io MCP Architecture Kit

Production-ready starter kit for generating editable architecture diagrams with the official draw.io MCP server.

## What this project provides

- Codex MCP configuration for remote and local draw.io servers
- Reusable architecture prompt standard
- Mermaid source-of-truth examples
- Validation scripts for prerequisites and MCP registration
- Security guidance for hosted versus local execution
- GitHub Actions validation

## Recommended mode

Use the hosted MCP App endpoint for the fastest setup:

```bash
codex mcp add drawio --url https://mcp.draw.io/mcp
```

Use the local MCP Tool Server for sensitive diagrams or environments that require local processing:

```bash
codex mcp add drawio-local -- npx -y @drawio/mcp
```

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

Then open Codex and run `/mcp` to confirm that `drawio` or `drawio-local` is available.

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
