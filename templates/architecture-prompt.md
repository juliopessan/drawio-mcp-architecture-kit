# Draw.io architecture generation prompt

Use the draw.io MCP tools. Do not generate a static image as the primary deliverable.

Create a native, editable draw.io architecture diagram from the Mermaid definition below.

## Visual standard

- Executive architecture slide
- 16:9 landscape canvas
- White background
- Microsoft Azure Architecture Center-inspired visual hierarchy
- Official draw.io Azure/Microsoft shapes discovered through `search_shapes`
- Left-to-right primary flow
- Orthogonal connectors
- Minimal connector crossings
- Consistent spacing and alignment
- No headline unless explicitly included in the source

## Semantic layout

- Treat the Mermaid graph as the logical source of truth, not as fixed coordinates.
- Group user channels, orchestration, AI services, business rules, data services, operations, and exception handling into semantic zones.
- Keep exception flows below the primary path.
- Keep cross-cutting services in a separate lower band.
- Attach all icons, labels, and connectors to their intended components.
- Use ELK post-layout only when automatic node placement is needed.
- Use libavoid routing only when node positions are already deliberate.
- Never apply ELK and libavoid together.

## Deliverables

1. Editable draw.io diagram.
2. Mermaid source retained in the repository.
3. Brief validation summary covering node parity, edge parity, connector attachment, and editability.

## Mermaid source

```mermaid
PASTE_MERMAID_HERE
```
