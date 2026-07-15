# Agent Instructions

## Draw.io diagram generation

Always use draw.io MCP tools for architecture diagrams when the server is available.

### Required behavior

- Keep Mermaid or an equivalent declarative model as the logical source of truth.
- Produce a native, editable draw.io diagram.
- Apply semantic layout instead of copying Mermaid coordinates literally.
- Use a 16:9 executive architecture composition.
- Prefer a left-to-right primary flow.
- Use orthogonal connectors and minimize crossings.
- Search the draw.io shape catalog before selecting Azure, Microsoft 365, Power Platform, AWS, GCP, Kubernetes, BPMN, or UML shapes.
- Use official service names and consistent labels.
- Separate primary flow, exception flow, data stores, and cross-cutting services.
- Attach every connector to its intended node.
- Do not leave decorative or service icons disconnected.
- Use either ELK post-layout or libavoid routing when supported; do not apply both simultaneously.
- Preserve diagram metadata and editability in exported artifacts.

### Validation checklist

1. All Mermaid nodes are represented.
2. All Mermaid edges are represented with the correct direction and labels.
3. No connector terminates in empty space.
4. No overlapping labels or icons.
5. Exception paths are visually distinguishable without relying only on color.
6. Diagram remains readable at presentation scale.
7. Output opens successfully in draw.io.
