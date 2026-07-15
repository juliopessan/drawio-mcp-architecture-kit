# Implementation guide

Both modes are registered via the workspace [`.vscode/mcp.json`](../.vscode/mcp.json), which GitHub Copilot Chat (agent mode) auto-discovers in VS Code. No CLI registration step is required — editing that file is the registration.

## Option A — hosted MCP App server

Recommended for rapid enablement and inline rendering in MCP Apps-compatible clients.

```jsonc
// .vscode/mcp.json
{
  "servers": {
    "drawio": { "type": "http", "url": "https://mcp.draw.io/mcp" }
  }
}
```

The hosted endpoint exposes diagram creation and shape-search capabilities. Shape search should be used before generating XML whenever official cloud or platform shapes are needed.

## Option B — local MCP Tool Server

Recommended when diagram payloads should not be sent to the hosted draw.io MCP endpoint.

Prerequisites:

- Node.js 20 or newer
- npm/npx

```jsonc
// .vscode/mcp.json
{
  "servers": {
    "drawio-local": { "type": "stdio", "command": "npx", "args": ["-y", "@drawio/mcp"] }
  }
}
```

Direct smoke test:

```bash
npx -y @drawio/mcp
```

## Enabling the servers in VS Code

1. Open this workspace in VS Code with the GitHub Copilot Chat extension installed.
2. Run `Developer: Reload Window` from the Command Palette so `.vscode/mcp.json` is picked up.
3. Open Copilot Chat and switch to **Agent** mode (the mode dropdown at the bottom of the chat panel).
4. Run `MCP: List Servers` from the Command Palette and confirm `drawio` and/or `drawio-local` show as running/connected.

## Functional acceptance test

1. Confirm the server appears in `MCP: List Servers`.
2. Ask Copilot Chat (agent mode) to search for the Azure OpenAI, Azure AI Search, and Azure Monitor shapes.
3. Ask it to create a small editable diagram using those shapes.
4. Open the output in draw.io.
5. Confirm that nodes, labels, and connectors remain editable.
