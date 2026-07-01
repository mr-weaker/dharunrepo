# codestudio-plugins
The official Code Studio plugins hub — a curated collection of MCP servers, developer skills, workflow hooks, and extensibility modules designed to enhance and customize the Code Studio experience.

## Plugins Index (Skills as Plugins)

This repo exposes plugins the same way as Awesome Copilot:

- Per-plugin folders under [plugins/](plugins/) with manifests at `.github/plugin/plugin.json` (marketplace format).

- Source of truth: `skills/*/SKILL.md` with frontmatter (name, description, metadata)
- Docs: per-skill `skills/*/references/*.md`
Per-plugin manifest example: `plugins/syncfusion-react-3d-chart/.github/plugin/plugin.json`

```json
{
	"name": "syncfusion-react-3d-chart",
	"version": "33.1.44",
	"description": "...",
	"author": { "name": "Syncfusion Inc" },
	"keywords": ["syncfusion", "react", "charts", "3d"]
}
```

Example consumer flow (pseudo):

```ts
// Load and render available plugins
const registry = await fetch("./plugins.json").then(r => r.json());
for (const p of registry.plugins) {
	console.log(p.name, p.entry, p.packages);
}
```

Schema (minimal):

- id: unique slug (folder name)
- name: display name
- description: short summary
- author, category, version
- entry: path to SKILL.md
- docs: array of reference doc paths
- tags: quick filter chips
- packages: npm packages to install when applicable

See [plugins.json](plugins.json) for the generated listing.
