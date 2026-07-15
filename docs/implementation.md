# Implementation guide

## Option A — hosted MCP App server

Recommended for rapid enablement and inline rendering in MCP Apps-compatible clients.

```bash
codex mcp add drawio --url https://mcp.draw.io/mcp
codex mcp list
codex mcp get drawio
```

The hosted endpoint exposes diagram creation and shape-search capabilities. Shape search should be used before generating XML whenever official cloud or platform shapes are needed.

## Option B — local MCP Tool Server

Recommended when diagram payloads should not be sent to the hosted draw.io MCP endpoint.

Prerequisites:

- Node.js 20 or newer
- npm/npx

Install/register:

```bash
codex mcp add drawio-local -- npx -y @drawio/mcp
codex mcp list
codex mcp get drawio-local
```

Direct smoke test:

```bash
npx -y @drawio/mcp
```

## macOS desktop client

In a client that supports manual MCP registration, add one of the following:

### Remote

- Name: `drawio`
- Transport: Streamable HTTP
- URL: `https://mcp.draw.io/mcp`

### Local

- Name: `drawio-local`
- Transport: STDIO
- Command: `npx`
- Arguments: `-y @drawio/mcp`

Restart the client after saving the configuration.

## Functional acceptance test

1. Confirm the server appears in `/mcp`.
2. Ask the agent to search for the Azure OpenAI, Azure AI Search, and Azure Monitor shapes.
3. Ask it to create a small editable diagram using those shapes.
4. Open the output in draw.io.
5. Confirm that nodes, labels, and connectors remain editable.
