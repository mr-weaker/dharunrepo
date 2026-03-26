# Dharun Claude Code Plugins

This directory contains Claude Code plugins that extend functionality through custom commands, agents, and workflows.

## Plugins in This Directory

| Name | Description | Contents |
|------|-------------|----------|
| [code-review](./code-review/) | Automated PR code review using multiple specialized agents with confidence-based scoring to filter false positives | **Command:** `/code-review` - Automated PR review workflow<br>**Agents:** Multiple parallel agents for CLAUDE.md compliance, bug detection, and historical context |
| [frontend-design](./frontend-design/) | Create distinctive, production-grade frontend interfaces that avoid generic AI aesthetics | **Skill:** `frontend-design` - Auto-invoked for frontend work, providing guidance on bold design choices, typography, animations, and visual details |
| [security-guidance](./security-guidance/) | Security reminder hook that warns about potential security issues when editing files | **Hook:** PreToolUse - Monitors 9 security patterns including command injection, XSS, eval usage, dangerous HTML, pickle deserialization, and os.system calls |

## Installation

To use these plugins:

1. Install Claude Code globally:
```bash
npm install -g @anthropic-ai/claude-code
```

2. Navigate to your project and run Claude Code:
```bash
claude
```

3. Configure plugins in your project's `.claude/settings.json` or use the `/plugin` command to install from marketplaces.

## Plugin Structure

Each plugin follows the standard Claude Code plugin structure:

```
plugin-name/
├── .claude-plugin/
│   └── plugin.json          # Plugin metadata
├── commands/                # Slash commands (optional)
├── agents/                  # Specialized agents (optional)
├── skills/                  # Agent Skills (optional)
├── hooks/                   # Event handlers (optional)
├── .mcp.json               # External tool configuration (optional)
└── README.md               # Plugin documentation
```

## Contributing

When adding new plugins to this directory:

1. Follow the standard plugin structure
2. Include a comprehensive README.md
3. Add plugin metadata in `.claude-plugin/plugin.json`
4. Document all commands and agents
5. Provide usage examples

## Learn More

- [Claude Code Documentation](https://docs.claude.com/en/docs/claude-code/overview)
- [Plugin System Documentation](https://docs.claude.com/en/docs/claude-code/plugins)
