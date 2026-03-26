# Dharun Claude Code Plugins

A collection of Claude Code plugins for enhanced development workflows.

## 🚀 About

This repository contains custom plugins for [Claude Code](https://code.claude.com/), Anthropic's agentic coding tool. These plugins extend Claude Code's functionality with specialized commands, skills, and hooks.

## 📦 Available Plugins

| Plugin | Description | Type |
|--------|-------------|------|
| **code-review** | Automated PR code review with specialized agents | Command |
| **frontend-design** | Production-grade frontend design guidance | Skill |
| **security-guidance** | Real-time security warnings during development | Hook |

## 🔧 Installation

### Prerequisites
- [Claude Code](https://code.claude.com/docs/en/setup) installed
- Git

### Setup

1. **Clone this repository:**
   ```bash
   git clone https://github.com/dharunplugin/dharunrepo.git
   cd dharunrepo
   ```

2. **Configure Claude Code to use these plugins:**

   Add the following to your project's `.claude/settings.json`:
   ```json
   {
     "plugins": [
       {
         "name": "code-review",
         "path": "./plugins/code-review"
       },
       {
         "name": "frontend-design",
         "path": "./plugins/frontend-design"
       },
       {
         "name": "security-guidance",
         "path": "./plugins/security-guidance"
       }
     ],
     "pluginSettings": {
       "code-review": {
         "enabled": true
       },
       "frontend-design": {
         "enabled": true,
         "autoInvoke": true
       },
       "security-guidance": {
         "enabled": true,
         "autoInvoke": true
       }
     }
   }
   ```

3. **Restart Claude Code** or reload the plugins

## 📚 Plugin Details

### Code Review
- **Command:** `/code-review`
- **Purpose:** Automated PR review with confidence scoring
- **Requirements:** GitHub CLI (`gh`)

### Frontend Design
- **Auto-invoked:** Yes (for frontend files)
- **Purpose:** Provides bold design guidance and best practices
- **Focus:** Typography, animations, visual details

### Security Guidance
- **Hook:** PreToolUse
- **Purpose:** Monitors code for security issues
- **Patterns:** Command injection, XSS, eval usage, etc.

## 🛠️ Development

### Plugin Structure
```
plugins/
  plugin-name/
    .claude-plugin/
      plugin.json       # Plugin metadata
    commands/           # Slash commands (optional)
    skills/             # Skills (optional)
    hooks/              # Hooks (optional)
    README.md          # Plugin documentation
```

### Testing Locally

1. Make changes to plugin files
2. Update `.claude/settings.json` to point to your local plugin path
3. Run `claude` in your project directory
4. Test the plugin functionality

## 🤝 Contributing

Contributions are welcome! Please:
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## 📄 License

MIT License - see LICENSE file for details

## 🔗 Resources

- [Claude Code Documentation](https://code.claude.com/docs/en/overview)
- [Plugin Development Guide](https://code.claude.com/docs/en/plugins)
- [Anthropic Discord Community](https://anthropic.com/discord)

## ⚠️ Important Notes

**This is for Claude Code (CLI tool), NOT VS Code Extensions!**

If you're looking to create VS Code extensions with Copilot integration, check out:
- [GitHub Copilot Extensions](https://github.com/github/awesome-copilot)
- [VS Code Extension API](https://code.visualstudio.com/api)

Claude Code is a terminal-based AI coding assistant that works across any editor or terminal environment.

## 📝 Status

🧪 **Testing Phase** - Minimal implementation for experimentation
